<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ page import = "java.util.ArrayList" %>
<%@ page import="dao.DSubjectTeacherSection" %>

<%@ page import="pojo.Student" %>
<%@ page import="pojo.SubjectTeacherSection" %>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">


<title>Coordinator</title>

</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">

		<% 
			String coordiantor_sectionId=(String)session.getAttribute("coordiantor_sectionId");
			
			DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
			ArrayList<String> coordinatorinfo = dsubteachsec.coordinatorInfo(coordiantor_sectionId);                     //teacher_id,teacher_name
			ArrayList<SubjectTeacherSection> subteach_list = dsubteachsec.fetchSubjectTeacher(coordiantor_sectionId);  
			ArrayList<Student> secstudent_list = dsubteachsec.fetchStudent(coordiantor_sectionId);     
			
        %>
	<!---------------    header     -------------->

	<div  class="container-fluid bg-info ">
		<div class="row align-content-around" style="height: 3rem;">
			<header class="col text-monospace lead font-weight-bold text-center text-light ">
				ATTENDANCE MANAGEMENT SYSTEM
			</header>
		</div>
	</div>

	<!---------------    navigation     -------------->

	<div class="container-fluid ">
		<div class="row">

			<div class="col-8 text-monospace ">
				<nav>
					<ol class="breadcrumb"
						style="background-color: rgb(233, 235, 221);">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item"><a href="loginCoordinator.jsp">Coordinator Login</a></li>
						<li class="breadcrumb-item active">Coordinator</li>
					</ol>
				</nav>
			</div>

			<div class="col-4">
				<a class="btn btn-primary" href="coordinatorStudent.jsp?section_id=<%= coordiantor_sectionId%>" role="button"><%= coordiantor_sectionId.toUpperCase() %></a>
				<a class="btn btn-primary" href="changePassword.jsp?teacher_id=<%= coordinatorinfo.get(0) %>" role="button">change password</a>
				<a class="btn btn-primary" href="assignSubjectTeachers.jsp?section_id=<%= coordiantor_sectionId %>" role="button">assign teachers</a>
			</div>
		</div>
	</div>

    <!---------------    main     -------------->
	<main id="verification" class="container-fluid ">
		<div class="row text-center align-content-center " style="height: 6rem;">

			<div class="col-12">
				<h2 class="text-dark ">
					welcome  <%= coordinatorinfo.get(1).toUpperCase() %>   (ID=<%= coordinatorinfo.get(0).toUpperCase() %>)
				</h2>
			</div>

			<div class="col-12 ">
				<h3  class="text-muted">
					you are coordinator of <%= coordiantor_sectionId.toUpperCase() %>
				</h3>
			</div>

		</div>

		<div class="row justify-content-center">
			<div class="col-7 border border-primary rounded bg-info overflow-auto" style="height: 55vh;">

				<div class="row bg-primary sticky-top">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">
							assigned teachers and thier subjects in <%= coordiantor_sectionId.toUpperCase() %>
						</header>
					</div>
				</div>
	
	
				<div class="row my-3">
					<div class="col table-responsive">
						<table
							class="table  table-sm table-dark table-bordered table-hover">
	
							<thead>
								<tr>
									<th>SUBJECT ID</th>
									<th>TEACHER ID</th>
									
								</tr>
							</thead>
	
							<tbody>
								<% 
									for(SubjectTeacherSection sts:subteach_list)
									{
								%>
							<tr>
								<td><%= sts.getSubject_id() %></td>
								<td><%= sts.getTeacher_id() %></td>
							</tr>
								<%
									}
								%>
							</tbody>
	
						</table>
					</div>
				</div>

			</div>
		</div>

	</main>

	
    <!---------------    footer     -------------->
	<footer  class="container-fluid bg-info">
		<div class="row align-content-around justify-content-center text-monospace font-weight-bold text-dark" style="height: 3rem;">
			<div class="col-5 ">
				<a href="https://www.medicaps.ac.in"  class="text-reset">MEDICAPS-UNIVERSITY</a>
			</div>
			<div class="col-4">
				<span>
					BY: 
				</span>
				<span>
					<a href="https://www.instagram.com/darshika_sinvhal/" target="_blank" class="text-reset">Darshika</a> |
					<a href="https://www.instagram.com/gurneetchabra/" target="_blank" class="text-reset">Gurneet</a> |
					<a href="https://www.instagram.com/devramchandani/" target="_blank" class="text-reset">Dev</a> |
					<a href="https://www.instagram.com/_deepanshu_15/" target="_blank" class="text-reset">Deepanshu</a>
				</span>
			</div>
		</div>
	</footer>

	
	
  </body>

</html>