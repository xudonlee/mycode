package com.itzl.service;

import com.itzl.pojo.User;

public interface UserService {
	public User loginUser(User user);
	public User getUserName(String name);
	public int registered(User user);
}
