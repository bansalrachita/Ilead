<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Manager | Dashboard</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta name="description" content="Developed By M Abdur Rokib Promy">
<meta name="keywords"
	content="Admin, Bootstrap 3, Template, Theme, Responsive">
<!-- bootstrap 3.0.2 -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />

<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<!-- fullCalendar -->
<link
	href="${pageContext.request.contextPath}/resources/css/fullcalendar/fullcalendar.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="${pageContext.request.contextPath}/resources/css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- datepicker -->
<script
	src="${pageContext.request.contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>

<!-- JQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
	function showQuiz(str) {
		var xmlhttp;
		if (str == "") {
			document.getElementById("selectedquiz").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("quiz2").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/updateQuiz?QM_ID=" + str,
				true);
		xmlhttp.send();
	}
</script>


<script>
	function createQuestion(str) {
		var xmlhttp;
		if (str == "") {
			document.getElementById("AddQuestion").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("quiz3").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/createQuestion?QM_ID=" + str,
				true);
		xmlhttp.send();
	}
</script>

<script>
	function showQuizDelete(str) {
		var xmlhttp;
		if (str == "") {
			document.getElementById("deleteQuestion").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("insidequiz4").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/deleteQuiz?QM_ID=" + str,
				true);
		xmlhttp.send();
	}
</script>


<script>
	function showQuizquestions(str) {
		var xmlhttp;
		if (str == "") {
			document.getElementById("showQuiz").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("insidequiz5").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/showQuizquestions?QM_ID=" + str,
				true);
		xmlhttp.send();
	}
</script>



<script>
	$(document).ready(function() {
		$("#quiz1").hide();
		$("#create").click(function() {
			$("#quiz1").toggle("slow");
		});
	});
</script>


