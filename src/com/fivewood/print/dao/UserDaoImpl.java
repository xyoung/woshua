package com.fivewood.print.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.fivewood.print.entity.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	public User findUserByUsername(String username) {
		
		List list = getHibernateTemplate().find("from User u where u.username = ? ", username);
		if(list != null && list.size() > 0 ){
			return (User) list.get(0);
		}
		return null;
	}
	
	public User findUserByEmail(String emial) {
		
		List list = getHibernateTemplate().find("from User u where u.email = ? ", emial);
		if(list != null && list.size() > 0 ){
			return (User) list.get(0);
		}
		return null;
	}

	public User findUser(String username, String password) {
		List list = getHibernateTemplate().find("from User u where u.username = ? and password = ?", username, password);
		if(list != null && list.size() > 0 ){
			return (User) list.get(0);
		}
		return null;
	}

	public void saveUser(User user) {
		getHibernateTemplate().save(user);
		
	}

	public User findUserByUserId(String UserId) {
		return getHibernateTemplate().get(User.class, Integer.parseInt(UserId));
		
	}

	

}
