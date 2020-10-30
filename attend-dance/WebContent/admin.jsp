<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>HOME</title>
  </head>
  <body>
	
	<div class="custom-breadcrumns border-bottom" style="background-color:  rgb(195, 211, 210); padding:10px; text-align:center" >
		<div class="container">
			<a href="index.html">Home</a>|
			<a href="loginAdmin.html">AdminLogin</a>|
			<span class="current">Admin</span>
		</div>
	</div>

	<div class="row justify-content-center" style="margin:5em">
        <div class="col-md-5">
          <div class="row">
            <div class="col-12">
              <a href="adminStudent.jsp"><input type="button" value="Manage Student" class="btn btn-primary btn-lg px-5" style="width: 18em; background-color:  rgb(150, 222, 235);"></a>
            </div>
          </div><br>
          <div class="row">
            <div class="col-12">
              <a href="adminTeacher.jsp"><input type="button" value="Manage Teacher" class="btn btn-primary btn-lg px-5" style="width: 18em; background-color:  rgb(150, 222, 235);">
            </a></div>
          </div><br>
          <div class="row">
            <div class="col-12">
              <a href="adminCoordinator.jsp"><input type="button" value="Manage Coordinator" class="btn btn-primary btn-lg px-5" style="width: 18em; background-color:  rgb(150, 222, 235);">
            </a></div>
          </div><br>
          <div class="row">
            <div class="col-12">
              <a href="adminSubject.jsp"><input type="button" value="Manage Subject" class="btn btn-primary btn-lg px-5" style="width: 18em; background-color:  rgb(150, 222, 235);">
            </a></div>
          </div><br>
          <div class="row">
            <div class="col-12">
              <a href="adminSection.jsp"><input type="button" value="Manage Section" class="btn btn-primary btn-lg px-5" style="width: 18em; background-color:  rgb(150, 222, 235);">
            </a></div>
          </div>
        </div>
      </div>
		
<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
  </body>
</html>