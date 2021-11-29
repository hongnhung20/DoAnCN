package com.webstore.app.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webstore.app.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

  List<Product> findByCategoryId(Long id);
  
  List<Product> findByProductName(String name);
  @Query(value = "select * from product where product_name like %?1%", nativeQuery = true)
  List<Product> findByFirstnameLike(String keyword);
  
  @Query(value = "SELECT * FROM product ORDER BY product_price DESC LIMIT 16", nativeQuery = true)
  List<Product> findTop6Products();
  @Query(value = "SELECT * FROM `product` WHERE product_price BETWEEN ?1 AND ?2", nativeQuery = true)
  List<Product> findByProductPrice(double value1,double value2);
}
