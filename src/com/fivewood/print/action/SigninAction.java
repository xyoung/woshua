package com.fivewood.print.action;

import java.util.Map;

import com.fivewood.print.service.UserManager;
import com.fivewood.print.util.FormatUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SigninAction extends ActionSupport {
	
	String type = "注册";
	
	private String email = "";
	private String username = "";
	private String password = "";
	private String vercode = "";
	
	private String emailError;
	private String usernameError;
	private String passwordError;
	private String vercodeError;
	
	private UserManager userManager;
	
	private Integer reg = 1;
	
	
	
	
	
	
	
	

	
	
	public Integer getReg() {
		return reg;
	}




	public void setReg(Integer reg) {
		this.reg = reg;
	}




	public UserManager getUserManager() {
		return userManager;
	}




	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}




	public String getVercode() {
		return vercode;
	}




	public void setVercode(String vercode) {
		this.vercode = vercode;
	}




	public String getVercodeError() {
		return vercodeError;
	}




	public void setVercodeError(String vercodeError) {
		this.vercodeError = vercodeError;
	}




	public String getEmailError() {
		return emailError;
	}




	public void setEmailError(String emailError) {
		this.emailError = emailError;
	}




	public String getUsernameError() {
		return usernameError;
	}




	public void setUsernameError(String usernameError) {
		this.usernameError = usernameError;
	}




	public String getPasswordError() {
		return passwordError;
	}




	public void setPasswordError(String passwordError) {
		this.passwordError = passwordError;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
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




	public String getType() {
		return type;
	}




	public void setType(String type) {
		this.type = type;
	}




	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		String realVercode = (String) session.get("rand");
		session.put("rand", null);
		if(vercode == null || vercode == "") {
			vercodeError = "请输入验证码";
			System.out.println(1);
			return INPUT;
		}
		if(!vercode.equalsIgnoreCase(realVercode)) {
			vercodeError = "验证码输入不正确";
			System.out.println(2);
			return INPUT;
		}
		if(email == null || email == "") {
			emailError = "请输入邮箱";
			System.out.println(3);
			return INPUT;
		}
		if(!FormatUtil.rightEmail(email)) {
			emailError = "邮箱格式不正确";
			System.out.println(4);
			return INPUT;
		}
		if(userManager.emailExist(email)) {
			emailError = "邮箱已被使用";
			System.out.println(5);
			return INPUT;
		}
		if(username == null || username == "") {
			usernameError = "用户名不能为空";
			System.out.println(6);
			return INPUT;
		}
		if(userManager.usernameExist(username)) {
			usernameError = "用户名已被使用";
			System.out.println(7);
			return INPUT;
		}
		if(password == null || password == "") {
			passwordError = "密码不能为空";
			System.out.println(8);
			return INPUT;
		}
		
		int userId = userManager.signIn(email, username, password);
		session.put("userId", userId);
		session.put("username", username);
		return SUCCESS;
		
		
		
	}
	
	

	
	
	
}
