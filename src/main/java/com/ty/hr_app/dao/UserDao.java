package com.ty.hr_app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.ty.hr_app.config.HrConfig;
import com.ty.hr_app.entity.User;

@Component
public class UserDao {

	static ConfigurableApplicationContext context = new AnnotationConfigApplicationContext(HrConfig.class);
	static EntityManager entityManager = (EntityManager) context.getBean("entityManager");

	public User saveUser(User user) {
		entityManager.getTransaction().begin();
		entityManager.persist(user);
		entityManager.getTransaction().commit();
		return user;
	}

	public boolean deleteUser(int id) {
		User user = entityManager.find(User.class, id);
		if (user != null) {
			entityManager.getTransaction().begin();
			entityManager.remove(user);
			entityManager.getTransaction().commit();
			return true;
		}
		return false;

	}

	public User updateUser(User user) {
		User user1 = entityManager.find(User.class, user.getId());
		if (user1 != null) {
			entityManager.getTransaction().begin();
			entityManager.merge(user);
			entityManager.getTransaction().commit();
			return user1;
		}
		return user1;
	}

	public List<User> findAll() {

		Query query = entityManager.createQuery("Select u from User u where u.role=?1");
		query.setParameter(1, "Trainer");
		List<User> list = query.getResultList();
		if (list.isEmpty()) {
			return null;
		}
		return list;
	}

	public User findUserById(int id) {
		User user1 = entityManager.find(User.class, id);
		if (user1 != null) {
			return user1;
		}
		return null;
	}

	public List<User> findUserByRole(String role) {
		Query query = entityManager.createQuery("Select u from User u where u.role=?1");
		query.setParameter(1, role);
		List<User> list = query.getResultList();
		if (list.isEmpty()) {
			return null;
		}
		return list;
	}

	public User FindUserByEmailAndPassword(User user) {
		Query query = entityManager.createQuery("Select u from User u where u.email=?1 and u.password=?2");
		query.setParameter(1, user.getEmail());
		query.setParameter(2, user.getPassword());
		User user1 = (User) query.getSingleResult();
		if (user1 != null) {
			return user1;
		}
		return null;
	}

	public List<User> findUserByStatus(boolean status) {

		Query query = entityManager.createQuery("select u from User u where u.status=?1");
		query.setParameter(1, status);
		List<User> list = query.getResultList();
		if (list.isEmpty()) {
			return null;
		}
		return list;
	}

}