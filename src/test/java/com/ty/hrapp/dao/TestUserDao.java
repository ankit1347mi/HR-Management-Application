package com.ty.hrapp.dao;

import java.util.List;

import org.junit.Test;

import com.ty.hr_app.dao.UserDao;
import com.ty.hr_app.entity.User;

public class TestUserDao {
	UserDao dao = new UserDao();

//	@Test
//	public void saveUser() {
//		UserDao dao=new UserDao();
//		User user=new User();
//		user.setName("Seema");
//		user.setEmployId("TY0001");
//		user.setEmail("seema@gmail");
//		user.setPhone(987562145);
//		user.setPassword("1234");
//		user.setRole("trainer");
//		user.setStatus(true);
//		
//		User dbuser=dao.saveUser(user);
//		if (dbuser!=null) {
//			System.out.println("passed");
//		} else {
//			System.out.println("Failed");
//		}
//		
//	}
//	
//	public void deleteUser() {
//		boolean value=dao.deleteUser(54);
//		if (value) {
//			System.out.println("passed");
//		} else {
//			System.out.println("Failed");
//		}
//	}
//	
//	@Test
//	public void updateUser() {
//		User user=dao.findUserById(8);
//		user.setStatus(false);
//		User user1=dao.updateUser(user);
//		if (!user1.isStatus()) {
//			System.out.println("Passed");
//		}
//		else {
//			System.out.println("Failed");
//		}
//	}
//	
//	@Test
//	public void	findAllUser() {
//		List<User>users=dao.findAll();
//		if (users!=null) {
//			System.out.println("Passed");
//		}else {
//			System.out.println("Failed");
//		}
//	}

//	@Test
//	public void findUserByRole() {
//		List<User> users=dao.findUserByRole("trainer");
//		if (users!=null) {
//			System.out.println("Passed");
//		} else {
//			System.out.println("Failed");
//		}
//	}

	@Test
	public void findUserByStatus() {
		List<User> users = dao.findUserByStatus(true);
		if (users != null) {
			System.out.println("Passed");
		} else {
			System.out.println("Failed");
		}
	}

	@Test
	public void findUserByEmailAndPassword() {
		User user = new User();
		user.setEmail("abc@gmail");
		user.setPassword("1234");
		User users = dao.FindUserByEmailAndPassword(user);
		if (users != null) {
			System.out.println("Passed");
		} else {
			System.out.println("Failed");
		}
	}

}
