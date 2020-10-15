<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Student" %>
<%@page import="dao.DStudent"%>
<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminStudent</title>
</head>
<body>

				<%
					Student student = new Student();
					Section section = new Section();
					
					DStudent dstudent = new DStudent();
					DSection dsection = new DSection();      //for getting section id
					
					ArrayList<Student> studentslist= dstudent.fetch();
					ArrayList<Section> sectionslist= dsection.fetch();
				%>
				
	<h2>welcome admin u can now update insert and delete students and their corrosponding sections</h2>
	<form action="AdminStudent">
		add sections
		<div>
			NAME
			<input type="text" name="student" required>
		</div>
		<div>
			ID
			<input type="text" name="id" required>
		</div>
		<div>
			section
			<select name="section">
				<% 
					for(Section t:sectionslist)
					{
				%>
				<option><%= t.getId() %> </option>
				<%
					}
				%>
			</select>
		</div>
		<div>
			<input type = "submit" value="ADD student">
		</div>
		<br>
	</form>
	
	<!-- list of Students already added -->
		
		<br><br><br>
		Student list
		<table border="solid">
			<tr>
				<th>teachers</th>
				<th>id</th>
				<th>section</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Student t:studentslist)
					{
				%>
			<tr>
				<td><%= t.getName() %></td>
				<td><%= t.getId() %></td>
				<td><%= t.getSection() %></td>
				<td>
					<a href="adminStudentUpdate.jsp"><button>UPDATE</button></a>
				</td>
				<td><button>DELETE</button></td>
			</tr>
				<%
					}
				%>
		</table>
</body>
</html>