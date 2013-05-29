package com.fivewood.print.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.fivewood.print.entity.Order;
import com.fivewood.print.service.OrderManager;
import com.fivewood.print.util.DateJsonValueProcessor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {
	
	private OrderManager orderManager;
	private JSONArray orderList;
	private String sss;
	//第几页
	private int page = 1;
	//总页数
	private int pageNum;
	//记录总数
	private int colNum;
	
	
	
	
	
	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public int getPageNum() {
		return pageNum;
	}



	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}



	public int getColNum() {
		return colNum;
	}



	public void setColNum(int colNum) {
		this.colNum = colNum;
	}



	public String getSss() {
		return sss;
	}



	public void setSss(String sss) {
		this.sss = sss;
	}



	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}
	
	
	
	public JSONArray getOrderList() {
		return orderList;
	}



	public void setOrderList(JSONArray orderList) {
		this.orderList = orderList;
	}
	
	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		Object userId = session.get("userId");
		if(userId == null || userId.toString().equals("")) {
			return ERROR;
		}
		
		return SUCCESS;
	}



	public String getOnePage() throws Exception {
		
		Map session = ActionContext.getContext().getSession();
		Integer userId = (Integer) session.get("userId");
		if(userId == null) {
			return ERROR;
		}
		sss = "sda";
		List<Order> oList = orderManager.findOrdersByUser(userId);
		colNum = oList.size();
		if(oList.size() % 8 == 0){
			pageNum =oList.size()/8;
		} else {
			pageNum = oList.size()/8 + 1;
		}
		if(page == 0) {
			page = 1;
		}
		if(page > 1 && page > pageNum) {
			page = pageNum;
		}
		List<Order> orderList1 = orderManager.findOrdersByUser(userId, page, 8);
		orderList = new JSONArray();
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd hh:mm:ss"));  
		for(Order o : orderList1){
			orderList.add(JSONObject.fromObject(o, jsonConfig));
		}
		
		//Thread.sleep(10000);
		//System.out.println(orderList.toString());
		return SUCCESS;
	}
	
	

}
