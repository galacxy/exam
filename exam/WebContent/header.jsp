<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='dist/css/bootstrap-watch.css' rel="Stylesheet"
	type='text/css' />
<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<title>Exams</title>
<script type="text/javascript">
$(document).ready(function(){
    $('#btn-addquest').click(function() {        
         $('#div-add').toggle('swing');
         $("#div-add").css("display", "flex");
    });
    $('#message-panel').delay(5000).fadeOut('slow');
    $("#table").tablesorter(); 
});
</script>
</head>
<body>
	<div class="navbar  navbar-fixed-top" role="navigation" >
		<div class="navbar-header" style="padding-left:90px;">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Exams</a>
		</div>
		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav">
				<li <%if(request.getRequestURL().toString().contains(".jsp")==false) {%>class="active"<%} %>><a href="index.jsp">Home</a></li>
				<li <%if(request.getRequestURL().toString().contains("newexam")) {%>class="active"<%} %>><a href="newexam.jsp">New Exam</a></li>
			</ul>
			<div class="col-lg-6">
				<form class="navbar-form navbar-left" action="index.jsp"
					method="get">
					<div class="input-group">
						<input type="text" class="form-control col-lg-8"
							placeholder="Search Exams or Questions here  ......"
							name="search-term" id="search-term"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;
							</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>