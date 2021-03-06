package com.webstore.app.adm.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.webstore.app.entity.Bill;
import com.webstore.app.entity.BillDetail;
import com.webstore.app.entity.Category;
import com.webstore.app.entity.Product;
import com.webstore.app.entity.User;
import com.webstore.app.model.CustomUrl;
import com.webstore.app.model.Message;
import com.webstore.app.model.ProductDto;
import com.webstore.app.model.Value;
import com.webstore.app.mysql.repo.BillDetailRepository;
import com.webstore.app.mysql.repo.BillRepository;
import com.webstore.app.mysql.repo.CategoryRepository;
import com.webstore.app.mysql.repo.ProductRepository;
import com.webstore.app.mysql.repo.UserRepository;

import sun.net.www.content.audio.aiff;

@Controller
@RequestMapping("/admin")
public class AdminViewController {

  private @Autowired UserRepository userRepository;
  private @Autowired CategoryRepository categoryRepository;
  private @Autowired ProductRepository productRepository;
  private @Autowired BillRepository billRepository;
  private @Autowired BillDetailRepository billDetailRepository;

  @GetMapping("/login")
  public ModelAndView login() {
    ModelAndView mv = new ModelAndView("/admin/login");
    return mv;
  }

  @PostMapping("/login")
  public String submitLogin(@RequestParam String email, @RequestParam String password, HttpServletRequest request) {
    String url = "";
    User user = userRepository.findAdmin(email, password);
    if (user != null) {
      request.getSession().setAttribute("useradmin", user);
      url = "admin/home";
    } else {
      request.getSession().setAttribute("error", "Email ho???c m???t kh???u kh??ng ????ng.!");
      url = "admin/login";
    }
    return "redirect:/" + url;
  }

  @RequestMapping("/home")
  public ModelAndView home(HttpServletRequest request) {

    HttpSession session  = request.getSession();
    if (session.getAttribute("useradmin") == null) {
      return new ModelAndView("redirect:/admin/login");
    }

    ModelAndView mv = new ModelAndView("admin/home");

    return mv;
  }

  @GetMapping("/logout")
  public ModelAndView logout(HttpServletRequest request) {
    request.getSession().removeAttribute("useradmin");
    return new ModelAndView("/admin/login");
  }

  @GetMapping("/manager_category")
  public ModelAndView get() {
    ModelAndView mv = new ModelAndView("admin/manager_category");
    mv.addObject("cates", categoryRepository.findAll());
    return mv;
  }

  @GetMapping("/manager_category/delete/{id}")
  public String get(@PathVariable Long id) {
    categoryRepository.deleteById(id);
    return "redirect:/admin/manager_category";
  }

  @GetMapping("/update_category/{id}/{name}")
  public ModelAndView get(@PathVariable Long id, @PathVariable String name) {
    ModelAndView mv = new ModelAndView("admin/update_category");
    mv.addObject("cate", categoryRepository.findByIdAndName(id, name));
    return mv;
  }

  @GetMapping("/category/add")
  public ModelAndView cateegoryAdd() {
    return new ModelAndView("admin/insert_category");
  }


