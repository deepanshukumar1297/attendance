<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Subject" %>
<%@page import="dao.DSubject"%>
    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

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
	
<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
  </body>
</html>