package com.smf.service;


import org.springframework.beans.factory.annotation.Autowired;

import com.smf.bean.User;
import com.smf.dao.UserDAO;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO;

	@Override
	public User getUser(String keyword) {
		return getUserDAO().getUser(keyword);
	}

	@Override
	public void postUser(User user) {
		getUserDAO().postUser(user);
	}
	
	/**
	 * @return the userDAO
	 */
	public UserDAO getUserDAO() {
		return userDAO;
	}

	/**
	 * @param userDAO the userDAO to set
	 */
	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
