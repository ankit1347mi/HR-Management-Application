<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.ty.hr_app.entity.Batch"%>
<%@page import="com.ty.hr_app.dao.BatchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Login Page</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

header .header {
	background-color: #fff;
	height: 45px;
}

header a img {
	width: 134px;
	margin-top: 4px;
}

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.login-page .form .login {
	margin-top: -31px;
	margin-bottom: 26px;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background-color: #328f8a;
	background: black;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #4CAF50;
	text-decoration: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

body {
	background-color: #328f8a;
	background-image:
		url("https://cdn.pixabay.com/photo/2017/06/21/07/33/background-2426328_640.jpg");
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<body>
<body>
	<%
	int bid = Integer.parseInt(request.getParameter("id"));
	BatchDao batchDao = new BatchDao();
	Batch batch = batchDao.findBatchById(bid);
	%>


	<div class="login-page">
		<div class="form">
			<div class="login">
				<div class="login-header">
					<h3>Attendance Form</h3>
					<p>Fill the Required Fields</p>
					<h3>${message}</h3>
				</div>
			</div>
			<form class="login-form"
				action="createattendance?id=<%=batch.getId()%>" method="post"
				enctype="multipart/form-data">
				<input type="number" placeholder="No of Student" name="count" /> <input
					type="file" placeholder="Add file" name="file" /> <input
					type="date" name="inputdate" />
				<!-- 	<button>Create</button> -->
				<input type="submit" value="Create">
				<p class="message"></p>
			</form>
		</div>
	</div>
</body>
</body>
</html>