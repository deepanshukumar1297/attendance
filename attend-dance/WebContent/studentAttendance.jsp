<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="dao.DMark" %>
<%@ page import="pojo.GetMark" %>
<%@ page import = "java.util.ArrayList" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Student attendance</title>

</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
	<%
		String section_id = request.getParameter("section_id");
		String subject_id = request.getParameter("subject_id");
		String teacher_id = request.getParameter("teacher_id");

		DMark dmark = new DMark();
		ArrayList<GetMark> studentsecattend_list = dmark.fetchSectionAttendance(section_id, subject_id, teacher_id);
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
			<div class="col text-monospace ">
				<nav>
					<ol class="breadcrumb"
						style="background-color: rgb(233, 235, 221);">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item active">attendance of <%= subject_id %></li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

	<!---------------    main     -------------->

	<main class="container">
	<div class="row justify-content-center">
		<div class="col border border-primary rounded bg-info overflow-auto "
			style="height: 70vh;">

			<div class="row bg-primary sticky-top">
				<div class="col text-monospace">
					<header class="text-center font-weight-bold my-3">
						<%= subject_id.toUpperCase() %>
					</header>
				</div>
			</div>


			<div class="row my-3">
				<div class="col table-responsive">
					<table
						class="table  table-sm table-dark table-bordered table-hover">

						<thead>
							<tr>
								<th>STUDENT ID</th>
								<th>ATTENDANCE</th>
								<th>DATE OF ATTENDANCE</th>
							</tr>
						</thead>

						<tbody>

								<% 
									for(GetMark m:studentsecattend_list)
									{
								%>
							<tr>
								<td><%= m.getStudent_id()%></td>
								<td><%= m.getAttendance() %></td>
								<td><%= m.getDate_of_attendance() %></td>
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