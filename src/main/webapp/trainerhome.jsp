<%@page import="com.ty.hr_app.entity.User"%>
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
<title>Trainer Home</title>

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
		url('https://cdn.pixabay.com/photo/2018/07/08/17/51/network-3524352_640.jpg')
		no-repeat;
	width: 100%;
	height: 100vh;
	background-size: cover;
	background-position: center;
	position: relative;
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
	<%
	User user = (User) request.getAttribute("user");

	if (user != null) {
		session.setAttribute("id", user.getId());
	%>

	<nav>
		<div class="menu">
			<div class="logo">
				<a href="#">Trainer Home </a>
			</div>
			<ul>
				<li><a href="viewTrainerdetails.jsp?id=<%=user.getId()%>">Batch
						Alloted</a></li>
				<li><a href="attendance.jsp?id=<%=user.getId()%>">Profile</a></li>

				<li><a href="login123.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="img"></div>
	<div class="center">
		<h1 style="color: white;">Welcome ${user.getName() }</h1>

		<div class="btns"></div>
	</div>
	<%
	} else {
	%>
	<nav>
		<div class="menu">
			<div class="logo">
				<a href="#">Trainer Home </a>
			</div>
			<ul>
				<li><a href="viewTrainerdetails.jsp">Batch Info</a></li>
				<li><a href="attendance.jsp">Profile</a></li>
				<li><a href="login123.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="img"></div>
	<div class="center">
		<h1 style="color: white;">Welcome ${user.getName() }</h1>

		<div class="btns"></div>
	</div>
	<%
	}
	%>
</body>
</html>