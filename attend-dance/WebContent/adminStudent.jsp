<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Student" %>
<%@ page import="dao.DStudent"%>
<%@ page import="pojo.Section" %>
<%@ page import="dao.DSection"%>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>admin student</title>
  </head>
  <body>

				<%
					DStudent dstudent = new DStudent();
					DSection dsection = new DSection();      //for getting section_id since it is foreign key
					
					ArrayList<Student> studentslist= dstudent.fetch();
					ArrayList<Section> sectionslist= dsection.fetch();
				%>
				
	<div class="custom-breadcrumns border-bottom" style="background-color:  rgb(195, 211, 210); padding:10px; text-align:center" >
		<div class="container">
			<a href="index.html">Home</a>|
			<a href="loginAdmin.html">AdminLogin</a>|
			<a href="admin.jsp">Admin</a>|
			<span class="current">Admin Student</span>
		</div>
	</div>
	<h2>welcome admin u can now update insert and delete students and their corrosponding sections</h2>
	
	<form action="AdminStudent">
		add students
		<div>
			NAME
			<input type="text" name="student_name" required>
		</div>
		<div>
			ID
			<input type="text" name="student_id" required>
		</div>
		<div>
			section
			<select name="student_sectionId">
				<% 
					for(Section t:sectionslist)
					{
				%>
				<option><%= t.getSection_id() %> </option>
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
		<table class="table" >
			<tr>
				<th scope="col">Student name</th>
				<th scope="col">Student id</th>
				<th scope="col">update</th>
				<th scope="col">delete</th>
			</tr>
				<% 
					for(Student t:studentslist)
					{
				%>
			<tr>
				<td><%= t.getStudent_name() %></td>
				<td><%= t.getStudent_id() %></td>
				<td><%= t.getStudent_sectionId() %></td>
				<td>
					<a href="adminStudentUpdate.jsp"><button>UPDATE</button></a>
				</td>
				<td><button>DELETE</button></td>
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