package com.fivewood.print.dao;

import com.fivewood.print.entity.User;

public interface UserDao {
	
	public User findUserByUsername(String username);
	
	public User findUserByEmail(String email);
	
	public User findUser(String username, String password);
	
	public void saveUser(User user);
	
	public User findUserByUserId(String UserId);
	
	

}
