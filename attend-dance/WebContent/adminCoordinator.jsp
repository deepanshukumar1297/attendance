<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%@ page import="java.util.ArrayList" %>

	<%@ page import="pojo.Teacher" %>
	<%@page import="dao.DTeacher"%>
	
	<%@ page import="pojo.Section" %>
	<%@page import="dao.DSection"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css">    
	<title>add-update-delete</title>
	


  </head>
    <body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
        
				<%
					DSection dsection = new DSection();
					ArrayList<Section> sectionslist= dsection.fetchonly();

					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
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
                <li class="breadcrumb-item"><a href="loginAdmin.jsp">Admin Login</a></li>
				<li class="breadcrumb-item"><a href="admin.jsp">Choose</a></li>
                <li class="breadcrumb-item active">Add-Update-Delete</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>

    <!---------------    main     -------------->
	<form id="verification" class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-5 border border-primary rounded bg-info">
				
				<div class="row bg-primary">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">ADD NEW COORDINATOR</header>
					</div>
				</div>

				<div class="row my-3">
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

				<div class="row my-3">
					<div class="col">
						<select id="section_id" class="custom-select" required>
							<option  hidden selected disabled >choose section</option>
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
				</div>
		
				<div class="row my-3">
					<div class="col">
						<input type="submit" value="make coordinator"
						class="btn btn-block btn-outline-light">
					</div>
				</div>
				  
			</div>
		</div>
	</form>

<!---------------    RESPONSE     -------------->

	<div class="container my-3">
		<div class="row justify-content-center">
			<div class="col-5 bg-warning text-monospace " id="design">
				<span class="text-center font-weight-bold my-3" id="response"></span>
			</div>
		</div>
	</div>
<!---------------    update and delete     -------------->

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-5 bg-primary border border-warning rounded text-monospace">
				<a href="adminCoordinatorUpDel.jsp" class="btn btn-block btn-outline-danger font-weight-bold text-reset my-2">UPDATE OR DELETE COORDINATOR</a>
			</div>
		</div>
	</div>

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
<!---------------    script     -------------->

<script>
document.getElementById("verification").addEventListener("submit",fire);
function fire(e) {
if (document.getElementById("section_id").value== "choose section" || document.getElementById("teacher_id").value== "choose teacher") {
	//alert("please choose section");   this doesnot stop the execution of program
	throw alert("please fill out all the fields");
}
e.preventDefault();
//creating url pattern
var teacher_id=document.getElementById("teacher_id").value;  
var section_id=document.getElementById("section_id").value;
var url="AdminCoordinator?section_id="+section_id+"&teacher_id="+teacher_id;


//create xhr object
var xhr = new XMLHttpRequest();
//console.log(xhr);
xhr.open('GET',url,true);

xhr.onload = function () {
	if (this.status == 200) {
		var res= this.responseText;
		document.getElementById("design").classList.add("border");
		document.getElementById("design").classList.add("border-danger");
		document.getElementById("design").classList.add("rounded");
		if(res=="0")
		   {
			document.getElementById("response").innerHTML="coordinator added";
			}
		if(res=="1")
		   {
			document.getElementById("response").innerHTML="duplicate entry";
		   }
		if(res=="2")
		   {	
			document.getElementById("response").innerHTML="contact admin, something unexpected occured";
		   }
	}
	else if (this.status == 404) 
	{
		document.getElementById("design").classList.add("border");
		document.getElementById("design").classList.add("border-danger");
		document.getElementById("design").classList.add("rounded");
		document.getElementById("response").innerHTML="something went wrong";		
	} 
}

xhr.send();
}
</script>
</body>
</html>