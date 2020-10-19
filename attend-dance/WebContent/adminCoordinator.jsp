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
					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
					
					DCoordinator dcoordiantor = new DCoordinator();
					ArrayList<Coordinator> coordinatorslist= dcoordiantor.fetch();
					
					DSection dsection = new DSection();
					ArrayList<Section> sectionslist= dsection.fetch();
				%>
	<h2>welcome admin u can now update insert and delete coordiantors and their assigned sections</h2>
	
	<form action="AdminCoordinator">
		make coordiantor
		<div>
			teacher
			<select name="coordinator_teacherId">
				<% 
					for(Teacher t:teacherslist)
					{
				%>
				<option><%= t.getTeacher_id() %></option>
				<%
					}
				%>
			</select>
			
		</div>
				
		<div>
			section
			<select name="coordinator_sectionId">
				<% 
					for(Section t:sectionslist)
					{
				%>
					<option><%= t.getSection_id() %></option>				
				<%
					}
				%>
			</select>
		</div>
		<br>
		<div>
			<input type = "submit" value="make coordiantor" >
		</div>
	</form>
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
				<td><%= t.getTeacher_name() %></td>
				<td><%= t.getTeacher_id() %></td>
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
				<td><%= s.getSection_name() %></td>
				<td><%= s.getSection_id() %></td>
			</tr>
				<%
					}
				%>
		</table>
		
		
		<br><br><br>
		coordinator list
		<table border="solid">
			<tr>
				<th>teacher id</th>
				<th>section id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Coordinator c:coordinatorslist)
					{
				%>
			<tr>
				<td><%= c.getCoordinator_teacherId() %></td>
				<td><%= c.getCoordinator_sectionId() %></td>
				<td><button>update</button></td>
				<td><button>delete</button></td>
			</tr>
				<%
					}
				%>
		</table>
		<br>
</body>
</html>