package com.fivewood.print.entity;

import java.util.Date;

public class Order {
	
	private Integer id;
	private Integer orderId;
	private Date generateTime;
	private Integer orderState;
	private Integer userId;
	private String consignee;
	private String address;
	private String phone;
	private String filePath;
	private String specification;
	private Double price; 
	private Integer orderType;
	private String info;
	
	public Order() {
		
	}
	
	public Order(Integer orderId, Integer userId, Date generateTime) {
		this.orderId = orderId;
		this.userId = userId;
		this.generateTime = generateTime;
	}
	
	
	
	
	
	public Integer getId() {
		return id;
	}
	private void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Date getGenerateTime() {
		return generateTime;
	}
	public void setGenerateTime(Date generateTime) {
		this.generateTime = generateTime;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
	public void setAddress(String adrress) {
		this.address = adrress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getOrderType() {
		return orderType;
	}
	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
	
	

}
