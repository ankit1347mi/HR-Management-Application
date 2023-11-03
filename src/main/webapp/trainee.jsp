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
<title>Trainee info</title>

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
	margin-left: 20%;
	justify-content: center;
	position: absolute;
	top: 40%;
	left: 40%;
	transform: translate(-50%, -50%);
	width: 100%;
	padding: 10px 20px;
	text-align: center;
	position: absolute;
	justify-content: center;
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
				<a href="#">Trainee Info</a>
			</div>
			<ul>
				<li><a href="SignUp.jsp">Add Trainer</a></li>


				<li><a href="display.jsp">Back</a></li>
			</ul>
		</div>
	</nav>
	<div class="img"></div>
	<div class="center">
		<%
		UserDao dao = new UserDao();
		List<User> users = dao.findAll();
		%>

		<table border="1">
			<tr>

				<th>Id</th>
				<th>Emp ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Role</th>
				<th>Create Batch</th>
			</tr>
			<%
			if (users != null) {
				for (User user : users) {
			%>


			<tr>
				<td><%=user.getId()%></td>
				<td><%=user.getEmployId()%></td>
				<td><%=user.getName()%></td>

				<td><%=user.getEmail()%></td>


				<td><%=user.getPhone()%></td>
				<td><%=user.getRole()%></td>
				<td><a href="CreateBatch.jsp?id=<%=user.getId()%> ">Create</a></td>

				<%
				}
				%>


			</tr>
			<%
			} else {
			%>
			<h1 style="color: white;">No Trainer has Been Added Yet</h1>
			<%
			}
			%>
		</table>
		<div class="btns"></div>
	</div>
</body>
</html>