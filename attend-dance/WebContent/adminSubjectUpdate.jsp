<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">

<title>update</title>

</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">

    <%
        String subject_id = request.getParameter("subject_id");
        String subject_name = request.getParameter("subject_name");
        
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
						<li class="breadcrumb-item"><a href="adminSubject.jsp">Add-Update-Delete</a></li>
                        <li class="breadcrumb-item"><a href="adminSubjectUpDel.jsp">List</a></li>
						<li class="breadcrumb-item active">Update</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>

	<!---------------    main     -------------->

	<form class="container mt-3" id="update">
        <div class="row justify-content-center">
            <div class="col-6 border border-primary rounded bg-info">

                <div class="row bg-primary">
                    <div class="col text-monospace">
                        <header class="text-center font-weight-bold my-3">update information</header>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col text-light">
                        <label for="subject_name " class="text-reset">Name</label>
                        <input type="text" id="subject_name"
                        placeholder="Name Of The Subject" class="form-control" value="<%=subject_name%>" required>
                    </div>	
                </div>
        
                <div class="row my-3">
                    <div class="col text-light">
                        <label for="subject_id" class="text-reset">ID</label>
                        <input type="text" id="new_subject_id" 
                        placeholder="Enter Subject ID" class="form-control" value="<%=subject_id%>" required>
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col">
                        <input type="submit" value="UPDATE" id="submit_botton"
                        class="btn btn-block btn-outline-warning font-weight-bold">
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
    

    <!-----------    script     --------------->

    <script>
        document.getElementById("update").addEventListener("submit",fire);
        function fire(e) {
        if (document.getElementById("new_subject_id").value == "" || document.getElementById("subject_name").value== "") {
            //alert("please choose section");   this doesnot stop the execution of program
            throw alert("please fill out all the fields");
        }
        e.preventDefault();
        //creating url pattern
        var subject_name=document.getElementById("subject_name").value;  
        var new_subject_id=document.getElementById("new_subject_id").value;  
        var url="AdminSubjectUpdate?subject_name="+subject_name+"&new_subject_id="+new_subject_id+"&subject_id=<%=subject_id %>";
       
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
                    document.getElementById("response").innerHTML="updated";
                    document.getElementById("student_name").value="";
                    document.getElementById("new_student_id").value="";
                    document.getElementById('student_name').readOnly = true;
                    document.getElementById('new_student_id').readOnly = true; 
                    document.getElementById("submit_botton").disabled= true;
                    }
                if(res=="1")
                   {
                    document.getElementById("response").innerHTML="can't update";
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