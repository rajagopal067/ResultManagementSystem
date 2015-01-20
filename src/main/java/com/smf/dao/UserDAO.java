package com.smf.dao;

import com.smf.bean.User;


public interface UserDAO {

	User getUser(String username);

	void postUser(User user);

}
