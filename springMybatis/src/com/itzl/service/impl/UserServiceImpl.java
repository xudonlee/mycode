package com.itzl.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itzl.service.UserService;
import com.itzl.dao.UserDao;
import com.itzl.pojo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao ud;
	@Override
	public User loginUser(User user) {
		
		
		if(user.getUserName()!=null && !"".equals(user.getUserName()) && user.getPwd()!=null && !"".equals(user.getPwd())) {
			user = ud.loginUser(user);
			System.out.println(user);
			return user;
		}
		
		return null;
		
	}

	@Override
	public int registered(User user) {
		
		
		return ud.registered(user);
	}

	@Override
	public User getUserName(String name) {
		return ud.getUserName(name);
		
	}

}
