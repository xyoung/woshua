package com.fivewood.print.entity;

import java.util.Date;

/**
 * �û���ӳ��
 * @author ceit
 *
 */
public class User {
	
	private Integer id;
	private String username;
	private String password;
	private String email;
	private Date registTime;
	private Date editTime;
	private Integer userType;
	private String name;
	private String company;
	private String address;
	private String phone;
	
	
	
	public User(){
		
	}
	public User(String username, String password, String email){
		this.username = username;
		this.password = password;
		this.email = email;
		Date date = new Date();
		this.registTime = date;
		this.editTime = date;
	}


	public Integer getId() {
		return id;
	}


	private void setId(Integer id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getRegistTime() {
		return registTime;
	}


	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}


	public Date getEditTime() {
		return editTime;
	}


	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}


	public Integer getUserType() {
		return userType;
	}


	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	

}
