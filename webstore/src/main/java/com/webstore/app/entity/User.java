package com.webstore.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import com.webstore.app.mysql.repo.UserRepository;

@Entity
@Table(name = "users")
public class User{

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_id")
  private Long    id;

  @Column(name = "user_email")
  private String  userEmail;
  
  private String phone;

  @Column(name = "user_pass")
  private String  userPass;

  @Column(name = "user_role")
  private boolean userRole;

  @Column(name = "usergroup_id")
  private int     groupid;
  
  @Column(name = "user_name")
  private String  username;
  
  @Column(name = "user_diachi")
  private String userDiachi;
  
  public User(Long id, String userEmail, String phone, String userPass, boolean userRole, int groupid, String username,
		String userDiachi) {
	super();
	this.id = id;
	this.userEmail = userEmail;
	this.phone = phone;
	this.userPass = userPass;
	this.userRole = userRole;
	this.groupid = groupid;
	this.username = username;
	this.userDiachi = userDiachi;
 }

  public User() {}

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public int getGroupid() {
    return groupid;
  }

  public void setGroupid(int groupid) {
    this.groupid = groupid;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUserEmail() {
    return userEmail;
  }

  public void setUserEmail(String userEmail) {
    this.userEmail = userEmail;
  }

  public String getUserPass() {
    return userPass;
  }

  public void setUserPass(String userPass) {
    this.userPass = userPass;
  }

  public boolean isUserRole() {
    return userRole;
  }

  public void setUserRole(boolean userRole) {
    this.userRole = userRole;
  }

  public String getUsername() {
	return username;
  }
	
  public void setUsername(String username) {
	this.username = username;
  }
	
  public String getUserDiachi() {
	return userDiachi;
  }
	
  public void setUserDiachi(String userDiachi) {
	this.userDiachi = userDiachi;
  }
  //
  @Override
  public String toString() {
	  return "User [id=" + id + ", userEmail=" + userEmail + ", phone=" + phone + ", userPass=" + userPass
			  + ", userRole=" + userRole + ", groupid=" + groupid + ", username=" + username + ", userDiachi="
			  + userDiachi + "]";
  }
}
