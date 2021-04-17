<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css">
    
	<title>update-delete</title>

  </head>
  <body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
	  

	<%
		DSection dteacher = new DSection();
		ArrayList<Section> sectionslist= dteacher.fetch();
	%>

	<!---------------    header     -------------->
	
	<div class="container-fluid bg-info ">
		<div class="row">
		  <div class="col text-monospace ">
			<header class="lead font-weight-bold text-center text-light p-2">
			  ATTENDANCE MANAGEMENT SYSTEM </header>
		  </div>
		</div>
	  </div>
    

     <!---------------    navigation     -------------->
  
	  <div class="container-fluid ">
        <div class="row">
            <div class="col text-monospace ">
                <nav>
                    <ol class="breadcrumb"
                        style="background-color: rgb(233, 235, 221);">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="loginAdmin.jsp">Admin Login</a></li>
						<li class="breadcrumb-item"><a href="admin.jsp">Choose</a></li>
                        <li class="breadcrumb-item"><a href="adminStudent.jsp">Add-Update-Delete</a></li>
                        <li class="breadcrumb-item active">Update-delete</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

	<!---------------    main     -------------->

	<main class="container" >
		<div class="row justify-content-center">
			<div class="col-6 border border-primary rounded bg-info overflow-auto " style="height: 65vh;">

				<div class="row bg-primary sticky-top">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">choose section of the student</header>
					</div>
				</div>

				
				<div class="row m-2">
					<div class="col">
						<a href="adminAllStudentUpDel.jsp" class="btn btn-block btn-outline-light my-2">all students</a>
					</div>
				</div>

				<% 
					for(Section s:sectionslist)
					{
				%>

				<div class="row m-2">
					<div class="col">
						<a href="adminStudentUpDel.jsp?section_id=<%= s.getSection_id() %>" class="btn btn-block btn-outline-light my-2"><%= s.getSection_name() %> &nbsp; &nbsp; <%= s.getSection_id() %></a>
					</div>
				</div>

				<%
					}
				%>
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