<script>
	$(document).ready(function() {
		$("#quiz2").hide();
		$("#update").click(function() {
			$("#quiz2").toggle("slow");
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#quiz3").hide();
		$("#add").click(function() {
			$("#quiz3").toggle("slow");
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#quiz4").hide();
		$("#delete").click(function() {
			$("#quiz4").toggle("slow");
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#quiz5").hide();
		$("#insidequiz5").hide();
		$("#view").click(function() {
			$("#quiz5").toggle("slow");
		});
		$("#showQuiz").click(function() {
			$("#insidequiz5").show(1000);
		});
		
	});
</script>

<script>
	var flag = true;

	function falsefunct() {
		return flag;
	}

	function validateForm() {
		var age = document.getElementById("number").value;
		var error = "Must be a numerical Value!";
		if (isNaN(age)) {
			document.getElementById("message").innerHTML = error;
			flag = false;
		} else {
			document.getElementById("message").innerHTML = " ";
			flag = true;
		}
	}
</script>

</head>
<body class="skin-black">
	<!-- header logo: style can be found in header.less -->
	<header class="header"> <a
		href="${pageContext.request.contextPath}/Manager_Dashboard"
		class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
		Manager
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
	<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Toggle navigation</span> <span
		class="icon-bar"></span> <span class="icon-bar"></span> <span
		class="icon-bar"></span>
	</a>
	<div class="navbar-right">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->
			<li class="dropdown messages-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-envelope"></i> <span class="label label-success">4</span>
			</a>
				<ul class="dropdown-menu">
					<li class="header">You have 4 messages</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<!-- start message --> <a href="#">
									<div class="pull-left">
										<img src="img/avatar3.png" class="img-circle" alt="User Image" />
									</div>
									<h4>
										Support Team <small><i class="fa fa-clock-o"></i> 5
											mins</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a>
							</li>
							<!-- end message -->
							<li><a href="#">
									<div class="pull-left">
										<img src="img/avatar2.png" class="img-circle" alt="user image" />
									</div>
									<h4>
										Manager Design Team <small><i class="fa fa-clock-o"></i>
											2 hours</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="img/avatar.png" class="img-circle" alt="user image" />
									</div>
									<h4>
										Developers <small><i class="fa fa-clock-o"></i> Today</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="img/avatar2.png" class="img-circle" alt="user image" />
									</div>
									<h4>
										Sales Department <small><i class="fa fa-clock-o"></i>
											Yesterday</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="img/avatar.png" class="img-circle" alt="user image" />
									</div>
									<h4>
										Reviewers <small><i class="fa fa-clock-o"></i> 2 days</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
							</a></li>
						</ul>
					</li>
					<li class="footer"><a href="#">See All Messages</a></li>
				</ul></li>
			<li class="dropdown tasks-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-tasks"></i> <span class="label label-danger">9</span>
			</a>
				<ul class="dropdown-menu">

					<li class="header">You have 9 tasks</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Design some buttons <small class="pull-right">20%</small>
									</h3>
									<div class="progress progress-striped xs">
										<div class="progress-bar progress-bar-success"
											style="width: 20%" role="progressbar" aria-valuenow="20"
											aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Create a nice theme <small class="pull-right">40%</small>
									</h3>
									<div class="progress progress-striped xs">
										<div class="progress-bar progress-bar-danger"
											style="width: 40%" role="progressbar" aria-valuenow="20"
											aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">40% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Some task I need to do <small class="pull-right">60%</small>
									</h3>
									<div class="progress progress-striped xs">
										<div class="progress-bar progress-bar-info" style="width: 60%"
											role="progressbar" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100">
											<span class="sr-only">60% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
							<li>
								<!-- Task item --> <a href="#">
									<h3>
										Make beautiful transitions <small class="pull-right">80%</small>
									</h3>
									<div class="progress progress-striped xs">
										<div class="progress-bar progress-bar-warning"
											style="width: 80%" role="progressbar" aria-valuenow="20"
											aria-valuemin="0" aria-valuemax="100">
											<span class="sr-only">80% Complete</span>
										</div>
									</div>
							</a>
							</li>
							<!-- end task item -->
						</ul>
					</li>
					<li class="footer"><a href="#">View all tasks</a></li>

				</ul></li>
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-user"></i> <span>Jane Doe <i class="caret"></i></span>
			</a>
				<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
					<li class="dropdown-header text-center">Account</li>

					<li><a href="#"> <i class="fa fa-clock-o fa-fw pull-right"></i>
							<span class="badge badge-success pull-right">10</span> Updates
					</a> <a href="#"> <i class="fa fa-envelope-o fa-fw pull-right"></i>
							<span class="badge badge-danger pull-right">5</span> Messages
					</a> <a href="#"><i class="fa fa-magnet fa-fw pull-right"></i> <span
							class="badge badge-info pull-right">3</span> Subscriptions</a> <a
						href="#"><i class="fa fa-question fa-fw pull-right"></i> <span
							class="badge pull-right">11</span> FAQ</a></li>

					<li class="divider"></li>

					<li><a href="#"> <i class="fa fa-user fa-fw pull-right"></i>
							Profile
					</a> <a data-toggle="modal" href="#modal-user-settings"> <i
							class="fa fa-cog fa-fw pull-right"></i> Settings
					</a></li>

					<li class="divider"></li>

					<li><a href="#"><i class="fa fa-ban fa-fw pull-right"></i>
							Logout</a></li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="img/avatar3.png" class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>Hello, Jane</p>

				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='seach' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="active"><a
				href="${pageContext.request.contextPath}/Manager_Dashboard"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/Manager_Profile">
					<i class="fa fa-gavel"></i> <span>Profile</span>
			</a></li>

			<li><a
				href="${pageContext.request.contextPath}/Manager_createQuiz"> <i
					class="fa fa-globe"></i> <span>Create Quiz</span>
			</a></li>

			<li><a
				href="${pageContext.request.contextPath}/Manager_EmployeePerformance">
					<i class="fa fa-glass"></i> <span>View Employee Performance</span>
			</a></li>

		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side"> <!-- Content Header (Page header) -->


		<!-- Main content --> <section class="content">
		<div class="row">
			<!-- <div class="col-lg-6">
                          <section class="panel">
                              <header class="panel-heading">
                                  Basic Forms
                              </header>
                              <div class="panel-body">
                                  <form role="form">
                                      <div class="form-group">
                                          <label for="exampleInputEmail1">Email address</label>
                                          <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                      </div>
                                      <div class="form-group">
                                          <label for="exampleInputPassword1">Password</label>
                                          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                      </div>
                                      <div class="form-group">
                                          <label for="exampleInputFile">File input</label>
                                          <input type="file" id="exampleInputFile">
                                          <p class="help-block">Example block-level help text here.</p>
                                      </div>
                                      <div class="checkbox">
                                          <label>
                                              <input type="checkbox"> Check me out
                                          </label>
                                      </div>
                                      <button type="submit" class="btn btn-info">Submit</button>
                                  </form>

                              </div>
                          </section>
                      </div> -->
			<div class="col-lg-6">
				<!-- <section class="panel">
                              <header class="panel-heading">
                                  Horizontal Forms
                              </header>
                              <div class="panel-body">
                                  <form class="form-horizontal" role="form">
                                      <div class="form-group">
                                          <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Email</label>
                                          <div class="col-lg-10">
                                              <input type="email" class="form-control" id="inputEmail1" placeholder="Email">
                                              <p class="help-block">Example block-level help text here.</p>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Password</label>
                                          <div class="col-lg-10">
                                              <input type="password" class="form-control" id="inputPassword1" placeholder="Password">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <div class="checkbox">
                                                  <label>
                                                      <input type="checkbox"> Remember me
                                                  </label>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <button type="submit" class="btn btn-danger">Sign in</button>
                                          </div>
                                      </div>
                                  </form>
                              </div>
                          </section> -->
				<section class="panel" style="width: 700px">

				<div class="panel-body" >
				
						<button type="button" class="btn btn-primary" id="create">Create Test</button>
						
						<button type="button" class="btn btn-primary" id="update" >Update Test</button>
				
						<button type="button" class="btn btn-primary" id="add">Add Question</button>
						
						<button type="button" class="btn btn-primary" id="view" >View Test</button>
				
						<button type="button" class="btn btn-danger" id="delete">Delete Test</button>
				

					<!-- <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                  <h4 class="modal-title">Form Tittle</h4>
                                              </div>
                                              <div class="modal-body">

                                                  <form role="form">
                                                      <div class="form-group">
                                                          <label for="exampleInputEmail1">Email address</label>
                                                          <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Enter email">
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="exampleInputPassword1">Password</label>
                                                          <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="exampleInputFile">File input</label>
                                                          <input type="file" id="exampleInputFile3">
                                                          <p class="help-block">Example block-level help text here.</p>
                                                      </div>
                                                      <div class="checkbox">
                                                          <label>
                                                              <input type="checkbox"> Check me out
                                                          </label>
                                                      </div>
                                                      <button type="submit" class="btn btn-default">Submit</button>
                                                  </form>
                                              </div>
                                          </div>
                                      </div>
                                  </div> -->
					<!-- <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                  <h4 class="modal-title">Form Tittle</h4>
                                              </div>
                                              <div class="modal-body">

                                                  <form class="form-horizontal" role="form">
                                                      <div class="form-group">
                                                          <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Email</label>
                                                          <div class="col-lg-10">
                                                              <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Password</label>
                                                          <div class="col-lg-10">
                                                              <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <div class="col-lg-offset-2 col-lg-10">
                                                              <div class="checkbox">
                                                                  <label>
                                                                      <input type="checkbox"> Remember me
                                                                  </label>
                                                              </div>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <div class="col-lg-offset-2 col-lg-10">
                                                              <button type="submit" class="btn btn-default">Sign in</button>
                                                          </div>
                                                      </div>
                                                  </form>

                                              </div>

                                          </div>
                                      </div>
                                  </div> -->
					<!-- <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-2" class="modal fade">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                  <h4 class="modal-title">Form Tittle</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <form class="form-inline" role="form">
                                                      <div class="form-group">
                                                          <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                          <input type="email" class="form-control sm-input" id="exampleInputEmail5" placeholder="Enter email">
                                                      </div>
                                                      <div class="form-group">
                                                          <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                          <input type="password" class="form-control sm-input" id="exampleInputPassword5" placeholder="Password">
                                                      </div>
                                                      <div class="checkbox">
                                                          <label>
                                                              <input type="checkbox"> Remember me
                                                          </label>
                                                      </div>
                                                      <button type="submit" class="btn btn-default">Sign in</button>
                                                  </form>

                                              </div>

                                          </div>
                                      </div>
                                  </div> -->
				</div>
				</section>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<section class="panel" id="quiz1"> <header
					class="panel-heading"> Create Test </header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form"
						action="${pageContext.request.contextPath}/createTest"
						method="post">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Title</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="testName">
								<span class="help-block">Give a relevant Name to your
									test</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Number of
								Questions</label>
							<div class="col-sm-1">
								<input type="text" id="number" class="form-control"
									maxlength="2" onkeyup="validateForm()" name="number" /><span
									class="help-block">Maximum 10</span>
							</div>
							<span id="message" style="color: red;"></span>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Maximum Points</label>
							<div class="col-sm-1">
								<input type="text" id="number" class="form-control"
									maxlength="2" onkeyup="validateForm()" name="maxPoints" /><span
									class="help-block">specify a number</span>
							</div>
							<span id="message" style="color: red;"></span>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label" id="datepicker">Deadline</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" placeholder=" mm/dd/yy " name="deadline"/>
								<!-- <input class="datepicker" data-date-format="mm/dd/yyyy"> -->
							</div>
						</div>
						<div class="form-group">

							<div class="col-sm-10" style="float: right;">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>

						</div>
					</form>
				</div>
				</section>
				<section class="panel" id="quiz2"> <header class="panel-heading">
				Update Test</header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form">
						<div class="form-group">
							<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Select Test</label>
							<div class="col-lg-10">
								<select id="selectedquiz" class="form-control m-b-10" onclick="showQuiz(this.value)">
								<c:forEach var="quiz" items="${quizes}">
									<option value="${quiz.QM_ID }">${quiz.quizName}</option>
									</c:forEach>
								</select> 
							</div>
						</div>
						<!-- <div class="form-group">

							<div class="col-sm-10" style="float: right;">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>

						</div> -->
					</form>
				</div>
				</section>
				<section class="panel" id="quiz3"> <header class="panel-heading">
				Select Quiz </header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form">
						<div class="form-group">
							<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Select Test</label>
							<div class="col-lg-10">
								<select id="AddQuestion" class="form-control m-b-10" onclick="createQuestion(this.value)">
								<c:forEach var="quiz" items="${quizes}">
									<option value="${quiz.QM_ID }">${quiz.quizName}</option>
									</c:forEach>
								</select> 
							</div>
						</div>
						<!-- <div class="form-group">

							<div class="col-sm-10" style="float: right;">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>

						</div> -->
					</form>
				</div>
				</section>
				
				<section class="panel" id="quiz4"> <header class="panel-heading">
				Select Quiz </header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form">
						<div class="form-group">
							<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Select Test</label>
							<div class="col-lg-10">
								<select id="deleteQuestion" class="form-control m-b-10" onclick="showQuizDelete(this.value)">
								<c:forEach var="quiz" items="${quizes}">
									<option value="${quiz.QM_ID }">${quiz.quizName}</option>
									</c:forEach>
								</select> 
							</div>
						</div>
						<div><span id="insidequiz4" style="color:black; font-weight: bold;"> </span></div>
					</form>
				</div>
				</section>
				
				
				<section class="panel" id="quiz5"> <header class="panel-heading">
				View Test </header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form">
						<div class="form-group">
							<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Select Test</label>
							<div class="col-lg-10">
								<select id="showQuiz" class="form-control m-b-10" onclick="showQuizquestions(this.value)">
								<c:forEach var="quiz" items="${quizes}">
									<option value="${quiz.QM_ID }">${quiz.quizName}</option>
									</c:forEach>
								</select> 
							</div>
						</div>
					</form>
					<div class="row" id="insidequiz5">

						
					</div>

				</div>
				</section>
			</div>
		</div>

		</section><!-- /.content --> </aside>
		<!-- /.right-side -->
		<!-- <div class="footer-main">Copyright &copy Lead, 2015</div> -->
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 2.0.2 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"
		type="text/javascript"></script>

	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- Manager App -->
	<script
		src="${pageContext.request.contextPath}/resources/js/Director/app.js"
		type="text/javascript"></script>
</body>
</html>
