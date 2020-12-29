<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Subject" %>
<%@page import="dao.DSubject"%>
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css">
    
    <title>admin Subject</title>
  </head>
  <body>
				<%
					DSubject dsubject = new DSubject();
					ArrayList<Subject> subjectslist= dsubject.fetch();
				%>
				
	<div class="custom-breadcrumns border-bottom" style="background-color:  rgb(195, 211, 210); padding:10px; text-align:center" >
		<div class="container">
			<a href="index.html">Home</a>|
			<a href="loginAdmin.html">AdminLogin</a>|
			<a href="admin.jsp">Admin</a>|
			<span class="current">Admin Subject</span>
		</div>
	</div>
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
		<!--style="border: solid; border-color: red;"-->
		<table class="table" >
			<tr>
				<th scope="col">subject name</th>
				<th scope="col">subject id</th>
				<th scope="col">update</th>
				<th scope="col">delete</th>
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