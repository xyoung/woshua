package com.fivewood.print.service;

import com.fivewood.print.entity.User;

public interface UserManager {
	
	public int login(String username, String password);
	
	public Integer getUserId(String username);
	
	public boolean emailExist(String email);
	
	public boolean usernameExist(String username);
	
	public Integer signIn(String email, String username, String password);
	
	public void saveAccount(String userId,String ...strings);
	
	public User findUserById(String userId);

}
