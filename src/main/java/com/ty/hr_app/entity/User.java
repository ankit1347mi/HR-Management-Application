package com.ty.hr_app.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Entity
@Data
@Table(name = "userinfo")
@Component
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(unique = true)
	private String employId;

	private String name;
	@Column(unique = true)
	private String email;

	private long phone;

	private String password;

	private String role;

	private boolean status;
	@OneToMany(cascade = CascadeType.REMOVE)
	private List<Batch> batchs;

}
