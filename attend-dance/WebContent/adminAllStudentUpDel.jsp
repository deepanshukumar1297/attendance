<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="pojo.Student"%>
<%@page import="dao.DStudent"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">

<title>HOME</title>

</head>
<body style="background-color: rgb(233, 235, 221);">


	<%
        DStudent dstudent = new DStudent();
        ArrayList<Student> student_list = dstudent.fetch();     
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
						<li class="breadcrumb-item"><a href="loginAdmin.jsp">Admin
								Login</a></li>
						<li class="breadcrumb-item"><a href="admin.jsp">Admin</a></li>
						<li class="breadcrumb-item"><a href="adminStudent.jsp">Admin
								Student</a></li>
						<li class="breadcrumb-item active">Admin Student-section</li>
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
						all students
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
                                <th>SECTION</th>
								<th>ACTION</th>
							</tr>
						</thead>

						<tbody>

							<% 
                                    for(Student s:student_list)
                                    {
                                %>
							<tr>
								<td id="student_id"><%= s.getStudent_id() %></td>
                                <td id="student_name"><%= s.getStudent_name() %></td>
								<td id="student_name">
									<a
									href="adminStudentUpDel.jsp?section_id=<%= s.getStudent_sectionId() %>"
									class="btn btn-sm btn-outline-primary badge rounded-pill"><%= s.getStudent_sectionId() %></a>
								</td>
								<td><a
									href="adminStudentAllUpdate.jsp?section_id=<%= s.getStudent_sectionId() %>&student_id=<%= s.getStudent_id() %>&student_name=<%= s.getStudent_name() %>"
									class="btn btn-sm btn-outline-warning badge rounded-pill">update</a>
                                    <a
									href="adminStudentAllDelete.jsp?section_id=<%= s.getStudent_sectionId() %>&student_id=<%= s.getStudent_id() %>&student_name=<%= s.getStudent_name() %>"
									class="btn btn-sm btn-outline-danger badge rounded-pill">delete</a>								
								</td>
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
    
<!---------------    suggestion     -------------->

<div class="container my-3">
	<div class="row justify-content-center">
		<div class="col-5 bg-warning text-monospace border border-danger rounded">
			<span class="text-center font-weight-bold my-3">please reload the page after updation or deletion</span>
		</div>
	</div>
</div>
   
	<!---------------    footer     -------------->

	<footer class="container-fluid bg-info mt-2">
		<div class="row p-3">
			<div class="col-7 text-monospace">
				<a href="https://www.medicaps.ac.in" class="text-reset">MEDICAPS-UNIVERSITY</a>
			</div>
			<div class="col-5">
				<span class="font-weight-bold text-monospace">BY: </span> <span>
					Darshika | Dev | Gurneet | Deepanshu </span>
			</div>
		</div>
	</footer>
    
   
</body>
</html>