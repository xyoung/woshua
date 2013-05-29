package com.fivewood.print.service;

import java.util.List;

import com.fivewood.print.dao.OrderDao;
import com.fivewood.print.entity.Order;

public class OrderManagerImpl implements OrderManager {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	public Order findOrder(String orderId) {
		return orderDao.getOrder(orderId);
	}

	public List<Order> findOrdersByUser(int userId) {
		return orderDao.findAllOfUser(userId);
	}
	
	public void newOrder(Order order) {
		orderDao.save(order);
	}

	public String fillOrderId(Order order) {
		
		//订单号比订单id多100000000
		order.setOrderId(100000000 + order.getId());
		orderDao.update(order);
		return order.getOrderId() + "";
		
	}

	public List<Order> findOrdersByUser(int userId, int page, int num) {
		return orderDao.findByPage(userId, 1+(page - 1) * num, page * num);
	}

	public boolean deleteOrder(String orderId) {
		Order order = orderDao.getOrder(orderId);
		if(order == null) {
			return false;
		}
		orderDao.delete(order);
		return true;
		
	}

	public void saveOrder(Order order) {
		orderDao.update(order);
		// TODO Auto-generated method stub
		
	}

}
