package com.ty.hr_app.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ty.hr_app.dao.BatchDao;
import com.ty.hr_app.dao.ImageDao;
import com.ty.hr_app.dao.UserDao;
import com.ty.hr_app.email.GEmailSender;
import com.ty.hr_app.entity.Attendance;
import com.ty.hr_app.entity.Batch;
import com.ty.hr_app.entity.Image;
import com.ty.hr_app.entity.User;
import com.ty.hr_app.service.AttendanceService;
import com.ty.hr_app.service.UserService;

@Controller
public class HrController {

	@GetMapping("/save")
	public ModelAndView save(HttpServletRequest req) {

		User user = new User();
		String name = req.getParameter("name");
		String empid = req.getParameter("empid");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String password = req.getParameter("password");
		String cpassword = req.getParameter("confirmpassword");
		if (password.equals(cpassword)) {
			user.setEmployId(empid);
			user.setName(name);
			user.setPhone(phone);
			user.setEmail(email);
			user.setPassword(cpassword);
			user.setRole("Trainer");
			user.setStatus(true);
		}

		UserService service = new UserService();
		User user2 = service.saveUser(user);

		ModelAndView view = new ModelAndView("trainee");
		view.addObject("user", user2);
		return view;

	}

	@PostMapping("login")
	public ModelAndView login(HttpServletRequest req) {
		User user = new User();
		String email = req.getParameter("email");
		String password = req.getParameter("pass");
		user.setEmail(email);
		user.setPassword(password);

		UserService service = new UserService();
		User user2 = service.findUserByEmailAndPassword(user);
		if (user2 != null) {

			if (user2.getRole().equalsIgnoreCase("Hr")) {

				ModelAndView view = new ModelAndView("display");
				view.addObject("user", user2);
				return view;
			} else if (user2.getRole().equalsIgnoreCase("Trainer")) {
				ModelAndView view = new ModelAndView("trainerhome");
				view.addObject("user", user2);

				return view;
			} else {
				ModelAndView view = new ModelAndView("login123");
				view.addObject("user", user2);
				return view;
			}

		} else {
			ModelAndView view = new ModelAndView("login123");
			view.addObject("error", "Invalid Credential");
			return view;
		}

	}

	@PostMapping("/createbatch")
	public ModelAndView createBatch(HttpServletRequest req) {
		Batch batch = new Batch();
		UserDao dao = new UserDao();

		batch.setStatus(true);
		String subj = req.getParameter("subject");
		batch.setSubject(subj);

		int id = Integer.parseInt(req.getParameter("id"));
		User user = dao.findUserById(id);

		if (user.getRole().equalsIgnoreCase("Trainer")) {
			BatchDao batchDao = new BatchDao();
			Batch batch2 = batchDao.saveBatch(batch, id);
			req.setAttribute("id", id);
			GEmailSender gEmailSender = new GEmailSender();
			String link = "http://localhost:8080/hr-management-application-springmvc/createattendance.jsp?id="
					+ batch2.getId();
			String to = user.getEmail();
			String file = "BatchInfo.jsp";
			String from = "mishrankit9752@gmail.com";
			String subject = "You have been Assigned New Batch";
			String message = "Hello " + user.getName() + ", You have Been Assigned a new Batch of " + subj
					+ ".\nA file has been attached below Kindly go through it\n" + link + "";
			boolean b = gEmailSender.sendEmail(to, from, subject, message);

			ModelAndView view = new ModelAndView("Batchinfo");
			view.addObject("message", "Batch Assigned Suucessfully");
			return view;
		} else {

			ModelAndView view = new ModelAndView("Batchinfo");
			view.addObject("message", "Invalid Trainer Credential");
			return view;
		}

	}

	@PostMapping("createattendance")
	public ModelAndView handleFileUpload(HttpServletRequest req, @RequestParam("file") MultipartFile imaage) {

		AttendanceService service = new AttendanceService();

		int id = Integer.parseInt(req.getParameter("id").substring(0, 1));

		String inputDate = req.getParameter("inputdate");

		BatchDao batchDao = new BatchDao();
		Batch batch = batchDao.findBatchById(id);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime current = batch.getCreatedDateAndTime().minusDays(1);
		LocalDate date = current.toLocalDate();

		LocalDateTime LastDate = current.plusDays(5);
		LocalDate finaldate = LastDate.toLocalDate();
		LocalDate inputDates = LocalDate.parse(inputDate, formatter);
		ModelAndView view = new ModelAndView("sent");

		System.out.println(date);
		System.out.println(inputDates);
		if (inputDates.isAfter(date) && inputDates.isBefore(finaldate)) {

			if (batch != null) {
				if (!imaage.isEmpty()) {
					try {

						byte[] imageBytes = imaage.getBytes();

						ImageDao dao = new ImageDao();

						Image image = new Image();
						image.setFile(imageBytes);

						int count = Integer.parseInt(req.getParameter("count"));

						Attendance attendance = service.saveAttendance(batch, count, image);

						view.addObject("image", attendance.getImage());
						view.addObject("message", "Thank You");
						return view;
					} catch (Exception e) {
						System.out.println(e.getMessage());

					}
				} else {
					System.out.println("Image is empty");
				}

			}
		}
		view.addObject("message", "Invalid Credential ");
		return view;

	}

	@GetMapping("updatestatus")
	public ModelAndView updateStatus(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		BatchDao batchDao = new BatchDao();
		Batch batch = batchDao.findBatchById(id);
		batch.setStatus(false);
		batchDao.updateBatch(batch);
		ModelAndView view = new ModelAndView("viewattendance");
		view.addObject("bid", batch.getId());
		return view;
	}

}