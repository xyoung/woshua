package com.fivewood.print.action;

import java.util.Date;
import java.util.Map;


import com.fivewood.print.entity.Order;
import com.fivewood.print.service.OrderManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewOrderAction extends ActionSupport {
	
	
	private OrderManager orderManager;
	
	private String orderType;
	private String consignee;
	private String address;
	private String phone;
	private String email;
	private String specification;
	
	private String orderId;
	
	
	
	
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public OrderManager getOrderManager() {
		return orderManager;
	}
	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
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
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		String userId = (Integer) session.get("userId") +"";
		if(userId == null || userId.equals("")){
			//userId = 1 + "";
			return ERROR;
		}
		Order order = new Order();
		//普通类型为0，加急类型为1
		order.setOrderType(orderType.equals("option1") ? 0 : 1);
		order.setConsignee(consignee);
		order.setAddress(address);
		order.setPhone(phone);
		order.setOrderState(0);
		order.setSpecification(specification);
		order.setUserId(Integer.parseInt(userId));
		order.setGenerateTime(new Date());
		orderManager.newOrder(order);
		orderId = orderManager.fillOrderId(order);
		return SUCCESS;
	}
	
	public String edit() throws Exception {
		Order order = orderManager.findOrder(orderId);
		Map session = ActionContext.getContext().getSession();
		String userId = session.get("userId") +"";
		String realId = order.getUserId()+"";
		if(userId == null || userId.equals("") || !userId.equals(realId)) {
			
			return ERROR;
		}
		order.setOrderType(orderType.equals("option1") ? 0 : 1);
		order.setConsignee(consignee);
		order.setAddress(address);
		order.setPhone(phone);
		if(order.getOrderState() == 1) {
			order.setOrderState(4);
		}
		order.setSpecification(specification);
		orderManager.saveOrder(order);
		return SUCCESS;
	}
	
	
	
	
	

}
