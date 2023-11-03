<%@page import="com.ty.hr_app.entity.Batch"%>
<%@page import="com.ty.hr_app.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.hr_app.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = (Integer) request.getAttribute("id");
	UserDao users = new UserDao();
	User user = users.findUserById(id);
	List<Batch> batchs = user.getBatchs();
	%>

	<table border="1">
		<tr>

			<th>Batch Id</th>
			<th>Batch Created Time</th>
			<th>Batch Completed Time</th>
			<th>Batch Status</th>
			<th>Subject</th>
		</tr>
		<%
		if (batchs != null) {
			for (Batch batch : batchs) {
		%>

		<tr>

			<td><%=batch.getId()%></td>
			<td><%=batch.getCreatedDateAndTime()%></td>
			<%
			if (batch.isStatus() == false) {
			%>
			<td><%=batch.getCompletedDateAndTime()%></td>
			<td>Inactive</td>
			<%
			} else {
			%>
			<td>NA</td>
			<td>Active</td>
			<%
			}
			%>

			<td><%=batch.getSubject()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>

</body>
</html>