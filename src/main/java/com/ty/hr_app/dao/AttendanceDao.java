package com.ty.hr_app.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ty.hr_app.config.HrConfig;
import com.ty.hr_app.entity.Attendance;
import com.ty.hr_app.entity.Batch;

public class AttendanceDao {
	static ConfigurableApplicationContext context = new AnnotationConfigApplicationContext(HrConfig.class);
	static EntityManager entityManager = (EntityManager) context.getBean("entityManager");

	public Attendance saveAttendance(Attendance attendance) {
		entityManager.getTransaction().begin();
		entityManager.persist(attendance);
		entityManager.getTransaction().commit();
		return attendance;
	}

	public List<Attendance> findAttendanceByBatchId(int id) {
		Batch batch = entityManager.find(Batch.class, id);
		if (batch != null) {
			List<Attendance> attendances = batch.getAttendances();
			if (attendances.isEmpty()) {
				return null;
			} else {
				return attendances;
			}
		}
		return null;
	}
}
