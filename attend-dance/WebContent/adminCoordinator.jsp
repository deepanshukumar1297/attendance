<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="pojo.Teacher" %>
<%@page import="dao.DTeacher"%>

<%@ page import="pojo.Coordinator" %>
<%@page import="dao.DCoordinator"%>

<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>


<!doctype html>
<html lang="en">
  <head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css">

  
    <title>admin Coordinator</title>
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
	
	<div class="custom-breadcrumns border-bottom" style="background-color:  rgb(195, 211, 210); padding:10px; text-align:center" >
		<div class="container">
			<a href="index.html">Home</a>|
			<a href="loginAdmin.html">AdminLogin</a>|
			<a href="admin.jsp">Admin</a>|
			<span class="current">Admin Coordinator</span>
		</div>
	</div>
	<h3>
		welcome Admin 
		<small class="text-muted"> assign coordinator</small>
	</h3>


	<form action="AdminCoordinator">
		<div class="form-group ">
		
			teacher
			<select class="form-control" name="coordinator_teacherId">
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
				
		<div class="form-group ">
			section
			<select class="form-control" name="coordinator_sectionId">
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
		<div>
			<input type = "submit" class="btn btn-success" value="make coordiantor" >
		</div>
	</form>
		<!-- display list of coordinators with their sections and section id-->
		
	
		<p>
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#teacher" aria-expanded="false" aria-controls="collapseExample">teacher list</button>
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#section" aria-expanded="false" aria-controls="collapseExample">section list</button>
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#coordinator" aria-expanded="false" aria-controls="collapseExample">coordinator list</button>
		</p>

	<div class="collapse" id="teacher">
		<div class="card card-body">
			<table class="table" id="teacher">
				<tr>
					<th scope="col">Teacher name</th>
					<th scope="col">Teacher id</th>
				</tr>
				<%
					for (Teacher t : teacherslist) {
				%>
				<tr>
					<td><%=t.getTeacher_name()%></td>
					<td><%=t.getTeacher_id()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="collapse" id="section">
		<div class="card card-body">
			<table class="table" id="section">
				<tr>
					<th scope="col">Section name</th>
					<th scope="col">Section id</th>
				</tr>
				<%
					for (Section s : sectionslist) {
				%>
				<tr>
					<td><%=s.getSection_name()%></td>
					<td><%=s.getSection_id()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="collapse" id="coordinator">
		<div class="card card-body">
			<table class="table" id="coordinator">
				<tr>
					<th scope="col">Coordinator id</th>
					<th scope="col">Teacher id</th>
					<th scope="col">update</th>
					<th scope="col">delete</th>
				</tr>
				<%
					for (Coordinator c : coordinatorslist) {
				%>
				<tr>
					<td><%=c.getCoordinator_teacherId()%></td>
					<td><%=c.getCoordinator_sectionId()%></td>
					<td><button class="btn btn-outline-danger btn-sm">update</button></td>
					<td><button class="btn btn-outline-danger btn-sm">delete</button></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>

	
  </body>
</html>