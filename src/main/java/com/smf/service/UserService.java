package com.smf.service;

import com.smf.bean.User;


public interface UserService {
	User getUser(String username);

	void postUser(User user);
}
