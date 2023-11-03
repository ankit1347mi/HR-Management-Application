package com.ty.hr_app.dao;

import javax.persistence.EntityManager;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.ty.hr_app.config.HrConfig;
import com.ty.hr_app.entity.Image;

public class ImageDao {

	static ConfigurableApplicationContext context = new AnnotationConfigApplicationContext(HrConfig.class);
	static EntityManager entityManager = (EntityManager) context.getBean("entityManager");

	public void save(Image image) {
		entityManager.getTransaction().begin();
		entityManager.persist(image);
		entityManager.getTransaction().commit();

	}
}
