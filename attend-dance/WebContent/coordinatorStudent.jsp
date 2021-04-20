<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.DSubjectTeacherSection"%>
<%@page import="pojo.Student"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Students </title>

</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">


	<%
        String section_id = request.getParameter("section_id");
        
        DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
        ArrayList<Student> secstudentlist = dsubteachsec.fetchStudent(section_id);     

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
						<li class="breadcrumb-item"><a href="loginCoordinator.jsp">Coordinator Login</a></li>
                        <li class="breadcrumb-item"><a href="coordinator.jsp">Coordinator</a></li>
						<li class="breadcrumb-item active"><%= section_id.toUpperCase() %></li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

	<!---------------    main     -------------->

	<main class="container">
	<div class="row justify-content-center">
		<div class="col border border-primary rounded bg-info overflow-auto "
			style="height: 65vh;">

			<div class="row bg-primary sticky-top">
				<div class="col text-monospace">
					<header class="text-center font-weight-bold my-3">
						section
						<%= section_id %>
					</header>
				</div>
			</div>


			<div class="row my-3">
				<div class="col table-responsive">
					<table
						class="table  table-sm table-dark table-bordered table-hover">

						<thead>
							<tr>
								<th>NAME</th>
								<th>ID</th>
							</tr>
						</thead>

						<tbody>

							<% 
                                    for(Student s:secstudentlist)
                                    {
                                %>
							<tr>
								<td><%= s.getStudent_id() %></td>
								<td><%= s.getStudent_name().toUpperCase() %></td>
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
      <div class="row align-content-center justify-content-around text-monospace font-weight-bold text-dark" style="height: 3rem;">
          <div class="col-5">
              <a href="https://www.medicaps.ac.in"  class="text-reset">MEDICAPS-UNIVERSITY</a>
          </div>
          <div class="col-5">
              <span>
                  BY: 
              </span>
              <span>
                  <a href="https://www.instagram.com/darshika_sinvhal/" target="_blank" class="text-reset">Darshika</a> |
                  <a href="https://www.instagram.com/gurneetchabra/" target="_blank" class="text-reset">Gurneet</a> |
                  <a href="https://www.instagram.com/devramchandani/" target="_blank" class="text-reset">Dev</a> |
                  <a href="https://www.instagram.com/_deepanshu_15/" target="_blank" class="text-reset">Deepanshu</a> |
                  <a href="#" target="_blank" class="text-reset">Harhien</a>
              </span>
          </div>
      </div>
  </footer>
    
   
</body>
</html>