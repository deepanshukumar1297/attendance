<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">


<title>Login Admin</title>


<!-- <style>
		.container{
			border: 8px solid rgb(21, 255, 0) ;
		}
		.row{
			border: 8px solid rgb(219, 20, 20) ;
		}
		.col,.col-1,.col-2,.col-3,.col-4,.col-5,.col-6,.col-7,.col-8,.col-9,.col-10,.col-11,.col-12{
			border: 8px solid rgb(38, 0, 255) ;
		}
	</style> -->
</head>
<body style="background-color: rgb(233, 235, 221);">

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
						<li class="breadcrumb-item active">Admin Login</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

    <!---------------    main     -------------->
	<form id="verification" class="container-fluid">
		<div class="row d-flex justify-content-center">
			<div class="col-5 border border-primary rounded bg-info">

				<div class="row bg-primary">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">LOGIN</header>
					</div>
				</div>

				<div class="row  mt-3">
					<div class="col">
						<div class="form-group text-light">
							<label for="username" class="text-reset">Username</label>
							<input type="text" id="username"
							placeholder="Enter Username" class="form-control">
							<div id="res-name" class="mx-3"></div>
						</div>
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
	<footer class="container-fluid bg-info mt-5">
		<div class="row p-3">
			<div class="col-7 text-monospace">
				<a href="https://www.medicaps.ac.in" class="text-reset">MEDICAPS-UNIVERSITY</a>
			</div>
			<div class="col-5">
				<span class="font-weight-bold text-monospace">BY: </span> <span> Darshika | Dev | Gurneet | Deepanshu </span>
			</div>
		</div>
	</footer>

	
	<script>
			document.getElementById("verification").addEventListener("submit",fire);
		    function fire(e) {
		 	if (document.getElementById("username").value== "" || document.getElementById("password").value== "") {
		 	throw alert("please fill out all the fields");
	        }
		    e.preventDefault();
            //creating url pattern
            var email=document.getElementById("username").value;  
            var password=document.getElementById("password").value;  
			var url="LoginAdmin";
			
            
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
						document.getElementById("username").classList.add("is-invalid");
						document.getElementById("res-name").innerHTML="invalid username";
						document.getElementById("res-name").classList.add("invalid-tooltip");
					}
					else if (res == "1") {
						document.getElementById("password").classList.add("is-invalid");
						document.getElementById("res-pass").innerHTML="wrong password";
						document.getElementById("res-pass").classList.add("invalid-tooltip");
					} 
					else {
						var opened = window.open("");
						opened.document.write(res);
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
			
            xhr.send("email="+email+"&password="+password);
        }
    </script>
  </body>

</html>