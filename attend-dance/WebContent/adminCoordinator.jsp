<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="pojo.Teacher" %>
<%@page import="dao.DTeacher"%>

<%@ page import="pojo.Coordinator" %>
<%@page import="dao.DCoordinator"%>

<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminCoordinator</title>
</head>
<body>
				<%
					Teacher teacher = new Teacher();
					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
					
					Coordinator coordinator = new Coordinator();
					DCoordinator dcoordiantor = new DCoordinator();
					ArrayList<Coordinator> coordinatorslist= dcoordiantor.fetch();
					
					Section section = new Section();
					DSection dsection = new DSection();
					ArrayList<Section> sectionslist= dsection.fetch();
				%>
	<h2>welcome admin u can now update insert and delete coordiantors and their assigned sections</h2>
	<form action="AdminCoordinator">
		make coordiantor
		<div>
			teacher
			<select name="teacher">
				<% 
					for(Teacher t:teacherslist)
					{
				%>
				<option><%= t.getId() %></option>
				<%
					}
				%>
			</select>
			
		</div>
				
		<div>
			section
			<select name="section">
				<% 
					for(Section t:sectionslist)
					{
				%>
					<option><%= t.getId() %></option>				
				<%
					}
				%>
			</select>
		</div>
		<br>
		<div>
			<input type = "submit" value="make coordiantor" >
		</div>
		
		<!-- display list of coordinators with their sections and section id-->
		
		
		<br><br><br>
		teachers list
		<table border="solid">
			<tr>
				<th>teachers</th>
				<th>id</th>
			</tr>
				<% 
					for(Teacher t:teacherslist)
					{
				%>
			<tr>
				<td><%= t.getName() %></td>
				<td><%= t.getId() %></td>
			</tr>
				<%
					}
				%>
		</table>
		<br><br>
		section list
		<table border="solid">
			<tr>
				<th>teachers</th>
				<th>id</th>
			</tr>
				<% 
					for(Section s:sectionslist)
					{
				%>
			<tr>
				<td><%= s.getName() %></td>
				<td><%= s.getId() %></td>
			</tr>
				<%
					}
				%>
		</table>
		
		
		<br><br><br>
		coordinator list
		<table border="solid">
			<tr>
				<th>teachers</th>
				<th>section</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Coordinator c:coordinatorslist)
					{
				%>
			<tr>
				<td><%= c.getTeacher() %></td>
				<td><%= c.getSection() %></td>
				<th><button>update</button></th>
				<th><button>delete</button></th>
			</tr>
				<%
					}
				%>
		</table>
		<br>
	</form>
</body>
</html>