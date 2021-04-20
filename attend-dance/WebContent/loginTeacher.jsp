<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="pojo.Teacher"%>
<%@page import="dao.DTeacher"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">


<title>Login Teacher</title>

</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">

		<%
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
						<li class="breadcrumb-item active">Admin Login</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

    <!---------------    main     -------------->
	<form id="verification" class="container-fluid my-4">
		<div class="row d-flex justify-content-center">
			<div class="col-5 border border-primary rounded bg-info">

				<div class="row bg-primary">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">LOGIN</header>
					</div>
				</div>

				<div class="row  my-3">
					<div class="col">
						<select id="teacher_id" class="custom-select" required>
							<option hidden selected disabled>choose your id</option>
							<% 
								for(Teacher t:teacherslist)
								{
							%>
						<option><%=t.getTeacher_id() %></option>
							<%
								}
							%>
						</select>
					</div>	
				</div>
		
				<div class="row mt-5">
					<div class="col">
						<div class="form-group text-light">
							<label for="password" class="text-reset">Password</label>
							<input type="password" id="password" 
							placeholder="Enter Password" class="form-control">
							<div id="res-pass" class="mx-3"></div>
						</div>
					</div>
				</div>
		
				<div class="row mt-5 mb-3">
					<div class="col">
						<input type="submit" value="submit"
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

	
	<script>
			document.getElementById("verification").addEventListener("submit",fire);
		    function fire(e) {
		 	if (document.getElementById("teacher_id").value== "choose your id" || document.getElementById("password").value== "") {
		 	throw alert("please fill out all the fields");
	        }
		    e.preventDefault();
            //creating url pattern
            var teacher_id=document.getElementById("teacher_id").value;  
            var password=document.getElementById("password").value;  
			var url="LoginTeacher";
			
            
            //create xhr object
            var xhr = new XMLHttpRequest();
            //console.log(xhr);
			xhr.open('POST',url,true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhr.onload = function () {
                if (this.status == 200) {
					var res = xhr.responseText;
					if(res == "0")
					{
						document.getElementById("password").classList.add("is-invalid");
						document.getElementById("res-pass").innerHTML="incorrect password";
						document.getElementById("res-pass").classList.add("invalid-tooltip");
					}
					else if (res == "1") {
						document.getElementById("password").classList.add("is-invalid");
						document.getElementById("res-pass").innerHTML="something unexpected occured, contact admin";
						document.getElementById("res-pass").classList.add("invalid-tooltip");
					} 
					else {
						var opened = window.open("");
						opened.document.write(res);
					}
				}
				else 
				{
					document.getElementById("design").classList.add("border");
					document.getElementById("design").classList.add("border-danger");
					document.getElementById("design").classList.add("rounded");
					document.getElementById("response").innerHTML="something went wrong";		
				}

            }
			
            xhr.send("teacher_id="+teacher_id+"&password="+password);
        }
    </script>
  </body>

</html>