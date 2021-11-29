package com.webstore.app.mysql.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.webstore.app.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
  
	@Query(value = "select * from category where category_id = ?1 and category_name = ?2", nativeQuery = true)
	  public Category findByIdAndName(Long id, String name);

}
