package com.fivewood.print.service;

import java.util.Date;

import com.fivewood.print.dao.UserDao;
import com.fivewood.print.entity.User;

public class UserManagerImpl implements UserManager {
	
	private UserDao userDao;
	
	

	public UserDao getUserDao() {
		return userDao;
	}



	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}



	public int login(String username, String password) {
		if(userDao.findUserByUsername(username) == null)
			return 1;
		if(userDao.findUser(username, password) == null)
			return 2;
		return 0;
	}



	public Integer getUserId(String username) {
		User user = userDao.findUserByUsername(username);
		if(user == null)
			return null;
		else
			return user.getId();
	}



	public boolean emailExist(String email) {
		if(userDao.findUserByEmail(email) == null)
			return false;
		return true;
	}



	public boolean usernameExist(String username) {
		if(userDao.findUserByUsername(username) == null)
			return false;
		return true;
	}



	public Integer signIn(String email, String username, String password) {
		User user = new User();
		user.setEmail(email);
		user.setUsername(username);
		user.setPassword(password);
		user.setUserType(0);
		user.setRegistTime(new Date());
		user.setEditTime(new Date());
		userDao.saveUser(user);
		return user.getId();
	}



	public void saveAccount(String userId, String... strings) {
		User user = userDao.findUserByUserId(userId);
		if(strings[0] != null && !strings[0].equals("")){
			user.setName(strings[0]);
		}
		if(strings[1] != null && !strings[1].equals("")){
			user.setCompany(strings[1]);
		}
		if(strings[2] != null && !strings[2].equals("")){
			user.setAddress(strings[2]);
		}
		if(strings[3] != null && !strings[3].equals("")){
			user.setPhone(strings[3]);
		}
		
	}
	
	public User findUserById(String userId) {
		return userDao.findUserByUserId(userId);
	}

}
