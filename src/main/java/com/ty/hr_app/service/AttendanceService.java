package com.ty.hr_app.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ty.hr_app.dao.AttendanceDao;
import com.ty.hr_app.dao.BatchDao;
import com.ty.hr_app.entity.Attendance;
import com.ty.hr_app.entity.Batch;
import com.ty.hr_app.entity.Image;

@Component
public class AttendanceService {

	public Attendance saveAttendance(Batch batch, int count, Image image) {
		BatchDao batchDao = new BatchDao();

		Attendance attendance = new Attendance();
		attendance.setNumberOfStudent(count);
		attendance.setImage(image);
		AttendanceDao dao = new AttendanceDao();
		attendance = dao.saveAttendance(attendance);
		
		List<Attendance> attendances = batch.getAttendances();
		attendances.add(attendance);

		batch.setAttendances(attendances);
		batchDao.updateBatch(batch);
		return attendance;
	}
}
