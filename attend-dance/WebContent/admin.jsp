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
    
  <title>admin</title>
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
            <li class="breadcrumb-item"><a href="loginAdmin.jsp">Admin Login</a></li>
						<li class="breadcrumb-item active">Admin</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

    <!---------------    main     -------------->
  <div class="container-fluid mt-3">
    <div class="row justify-content-center">
      <div class="col-5 border border-primary rounded bg-info">

        <div class="row bg-primary">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">PLEASE CHOOSE</header>
					</div>
				</div>

        <div class="row mt-3">
          <div class="col">
            <a href="adminStudent.jsp" class="btn btn-block btn-outline-light my-2">Manage Student</a>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <a href="adminTeacher.html" class="btn btn-block btn-outline-light my-2">Manage Teacher</a>
          </div>
        </div>
        
        <div class="row">
          <div class="col">
            <a href="adminCoordinator.jsp" class="btn btn-block btn-outline-light my-2">Manage Coordinator</a>
          </div>
        </div>
        
        <div class="row">
          <div class="col">
            <a href="adminSubject.jsp" class="btn btn-block btn-outline-light my-2">Manage Subject</a>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col">
            <a href="adminSection.jsp" class="btn btn-block btn-outline-light my-3">Manage Section</a>
          </div>
        </div>

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
  </body>
</html>