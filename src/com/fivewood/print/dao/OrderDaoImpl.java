package com.fivewood.print.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.fivewood.print.entity.Order;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	public Order getOrder(String orderId) {
		
		List list = getHibernateTemplate().find("from Order o where o.orderId = ?", Integer.parseInt(orderId));
		if(list != null && list.size() > 0){
			return (Order) list.get(0);
		}
			
		return null;
	}

	public void save(Order order) {
		getHibernateTemplate().save(order);

	}

	public void update(Order order) {
		getHibernateTemplate().update(order);

	}

	public void delete(Integer orderId) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Order.class, orderId));

	}

	public void delete(Order order) {
		getHibernateTemplate().delete(order);

	}

	public List<Order> findAllOfUser(int userId) {
		return (List<Order>) getHibernateTemplate().find("from Order o where o.userId = ?", userId);
	}

	public List<Order> findByPage(int userId, int start, int max) {
		List<Order> orderList = (List<Order>) getHibernateTemplate().find("from Order o where o.userId = ?", userId);
		List<Order> reList = new ArrayList<Order>();
		for(int i = start -1; i < max && i < orderList.size(); i++) {
			reList.add(orderList.get(i));
		}
		
		return reList;
	}

}
