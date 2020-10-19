<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Teacher" %>
<%@page import="dao.DTeacher"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminTeacher</title>
</head>
<body>
				<%
					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
				%>
			
	<h2>welcome admin u can now update insert and delete teachers</h2>
	<form action="AdminTeacher">
		add teachers
		<div>
			NAME
			<input type="text" name="teacher_name" required>
		</div>
		<div>
			ID
			<input type="text" name="teacher_id" required>
		</div>
		<div>
			<input type = "submit" value="ADD teacher" >
		</div>
		<br>
		<br><br><br>
		teachers list
		<table border="solid">
			<tr>
				<th>teacher name</th>
				<th>teacher id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Teacher t:teacherslist)
					{
				%>
			<tr>
				<td><%= t.getTeacher_name() %></td>
				<td><%= t.getTeacher_id() %></td>
				<td><button>update</button></td>
				<td><button>delete</button></td>
			</tr>
				<%
					}
				%>
		</table>
	</form>
</body>
</html>