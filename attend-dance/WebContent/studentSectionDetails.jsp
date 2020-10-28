<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="dao.DSubjectTeacherSection" %>
<%@ page import="pojo.SubjectTeacherSection" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>studentSectionDetails</title>
</head>
<body>
				<%
					String section_id = request.getParameter("section_id");
					DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
					ArrayList<SubjectTeacherSection> subteach_list = dsubteachsec.fetchSubjectTeacher(section_id);  

				%>

	CHOOSE THE SUBJECT
	<br>
	<table style="border: solid; border-color: red;">
			<tr>
				<th>subject id</th>
				<th>teacher id</th>
				<th>VIEW ATTENDANCE</th>
			</tr>
				<% 
					for(SubjectTeacherSection sts:subteach_list)
					{
				%>
			<tr>
				<td><%= sts.getSubject_id() %></td>
				<td><%= sts.getTeacher_id() %></td>
				<td><a href="studentAttendance.jsp?section_id=<%= section_id  %>&subject_id=<%= sts.getSubject_id() %>&teacher_id=<%= sts.getTeacher_id() %>"><button>view</button></a></td>
				<%
					}
				%>
			</tr>
		</table>
</body>
</html>