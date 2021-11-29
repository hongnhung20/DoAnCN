package com.webstore.app.mysql.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.webstore.app.entity.User;

//interface trả về lệnh gọi
public interface UserRepository extends JpaRepository<User, Long> {
	 @Query(value="Select * from users where user_email= ?1", nativeQuery = true)
	  User findByUserEmail(String mail);
	  User findByUserEmailAndUserPassAndGroupid(String mail, String password, int groupId);
	 
	  @Query(value = "Select * from users where user_email = ?1 and user_pass = ?2 and usergroup_id = 1", nativeQuery = true)
	  User finduser(String email, String password);
	  
	  @Query(value = "Select * from users where user_email = ?1 and user_pass = ?2 and usergroup_id = 2", nativeQuery = true)
	  User findAdmin(String email, String password);
	  
	  @Query(value="Select * from users where user_id= ?1", nativeQuery = true)
	  User findByUserid(Long id);
}
