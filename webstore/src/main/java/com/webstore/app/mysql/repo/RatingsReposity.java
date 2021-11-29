package com.webstore.app.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webstore.app.entity.Ratings;

public interface RatingsReposity extends JpaRepository<Ratings, Long>{
	  @Query(value="select * from ratings where product_id =?1",nativeQuery = true) 
	  List<Ratings> findByrantigs(Long id);
}
