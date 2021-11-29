package com.webstore.app.adm.controller;

import java.io.Console;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webstore.app.entity.Comment;
import com.webstore.app.entity.Ratings;
import com.webstore.app.entity.User;
import com.webstore.app.mysql.repo.CommentReposity;
import com.webstore.app.mysql.repo.RatingsReposity;
import com.webstore.app.mysql.repo.UserRepository;

@Controller
@RequestMapping("/user")
public class ManagerUserController {

  private @Autowired UserRepository userRepository;
  private @Autowired RatingsReposity ratingsreposity;
  private @Autowired CommentReposity commentreposity;
  private final static int customer_group = 1;
  
  
  @PostMapping("/login")
  public String userlogin(@RequestParam String command, @RequestParam String email, @RequestParam String password, HttpServletRequest request) {
    String url = "";
    User users = new User();
    HttpSession session = request.getSession();
    users = userRepository.finduser(email, password);
    if (users != null) {
        session.setAttribute("user", users);
        url ="shop/homepage";
    } else {
        session.setAttribute("error", "Email hoặc mật khẩu không đúng.!");
        url ="shop/login";
    }
    return "redirect:/" + url;
  }
  
  @PostMapping("/insert")
  protected String userinsert(@RequestParam String command, @RequestParam String email, @RequestParam String diachi, @RequestParam String name, @RequestParam String phone, @RequestParam String password, HttpServletRequest request){
	  String url = "";
      User users = new User();
      HttpSession session = request.getSession();
      users =userRepository.findByUserEmail(email);
       if(users != null)
        {
        	session.setAttribute("error", "Email đã được đăng ký vui lòng đăng ký email khác, cảm mơn");
        	url = "shop/register";
        }
       else {
    	   User userss = new User();
    	   	userss.setUsername(name);
    	   	userss.setUserDiachi(diachi);
        	userss.setUserEmail(email);
            userss.setUserPass(password);
            userss.setGroupid(customer_group);
            userss.setPhone(phone);
            userRepository.save(userss);
            session.setAttribute("user", userss);
            url = "shop/homepage";
        }       
      return "redirect:/" + url;
  }
  
  @PostMapping("/updateinfo")
  protected String updateinfo(@RequestParam String command, @RequestParam String phone, @RequestParam String email, @RequestParam String diachi, @RequestParam String name, HttpServletRequest request){
	  String url = "";
      User users = new User();
      HttpSession session = request.getSession();
      users = userRepository.findByUserEmail(email);
       if(users != null)
        {
        	users.setUserEmail(email);
            users.setUserDiachi(diachi);
            users.setUsername(name);
            users.setPhone(phone);
            userRepository.save(users);
            session.setAttribute("user", users);
            url = "shop/homepage";
        }       
      return "redirect:/"+url;
  }
  @PostMapping("/sendratings")
  public String sendrasting(@RequestParam String command ,@RequestParam(required = false) Long id,@RequestParam Long productID,@RequestParam Long start,HttpServletRequest request) {
	  String url = "";
	  Ratings ratings = new Ratings();
	  Long productid = productID;
	  User users = new User();
	  HttpSession session = request.getSession();
	  users =userRepository.findByUserid(id);
	  if(users!=null)
	  {
		  ratings.setUserId(id);
		  ratings.setProductid(productID);
		  ratings.setRatings(start);
		  ratingsreposity.save(ratings);
		  session.setAttribute("rating", ratings);
		  url ="shop/single/"+productid;
	  }
	  else
	  {
		  url ="shop/login";
	  }
	  return "redirect:/" + url;
  }
  @PostMapping("/comment")
  public String comment(@RequestParam String command, @RequestParam(required = false) Long id, @RequestParam(required = false) Long userid, @RequestParam String name,
		  @RequestParam String email,@RequestParam String text,HttpServletRequest request) {
	  String url = "";
      Comment comments = new Comment();
      User users = new User();
      HttpSession session = request.getSession();
      users =userRepository.findByUserid(userid);
      if(users!=null)
      {
    	  comments.setCommentname(name);
	      comments.setCommentemail(email);
	      comments.setComment_text(text);
	      comments.setProductid(id);
	      commentreposity.save(comments);
	      //session.setAttribute("user", comments);
	      url = "shop/single/"+id;
	      
      }
      else
      {
    	  session.setAttribute("error", "vui lòng đăng nhập để bình luận");
        	url = "shop/login";
      }
      return "redirect:/" + url;
  }
}
