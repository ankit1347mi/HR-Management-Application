package com.ty.hr_app.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.stereotype.Component;

import lombok.Data;

@Entity
@Data
@Component
public class Attendance {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int numberOfStudent;
	@CreationTimestamp
	private LocalDateTime createdDateAndTime;
	@OneToOne(cascade = CascadeType.ALL)
	private Image image;
}
