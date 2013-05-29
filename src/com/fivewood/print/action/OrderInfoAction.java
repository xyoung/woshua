package com.fivewood.print.action;

import com.fivewood.print.entity.Order;
import com.fivewood.print.service.OrderManager;
import com.fivewood.print.util.Constant;
import com.opensymphony.xwork2.ActionSupport;

public class OrderInfoAction extends ActionSupport {
	
	private OrderManager orderManager;
	
	private String orderId;
	
	private Order order;
	
	private String state;
	private String type;
	
	

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	
	public OrderManager getOrderManager() {
		return orderManager;
	}

	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}

	@Override
	public String execute() throws Exception {
		order = orderManager.findOrder(orderId);
		type = Constant.TYPEMAP.get(order.getOrderType());
		state = Constant.STATEMAP.get(order.getOrderState());
		return SUCCESS;
	}
	
	
	

}
