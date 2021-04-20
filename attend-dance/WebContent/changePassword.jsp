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


<title>Change password</title>


</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
        

		<% 
			String teacher_id=request.getParameter("teacher_id");
			  
        %>
		<input type="text" value="<%= teacher_id %>" id="email" hidden>

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
						<li class="breadcrumb-item active">Change password</li>
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
						<header class="text-center font-weight-bold my-3">CHANGE PASSWORD</header>
					</div>
				</div>

				<div class="row  my-3">
					<div class="col">
						<div class="form-group text-light">
							<label for="password" class="text-reset">CURRENT PASSWORD</label>
							<input type="password" id="password"
							placeholder="Enter current password" class="form-control">
						</div>
					</div>	
				</div>
				
				<div class="row my-3">
					<div class="col">
						<div class="form-group text-light">
							<label for="new_password" class="text-reset">NEW PASSWORD</label>
							<input type="password" id="new_password" 
							placeholder="Enter New Password" class="form-control" onkeyup='check();'>
						</div>
					</div>
				</div>

				<div class="row my-3">
					<div class="col">
						<div class="form-group text-light">
							<label for="confirm_password" class="text-reset">CONFIRM NEW PASSWORD</label>
							<input type="password" id="confirm_password" 
							placeholder="Confirm New Password" class="form-control" onkeyup='check();'>
							<div id="message" class="text-monospace" ></div>
						</div>
					</div>
				</div>
		
				<div class="row my-3">
					<div class="col">
						<input type="submit" value="submit"
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

	
	<script>

		function check() {
			if (document.getElementById('new_password').value == document.getElementById('confirm_password').value) {
				if (document.getElementById('new_password').value.length > 5) {
					document.getElementById('message').style.color = 'green';
					document.getElementById('message').innerHTML = 'password matched';
				}
				else{
					document.getElementById('message').style.color = 'yellow';
					document.getElementById('message').innerHTML = 'password must be greater than 6 character';
				}
			} else {
				document.getElementById('message').style.color = 'red';
				document.getElementById('message').innerHTML = 'not matching';
			}


		}


		document.getElementById("verification").addEventListener("submit",fire);
		function fire(e) {
			var password=document.getElementById("password").value;  
			var password=document.getElementById("password").value;  
			var new_password=document.getElementById("new_password").value;  
			var confirm_password=document.getElementById("confirm_password").value;
			//alert(confirm_password);
			var email=document.getElementById("email").value; 

			if(email==null){
				throw alert("can't fulfill  your request");
			}
			if (password == "" || new_password== "" || confirm_password== "") {
				throw alert("please fill out all the fields");
			}
			if(new_password != confirm_password){
				throw alert("enter your new passsword again");
			}
			if (new_password==confirm_password && confirm_password.length < 6) {
				throw alert("password must be greater than 6 character");
			}
			e.preventDefault();

			//creating url pattern  
			var url="ChangePassword";
			
			
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
						throw alert("password changed successfully");
					}
					else if (res == "1") {
						throw alert("can'update contact database adminstrator");
					} 
					else if (res == "2") {
						throw alert("can'update contact database admin");
					}
					else if (res == "3") {
						throw alert("incorrect password");
					}
					else if (res == "4") {
						throw alert("can'update contact database admin");
					} 
				}
				else if (this.status == 404) 
				{
					throw alert("something went wrong");
				}
			}
		
			xhr.send("confirm_password="+confirm_password+"&password="+password+"&email="+email);
        }
    </script>
  </body>

</html>