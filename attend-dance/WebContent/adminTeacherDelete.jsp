<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
        String teacher_id = request.getParameter("teacher_id");
        String teacher_name = request.getParameter("teacher_name");
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
						<li class="breadcrumb-item active">Admin teacher-section</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

	<!---------------    main     -------------->

	<form class="container mt-3" id="delete">
        <div class="row justify-content-center">
            <div class="col-6 border border-primary rounded bg-info">

                <div class="row bg-primary">
                    <div class="col text-monospace">
                        <header class="text-center font-weight-bold my-3">DELETE INFORMATION</header>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col text-light">
                        <label for="teacher_name " class="text-reset">Name</label>
                        <input type="text" id="teacher_name"
                        class="form-control" value="<%=teacher_name%>" required readonly>
                    </div>	
                </div>
        
                <div class="row my-3">
                    <div class="col text-light">
                        <label for="teacher_id" class="text-reset">ID</label>
                        <input type="text" id="teacher_id" 
                        class="form-control" value="<%=teacher_id%>" required readonly>
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col">
                        <input type="submit" value="DELETE" id="submit_botton"
                        class="btn btn-block btn-outline-danger">
                    </div>
                </div>

            </div>
        </div>
    </form>


    <!---------------    RESPONSE     -------------->

    <div class="container my-4">
        <div class="row justify-content-center">
            <div class="col-5 bg-warning text-monospace " id="design">
                <span class="text-center font-weight-bold my-3" id="response"></span>
            </div>
        </div>
    </div>


	<!---------------    footer     -------------->

	<footer class="container-fluid bg-info mt-3">
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
    

    <!-----------    script     --------------->

    <script>
        document.getElementById("delete").addEventListener("submit",fire);
        function fire(e) {
        if (document.getElementById("teacher_id").value !== "<%= teacher_id %>" || document.getElementById("teacher_name").value !== "<%= teacher_name %>") {
            //alert("please choose section");   this doesnot stop the execution of program
            throw alert("you cant update the information while deleting");
        }
        e.preventDefault();
        //creating url pattern
        var url="AdminTeacherDelete?teacher_id=<%=teacher_id %>";
        console.log(url);
       
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
                    document.getElementById("response").innerHTML="deleted";
                    document.getElementById("teacher_name").value="";
                    document.getElementById("teacher_id").value="";
                    document.getElementById("teacher_id").value="";
                    document.getElementById("submit_botton").disabled= true;
                    }
                if(res=="1")
                   {
                    document.getElementById("response").innerHTML="can't delete";
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