<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css">    
	<title>admin.choose</title>
	


  </head>
    <body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
        
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
                <li class="breadcrumb-item active">Choose</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>

    <!---------------    main     -------------->
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-5 border border-primary rounded bg-info">

        <div class="row bg-primary">
					<div class="col text-monospace">
						<header class="text-center font-weight-bold my-3">PLEASE CHOOSE</header>
					</div>
				</div>

        <div class="row mt-3">
          <div class="col">
            <a href="adminStudent.jsp" class="btn btn-block btn-outline-light my-3">Manage Student</a>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <a href="adminTeacher.html" class="btn btn-block btn-outline-light my-3">Manage Teacher</a>
          </div>
        </div>
        
        <div class="row">
          <div class="col">
            <a href="adminCoordinator.jsp" class="btn btn-block btn-outline-light my-3">Manage Coordinator</a>
          </div>
        </div>
        
        <div class="row">
          <div class="col">
            <a href="adminSubject.jsp" class="btn btn-block btn-outline-light my-3">Manage Subject</a>
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