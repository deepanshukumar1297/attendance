<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Subject" %>
<%@page import="dao.DSubject"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminTeacher</title>
</head>
<body>
				<%
					DSubject dsubject = new DSubject();
					ArrayList<Subject> subjectslist= dsubject.fetch();
				%>
			
	<h2>welcome admin u can now update insert and delete teachers</h2>
	<form action="AdminSubject">
		add subject
		<div>
			NAME
			<input type="text" name="subject_name" required>
		</div>
		<div>
			ID
			<input type="text" name="subject_id" required>
		</div>
		<div>
			<input type = "submit" value="ADD subject" >
		</div>
	</form>
		<br><br><br>
		subjects list
		<table style="border: solid; border-color: red;">
			<tr>
				<th>subject name</th>
				<th>subject id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Subject s:subjectslist)
					{
				%>
			<tr>
				<td><%= s.getSubject_name() %></td>
				<td><%= s.getSubject_id() %></td>
				<td><button>update</button></td>
				<td><button>delete</button></td>
			</tr>
				<%
					}
				%>
		</table>
	
</body>
</html>