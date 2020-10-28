<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.DMark" %>
<%@ page import="pojo.GetMark" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
				<%
				System.out.println("4");

					String section_id = request.getParameter("section_id");
					String subject_id = request.getParameter("subject_id");
					String teacher_id = request.getParameter("teacher_id");

					DMark dmark = new DMark();
					ArrayList<GetMark> studentsecattend_list = dmark.fetchSectionAttendance(section_id, subject_id, teacher_id);
					
				%>
		ATTTENDANCE LIST
		<br>
	<table style="border: solid; border-color: red;">
			<tr>
				<th>student id</th>
				<th>attendance</th>
				<th>date of attendance</th>
			</tr>
				<% 
					for(GetMark m:studentsecattend_list)
					{
				%>
			<tr>
				<td><%= m.getStudent_id()%></td>
				<td><%= m.getAttendance() %></td>
				<td><%= m.getDate_of_attendance() %></td>
				<%
					}
				%>
			</tr>
		</table>
</body>
</html>