  @PostMapping("/manager_category")
  public String post(@RequestParam String command, @RequestParam(required = false) Long id, @RequestParam String cateName, Model m) {

    String url = "", error = "";
    if (StringUtils.isEmpty(cateName)) {
      error = "Vui l??ng nh???p t??n danh m???c!";
      m.addAttribute("error", error);
    }

    try {
      if (error.length() == 0) {
        switch (command) {
        case "insert":
          categoryRepository.save(new Category(cateName));
          url = "/admin/manager_category";
          break;
        case "update":
          categoryRepository.save(new Category(id, cateName));
          url = "/admin/manager_category";
          break;
        }
      } else {
        url = "/admin/insert_category";
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    return "redirect:"+url;
  }

  @SuppressWarnings("null")
@GetMapping("/manager_product/{page}")
  public ModelAndView product(@PathVariable Long page) {
    ModelAndView mv = new ModelAndView("admin/manager_product");
    List<Product> prods = productRepository.findAll();
    mv.addObject("prods", prods);
    int perPage = 5;
    int size = (int) Math.ceil(prods.size()/perPage)+1;
    int[] PageNumber = new int[size] ;
    for(int i=0;i < size;i++)
    {
    	PageNumber[i] = i+1;
    }
    mv.addObject("maxPage", size);
    mv.addObject("PageNumber",PageNumber);
    mv.addObject("curentPage",page);
    return mv;
  }

  @GetMapping("/product/add")
  public ModelAndView productAdd() {
    ModelAndView mv = new ModelAndView("admin/insert_product");
    mv.addObject("cates", categoryRepository.findAll());
    return mv;
  }

  @GetMapping("/product/update_product/{id}")
  public ModelAndView productUpdate(@PathVariable Long id) {
    ModelAndView mv = new ModelAndView("admin/update_product");
    Product p = productRepository.findById(id).get();
    mv.addObject("cates", categoryRepository.findAll());
    mv.addObject("product", p);
    mv.addObject("cate", categoryRepository.findById(p.getCategoryId()).get());
    return mv;
  }

  @PostMapping("/product/manager_product")
  public @ResponseBody CustomUrl prodUpdate(@RequestBody ProductDto dto, HttpServletRequest request) {
    String error = "";
    if (!StringUtils.isEmpty(dto.getProdName())) {
      error = "Vui l??ng nh???p t??n s???n ph???m!";
      request.setAttribute("error", error);
    }

    Product p = new Product(dto.getCateId(), dto.getProdName(), "/resources/images/" + dto.getImage(), dto.getPrice(), dto.getDescrip());
    p.setProductBuy(dto.getBuy());
    p.setProductProvider(dto.getProvider());
    p.setProductQuantity(dto.getQuantity());
    CustomUrl url = new CustomUrl();
    try {
      switch (dto.getCommand()) {
      case "insert":
        productRepository.save(p);
        url.setUrl("/admin/manager_product/1");
        break;
      case "update":
        p.setProductID(dto.getProdId());
        productRepository.save(p);
        url.setUrl("/admin/manager_product/1");
        break;
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    return url;
  }

  @PostMapping("/product/file")
  public @ResponseBody String uploadProductFile(@ModelAttribute MultipartFile hinhanh, HttpServletRequest request) {
    ServletContext servletContext = request.getServletContext();
    String contextPath = servletContext.getRealPath("/");
    String filename = contextPath + "/resources/images/" + hinhanh.getOriginalFilename();

    try {
      hinhanh.transferTo(new File(filename));
    } catch (IllegalStateException e1) {
      System.out.println(e1);
    } catch (IOException e1) {
      System.out.println(e1);
    }

    return hinhanh.getOriginalFilename();
  }

  @GetMapping("/product/delete/{id}")
  public String productDelete(@PathVariable Long id) {
    productRepository.deleteById(id);
    return "redirect:/admin/manager_product";
  }

  @GetMapping("/manager_bill/{page}")
  public ModelAndView bill(@PathVariable Long page) {
    ModelAndView mv = new ModelAndView("/admin/manager_bill");
    List<Bill> bills = billRepository.findAll();
    bills.forEach(i -> {
      i.setUserEmail(userRepository.findById(i.getUserId()).get().getUserEmail());
    });
    mv.addObject("bills", bills);
    int perPage = 5;
    int size = (int) Math.ceil(bills.size()/perPage)+1;
    int[] PageNumber = new int[size] ;
    for(int i=0;i < size;i++)
    {
    	PageNumber[i] = i+1;
    }
    mv.addObject("maxPage", size);
    mv.addObject("PageNumber",PageNumber);
    mv.addObject("curentPage",page);
    
    return mv;
  }

  @GetMapping("/bill/delete/{id}")
  public String deletebill(@PathVariable Long id) {
    billRepository.deleteById(id);
    return "redirect:/admin/manager_bill";
  }

  @GetMapping("/bill/update/{id}/{stt}")
  public @ResponseBody Message updatebill(@PathVariable Long id, @PathVariable Short stt) {
    Bill bill = billRepository.findById(id).get();
    List<BillDetail> details = billDetailRepository.findByBillId(bill.getId());
    List<Product> products = new LinkedList<>();
    for(BillDetail d: details) {
      Product p = productRepository.findById(d.getProductId()).get();
      if (d.getQuantity() > p.getProductQuantity()) {
        return new Message("eq");
      }
      p.setProductQuantity(p.getProductQuantity() - d.getQuantity());
      products.add(p);
    }
    
    productRepository.saveAll(products);
    billRepository.updateStatus(id, stt);
    
    return new Message("ok");
  }

  @GetMapping("/chart")
  public ModelAndView  chart() {
    List<Value> chartDatas = new LinkedList<>();
    for (Category category : categoryRepository.findAll()) {
      chartDatas.add(new Value(category.getCategoryName(),
          productRepository.findByCategoryId(category.getCategoryID()).size()));
    }
    ModelAndView mv = new ModelAndView("admin/manager_chart");
    mv.addObject("datas", chartDatas);
    return mv;
  }
}
