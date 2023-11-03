<%@page import="java.util.Base64"%>
<%@page import="com.ty.hr_app.entity.Image"%>
<%@page import="com.ty.hr_app.entity.Attendance"%>
<%@page import="javax.validation.constraints.Email"%>
<%@page import="com.ty.hr_app.entity.User"%>
<%@page import="com.ty.hr_app.dao.UserDao"%>
<%@page import="com.ty.hr_app.entity.Batch"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.hr_app.dao.BatchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Batch Info</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
	color: white;
}

::selection {
	color: #000;
	background: #fff;
}

nav {
	position: fixed;
	background: #1b1b1b;
	width: 100%;
	padding: 10px 0;
	z-index: 12;
}

nav .menu {
	max-width: 1250px;
	margin: auto;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 20px;
}

.menu .logo a {
	text-decoration: none;
	color: #fff;
	font-size: 35px;
	font-weight: 600;
}

.menu ul {
	display: inline-flex;
}

.menu ul li {
	list-style: none;
	margin-left: 7px;
}

.menu ul li:first-child {
	margin-left: 0px;
}

.menu ul li a {
	text-decoration: none;
	color: #fff;
	font-size: 18px;
	font-weight: 500;
	padding: 8px 15px;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.menu ul li a:hover {
	background: #fff;
	color: black;
}

.img {
	background:
		url('https://cdn.pixabay.com/photo/2018/07/08/17/51/network-3524352_640.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	width: 100%;
	height: 10000vh;
	background-size: cover;
	background-position: center;
	position: relative;
	background-attachment: fixed;
	background-position: center;
}

.img::before {
	content: '';
	position: absolute;
	height: 100%;
	width: 100%;
	background: rgba(0, 0, 0, 0.4);
}

.center {
	position: absolute;
	top: 52%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	padding: 0 20px;
	text-align: center;
}

.center .title {
	color: #fff;
	font-size: 55px;
	font-weight: 600;
}

.center .sub_title {
	color: #fff;
	font-size: 52px;
	font-weight: 600;
}

.center .btns {
	margin-top: 20px;
}

.center .btns button {
	height: 55px;
	width: 170px;
	border-radius: 5px;
	border: none;
	margin: 0 10px;
	border: 2px solid white;
	font-size: 20px;
	font-weight: 500;
	padding: 0 10px;
	cursor: pointer;
	outline: none;
	transition: all 0.3s ease;
}

.center .btns button:first-child {
	color: #fff;
	background: none;
}

.btns button:first-child:hover {
	background: white;
	color: black;
}

.center .btns button:last-child {
	background: white;
	color: black;
}
</style>
</head>
<body>
	<nav>
		<div class="menu">
			<div class="logo">
				<a href="#">Batch Info </a>

			</div>
			<ul>

				<li><a href="Batchinfo.jsp">Back</a></li>
			</ul>
		</div>
	</nav>
	<div class="img"></div>
	<div class="center">
		<h2>${message}</h2>
		<br>
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		
		BatchDao batchDao = new BatchDao();
		Batch batch = batchDao.findBatchById(id);
		List<Attendance> attendances = batch.getAttendances();
		int sno = 1;
		%>

		<table border="1">
			<tr>
				<th>Sno</th>
				<th>Attedence Id</th>
				<th>No of Student</th>
				<th>Created Dates</th>
				<th>Image</th>

			</tr>
			<%
			if (attendances != null) {
				for (Attendance attendance : attendances) {
			%>

			<tr>

				<td><%=sno++%></td>
				<td><%=attendance.getId()%></td>
				<td><%=attendance.getNumberOfStudent()%></td>
				<td><%=attendance.getCreatedDateAndTime()%></td>
				<%
				Image image = attendance.getImage();
				String base64Image = Base64.getEncoder().encodeToString(image.getFile());
				%>
				<td><img src="data:image/jpeg;base64, <%=base64Image%>"
					alt="Image" height="100px" width="100px" /></td>

			</tr>
			<%
			}
			}
			%>





			<div class="btns"></div>
			</div>
</body>
</html>