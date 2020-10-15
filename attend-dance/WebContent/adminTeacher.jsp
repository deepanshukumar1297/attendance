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
					Teacher teacher = new Teacher();
					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
				%>
			
	<h2>welcome admin u can now update insert and delete teachers</h2>
	<form action="AdminTeacher">
		add teachers
		<div>
			NAME
			<input type="text" name="teacher" required>
		</div>
		<div>
			ID
			<input type="text" name="id" required>
		</div>
		<div>
			<input type = "submit" value="ADD teacher" >
		</div>
		<br>
		<br><br><br>
		teachers list
		<table border="solid">
			<tr>
				<th>teachers</th>
				<th>id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Teacher t:teacherslist)
					{
				%>
			<tr>
				<td><%= t.getName() %></td>
				<td><%= t.getId() %></td>
				<th><button>update</button></th>
				<th><button>delete</button></th>
			</tr>
				<%
					}
				%>
		</table>
	</form>
</body>
</html>