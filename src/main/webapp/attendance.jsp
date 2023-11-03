<%@page import="com.ty.hr_app.dao.UserDao"%>
<%@page import="com.ty.hr_app.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Attendance</title>
<style type="text/css">
body {
	margin-top: 20px;
	color: #1a202c;
	text-align: left;
	background-image:
		url("https://cdn.pixabay.com/photo/2023/06/15/17/07/sun-8066051_1280.jpg");
}

.main-body {
	padding: 15px;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	display: flex;
	color: Black;
	flex-direction: row;
	word-wrap: break-word;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}

.gutters-sm {
	margin-right: -8px;
	margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
	padding-right: 8px;
	padding-left: 8px;
}

.mb-3, .my-3 {
	margin-left: 200px;
	display: flex;
	width: 80%;
}

.bg-gray-300 {
	background-color: #e2e8f0;
}

.h-100 {
	height: 100% !important;
}

.shadow-none {
	box-shadow: none !important;
}

.card1 {
	color: black;
}

.abc {
	padding: 10px 20px;
	margin-left: 90%;
	text-decoration: none;
	background-color: black;
	color: white;
}
</style>
</head>

<body>

	<a href="trainerhome.jsp" class="abc">Back</a>

	<%
	int id = (int) session.getAttribute("id");
	UserDao dao = new UserDao();
	User user = dao.findUserById(id);
	%>
	<div class="container">
		<div class="main-body">



			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card1" style="margin-left: 0px">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h3>Name:</h3>
									<h4><%=user.getName().toUpperCase()%></h4>
									<p class="text-secondary mb-1">
									<h3>Role:</h3>
									<b><%=user.getRole().toUpperCase()%></b>
									</p>
									<p class="text-muted font-size-sm">
									<h3>Emp ID:</h3><%=user.getEmployId().toUpperCase()%></p>

								</div>
							</div>
						</div>
					</div>

					<div class="col-md-8">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Full Name</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=user.getName()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=user.getEmail()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Phone</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=user.getPhone()%></div>
								</div>
								<hr>

								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Status</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<%
										if (user.isStatus()) {
										%>
										<h4>Active</h4>


										<%
										} else {
										%>
										<h4>Inactive</h4>
										<%
										}
										%>


									</div>
								</div>
								<hr>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>