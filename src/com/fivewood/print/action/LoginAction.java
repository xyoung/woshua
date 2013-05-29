package com.fivewood.print.action;

import java.util.Map;

import com.fivewood.print.service.UserManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	
	String type = "登录";
	
	private String username;
	private String password;
	private String vercode;
	private String usernameError;
	private String passwordError;
	private String vercodeError;
	
	
	
	
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




	private UserManager userManager;

	
	
	
	public UserManager getUserManager() {
		return userManager;
	}




	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
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
		if(vercode == null || vercode.equals("")) {
			vercodeError = "*请输入验证码";
			return INPUT;
		}else if(!vercode.equalsIgnoreCase(realVercode)) {
			vercodeError = "*验证码不正确";
			return INPUT;
		}
		if(username == null || username.equals("")) {
			usernameError = "*请填写用户名";
			return INPUT;
		}
		int state = userManager.login(username, password);
		switch(state){
		case 0:
			Integer userId = userManager.getUserId(username);
			session.put("userId", userId);
			session.put("username", username);
			return SUCCESS;
		case 1:
			usernameError = "*此用户名不存在！！";
			return INPUT;
		case 2:
			passwordError = "*密码输入错误！！";
			return INPUT;
		}
		
		return INPUT;
		
	}
	
	public String loginIndex() throws Exception {
		/*Map session = ActionContext.getContext().getSession();
		String userId = (String) session.get("userId");
		//如果用户已登录，跳转到其他页面，后期可以在过滤器中统一筛选
		if(userId != null) {
			return SUCCESS;
		} else {
			return LOGIN;
		}*/
		return SUCCESS;
		
	}
	
	public String logout() throws Exception {
		Map session = ActionContext.getContext().getSession();
		session.put("userId", null);
		
		return SUCCESS;
	}


}
