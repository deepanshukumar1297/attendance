<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%@ page import = "java.util.ArrayList" %>
	<%@ page import="dao.DSubjectTeacherSection" %>

	<%@ page import="pojo.Teacher" %>
	<%@page import="dao.DTeacher"%>
	
	<%@ page import="pojo.Subject" %>
	<%@page import="dao.DSubject"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css">    
	<title>assign teachers</title>
	


  </head>
    <body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
        
				<%
					String section_id=request.getParameter("section_id");
				
					DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
					ArrayList<String> coordinatorinfo = dsubteachsec.coordinatorInfo(section_id);

					DSubject dsubject = new DSubject();
					ArrayList<Subject> subjectslist= dsubject.fetch();

					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
				%>
				
				<input type="text" value="<%= section_id %>" id="section_id" hidden>
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
				<li class="breadcrumb-item"><a href="loginCoordinator.jsp">Coordinator Login</a></li>
				<li class="breadcrumb-item"><a href="coordinator.jsp"> Coordinator</a></li>
                <li class="breadcrumb-item active">Subject teachers</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>

    <!---------------    main     -------------->
	<form id="verification" class="container-fluid">

		<div class="row text-center align-content-center " style="height: 6rem;">

			<div class="col-12">
				<h2 class="text-dark ">
					<%= coordinatorinfo.get(1).toUpperCase() %>   (ID=<%= coordinatorinfo.get(0).toUpperCase() %>)
				</h2>
			</div>

		</div>

		<div class="row justify-content-center my-4">
			<div class="col-5 border border-primary rounded bg-info">
				
				<div class="row bg-primary">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">add Subject taecher</header>
					</div>
				</div>

				<div class="row my-5">
					<div class="col">
						<select id="teacher_id" class="custom-select" required>
							<option  hidden selected disabled >choose teacher</option>
							<% 
								for(Teacher t:teacherslist)
								{
							%>
							<option><%= t.getTeacher_id() %> </option>
							<%
								}
							%>
						</select>
					</div>
				</div>

				<div class="row my-5">
					<div class="col">
						<select id="subject_id" class="custom-select" required>
							<option  hidden selected disabled >choose subject</option>
							<% 
								for(Subject t:subjectslist)
								{
							%>
							<option><%= t.getSubject_id() %> </option>
							<%
								}
							%>
						</select>
					</div>
				</div>
		
				<div class="row my-5">
					<div class="col">
						<input type="submit" value="assign subject"
						class="btn btn-block btn-outline-light">
					</div>
				</div>
				  
			</div>
		</div>
	</form>


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
<!---------------    script     -------------->

<script>
document.getElementById("verification").addEventListener("submit",fire);
function fire(e) {
if (document.getElementById("subject_id").value== "choose subject" || document.getElementById("teacher_id").value== "choose teacher") {
	//alert("please choose subject");   this doesnot stop the execution of program
	throw alert("please fill out all the fields");
}
e.preventDefault();
//creating url pattern
var teacher_id=document.getElementById("teacher_id").value;  
var subject_id=document.getElementById("subject_id").value;
var section_id=document.getElementById("section_id").value;
var url="CAssignSubjectTeachers?subject_id="+subject_id+"&teacher_id="+teacher_id+"&section_id="+section_id;


//create xhr object
var xhr = new XMLHttpRequest();
//console.log(xhr);
xhr.open('GET',url,true);

xhr.onload = function () {
	if (this.status == 200) {
		var res= this.responseText;
		if(res=="0")
		{
			throw alert("subject added");
		}
		if(res=="1")
		{
			throw alert("already exists");
		}
		if(res=="2")
		{	
			throw alert("contact admin, something unexpected occured");
		}
	}
	else if (this.status == 404) 
	{
		throw alert("something went wrong");		
	} 
}

xhr.send();
}
</script>
</body>
</html>