package com.fivewood.print.action;

import com.fivewood.print.service.UserManager;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.json.annotations.JSON;   

@SuppressWarnings("serial") 
public class ValidateAction extends ActionSupport{
	
	private UserManager userManager;
	
	private Boolean emailExist = true;
	private Boolean usernameExist = true;
	
	private String email = "";
	private String username = "";
	
	
	@JSON(serialize=false) 
	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public boolean getEmailExist() {
		return emailExist;
	}

	public void setEmailExist(boolean emailValid) {
		this.emailExist = emailValid;
	}

	public boolean getUsernameExist() {
		return usernameExist;
	}

	public void setUsernameExist(boolean usernameValid) {
		this.usernameExist = usernameValid;
	}
	
	@JSON(serialize=false) 
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@JSON(serialize=false) 
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String emailExist() throws Exception {
		emailExist = userManager.emailExist(email);
		return SUCCESS;
	}
	
	public String usernameExist() throws Exception {
		usernameExist = userManager.usernameExist(username);
		return SUCCESS;
	}
	
	

}
