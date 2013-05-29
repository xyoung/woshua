package com.fivewood.print.action;

import java.util.Map;

import org.apache.struts2.json.annotations.JSON;
import org.jboss.cache.loader.s3.S3CacheLoader;

import com.fivewood.print.entity.Order;
import com.fivewood.print.service.OrderManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditOrderAction extends ActionSupport{

	private OrderManager orderManager;
	private String errorType;

	private String orderType;
	private String consignee;
	private String address;
	private String phone;
	private String email;
	private String specification;
	
	
	
	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	private Integer save;
	
	
	
	private String orderId;
	
	private Boolean delet;
	
	private int page;
	
	

	public Integer getSave() {
		return save;
	}

	public void setSave(Integer save) {
		this.save = save;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@JSON(serialize=false) 
	public OrderManager getOrderManager() {
		return orderManager;
	}

	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}

	@JSON(serialize=false) 
	public String getOrderType() {
		return orderType;
	}

	
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	@JSON(serialize=false) 
	public String getConsignee() {
		return consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	@JSON(serialize=false) 
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@JSON(serialize=false) 
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@JSON(serialize=false) 
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@JSON(serialize=false) 
	public String getErrorType() {
		return errorType;
	}

	public Boolean getDelet() {
		return delet;
	}

	public void setDelet(Boolean delete) {
		this.delet = delete;
	}

	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}

	public String execute() throws Exception {
		Order order = orderManager.findOrder(orderId);
		Map session = ActionContext.getContext().getSession();
		String userId = session.get("userId") +"";
		String realUserId = order.getUserId() +"";
		if(userId == null || userId.equals("") || !userId.equals(realUserId)) {
			errorType = "201";
			return ERROR;
		}
		
		orderType = order.getOrderType() +"";
		consignee = order.getConsignee();
		address = order.getAddress();
		phone = order.getPhone();
		specification = order.getSpecification();
		//email = order.get
		
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		//需要判断此用户是否可以删除订单
		//还需要判断此订单是否在可删除状态
		//m目前没有加，后边一定要加上
		//try {
		Map session = ActionContext.getContext().getSession();
		String userId = session.get("userId")+"";
		if(userId == null || userId.equals("")) {
			errorType = "201";
			return ERROR;
		}
		
		delet = orderManager.deleteOrder(orderId);
			//delete = true;
		//} catch(Exception e) {
			//delete = false;
		//}
		
		return SUCCESS;
	}
	
	public String edit() throws Exception {
		Order order = orderManager.findOrder(orderId);
		Map session = ActionContext.getContext().getSession();
		String userId = session.get("userId") +"";
		if(userId == null || userId.equals("") || !userId.equals(order.getUserId())) {
			errorType = "201";
			return ERROR;
		}
		
		
		
		return SUCCESS;
	}
	
	
	
}
