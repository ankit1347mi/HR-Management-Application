package com.ty.hr_app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ty.hr_app.config.HrConfig;
import com.ty.hr_app.entity.Batch;
import com.ty.hr_app.entity.User;

public class BatchDao {

	static ConfigurableApplicationContext context = new AnnotationConfigApplicationContext(HrConfig.class);
	static EntityManager entityManager = (EntityManager) context.getBean("entityManager");

	public Batch saveBatch(Batch batch, int id) {
		User user = entityManager.find(User.class, id);

		if (user != null & user.getRole().equalsIgnoreCase("Trainer")) {

			entityManager.getTransaction().begin();
			entityManager.persist(batch);
			List<Batch> batchs = user.getBatchs();
			batchs.add(batch);
			user.setBatchs(batchs);
			entityManager.merge(user);
			entityManager.getTransaction().commit();
			return batch;
		}
		return null;

	}

	public Batch updateBatch(Batch batch) {
		Batch batch2 = entityManager.find(Batch.class, batch.getId());
		if (batch2 != null) {
			entityManager.getTransaction().begin();
			entityManager.persist(batch);
			entityManager.getTransaction().commit();
			return batch;
		}
		return null;

	}

	public List<Batch> findBatchByUserId(int id) {
		User user = entityManager.find(User.class, id);
		if (user != null) {
			List<Batch> batchs = user.getBatchs();
			if (batchs.isEmpty()) {
				return null;

			} else {
				return batchs;
			}
		}
		return null;
	}

	public Batch findBatchById(int id) {
		Batch batch1 = entityManager.find(Batch.class, id);
		if (batch1 != null) {
			return batch1;
		}
		return null;
	}

	public List<Batch> findAllBatches() {
		Query query = entityManager.createQuery("select b from Batch b");
		List<Batch> batchs = query.getResultList();
		if (batchs.isEmpty()) {
			return null;
		} else {
			return batchs;
		}
	}
}
