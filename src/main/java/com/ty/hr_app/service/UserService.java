package com.ty.hr_app.service;

import org.springframework.stereotype.Service;

import com.ty.hr_app.dao.UserDao;
import com.ty.hr_app.entity.User;

@Service
public class UserService {

	public User saveUser(User user) {
		UserDao dao = new UserDao();
		return dao.saveUser(user);
	}

	public User findUserByEmailAndPassword(User user) {
		UserDao dao = new UserDao();
		User user2 = null;
		try {
			user2 = dao.FindUserByEmailAndPassword(user);

		} catch (Exception e) {
			
			
		}
		return user2;
	}
}
