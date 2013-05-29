package com.fivewood.print.action;



import java.util.Map;

import com.fivewood.print.entity.User;
import com.fivewood.print.service.UserManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AccountAction extends ActionSupport {
	
	private UserManager userManager;
	private String name;
	private String company;
	private String address;
	private String phone;
	private String email;
	
	private Integer reg;
	private String info;
	private Integer save = 1;
	
	
	
	
	
	public Integer getSave() {
		return save;
	}
	public void setSave(Integer save) {
		this.save = save;
	}
	public Integer getReg() {
		return reg;
	}
	public void setReg(Integer reg) {
		this.reg = reg;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public UserManager getUserManager() {
		return userManager;
	}
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
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
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String saveAccount() throws Exception {
		Map session = ActionContext.getContext().getSession();
		String userId = (Integer) session.get("userId") + "";
		if(userId == null || userId.equals("")){
			//userId = 1 + "";
			return ERROR;
		}
		userManager.saveAccount(userId, name, company, address, phone);
		save = 2;
		return SUCCESS;
	}
	
	public String userInfo() throws Exception {
		if(reg != null && reg == 1) {
			info = "注册成功，请补全个人信息";
		}
		Map session = ActionContext.getContext().getSession();
		String userId = (Integer) session.get("userId") +"";
		if(userId == null || userId.equals("")){
			//userId = 1 + "";
			return ERROR;
		}
		User user = userManager.findUserById(userId);
		name = user.getName();
		company = user.getCompany();
		address = user.getAddress();
		phone = user.getPhone();
		email = user.getEmail();
		return SUCCESS;
	}
	
	
	
	
	

}
