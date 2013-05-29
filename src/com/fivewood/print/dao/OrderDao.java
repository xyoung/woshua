package com.fivewood.print.dao;

import java.util.List;

import com.fivewood.print.entity.Order;

public interface OrderDao {
	
	Order getOrder(String orderId);
	
	void save(Order order);
	
	void update(Order order);
	
	void delete(Integer orderId);
	
	void delete(Order order);
	
	List<Order> findAllOfUser(int userId);
	
	List<Order> findByPage(int userId, int page, int num);

}
