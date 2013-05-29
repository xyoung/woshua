package com.fivewood.print.service;

import java.util.List;

import com.fivewood.print.entity.Order;

public interface OrderManager {
	
	List<Order> findOrdersByUser(int userId);
	public Order findOrder(String orderId);
	
	public void newOrder(Order order);
	
	public String fillOrderId(Order order);
	
	List<Order> findOrdersByUser(int userId, int page, int num);
	
	public boolean deleteOrder(String orderId);
	
	public void saveOrder(Order order);
	
	

}
