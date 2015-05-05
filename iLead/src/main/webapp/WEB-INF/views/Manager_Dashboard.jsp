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
<!-- Morris chart -->
<link
	href="${pageContext.request.contextPath}/resources/css/morris/morris.css"
	rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link
	href="${pageContext.request.contextPath}/resources/css/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link
	href="${pageContext.request.contextPath}/resources/css/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<!-- fullCalendar -->
<!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
<!-- Daterange picker -->
<link href="css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- iCheck for checkboxes and radio inputs -->
<link
	href="${pageContext.request.contextPath}/resources/css/iCheck/all.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

<script>
	function showEmployees(str) {
		var xmlhttp;
		
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("listEmp").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/listEmployees" + str,
				true);
		xmlhttp.send();
	}
</script>
<script>
	$(document).ready(function() {
		$("#questionpanel").hide();
		$("#addEmployee").click(function() {
			$("#questionpanel").toggle("slow");
		});
	});
</script>


<script>
	function addTasks(str) {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("added").innerHTML = "Task Added";
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/addTask?str=" + str,
				true);
		xmlhttp.send();
	}
</script>

</head>
<body class="skin-black">
	<!-- header logo: style can be found in header.less -->
	<header class="header"> <a
		href="${pageContext.request.contextPath}/Manager_Dashboard"
		class="logo"> Manager </a> <!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
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
										<img src="img/26115.jpg" class="img-circle" alt="User Image" />
									</div>
									<h4>Support Team</h4>
									<p>Why not buy a new awesome theme?</p> <small
									class="pull-right"><i class="fa fa-clock-o"></i> 5 mins</small>
							</a>
							</li>
							<!-- end message -->
							<li><a href="#">
									<div class="pull-left">
										<img src="img/26115.jpg" class="img-circle" alt="user image" />
									</div>
									<h4>Manager Design Team</h4>
									<p>Why not buy a new awesome theme?</p> <small
									class="pull-right"><i class="fa fa-clock-o"></i> 2
										hours</small>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="img/avatar.png" class="img-circle" alt="user image" />
									</div>
									<h4>Developers</h4>
									<p>Why not buy a new awesome theme?</p> <small
									class="pull-right"><i class="fa fa-clock-o"></i> Today</small>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="img/26115.jpg" class="img-circle" alt="user image" />
									</div>
									<h4>Sales Department</h4>
									<p>Why not buy a new awesome theme?</p> <small
									class="pull-right"><i class="fa fa-clock-o"></i>
										Yesterday</small>
							</a></li>
							<li><a href="#">
									<div class="pull-left">
										<img src="img/avatar.png" class="img-circle" alt="user image" />
									</div>
									<h4>Reviewers</h4>
									<p>Why not buy a new awesome theme?</p> <small
									class="pull-right"><i class="fa fa-clock-o"></i> 2 days</small>
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
					class="fa fa-user"></i> <span>${sessionScope.username } <i
						class="caret"></i></span>
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
				<img src="img/26115.jpg" class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>Hello, ${sessionScope.username }</p>

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

		<aside class="right-side"> <!-- Main content --> <section
			class="content">

		<div class="row" style="margin-bottom: 5px;">


			<div class="col-md-3">
				<div class="sm-st clearfix">
					<span class="sm-st-icon st-red"><i
						class="fa fa-check-square-o"></i></span>
					<div class="sm-st-info">
						<c:set var="count" value="0"></c:set>
						<c:forEach var="task" items="${sessionScope.managertasks}">
							<c:set var="count" value="${count +1}"></c:set>
						</c:forEach>
						<span>${count}</span> Total Tasks
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="sm-st clearfix">
					<span class="sm-st-icon st-violet"><i
						class="fa fa-envelope-o"></i></span>
					<div class="sm-st-info">
						<span>2200</span> Total Updates
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="sm-st clearfix">
					<span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
					<div class="sm-st-info">
						<span>4567</span> Total Threads
					</div>
				</div>
			</div>
		</div>

		<!-- Main row -->
		<div class="row">

			<div class="col-md-8">
				<!--earning graph start-->
				<section class="panel"> <header class="panel-heading">
				Earning Graph </header>
				<div class="panel-body">
					<canvas id="linechart" width="300" height="200"></canvas>
				</div>
				</section>
				<!--earning graph end-->

			</div>
			<div class="col-lg-4">

				<!--chat start-->
				<section class="panel"> <header class="panel-heading">
				Discussion Threads </header>
				<div class="panel-body" id="noti-box">
					<c:forEach var="thread" items="${sessionScope.threads}">
						<div class="alert alert-block alert-danger">
							<button data-dismiss="alert" class="close close-sm" type="button">
								<i class="fa fa-times"></i>
							</button>
							<strong><a href="#">${thread.threadString }</a></strong><br />
							<br /> <span class="label label-inverse">${thread.date}</span>
						</div>
					</c:forEach>

				</div>
				</section>



			</div>


		</div>
		<div class="row">

			<div class="col-md-8">
				<section class="panel"> <header class="panel-heading">
				Work Progress </header>
				<div class="panel-body table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Project</th>
								<th>Manager</th>
								<th>StartDate</th>
								<th>Deadline</th>
								<th>Status</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>${sessionScope.user.projectName}</td>
								<td>${sessionScope.user.username}</td>
								<td>${sessionScope.user.startDate}</td>
								<td>${sessionScope.user.endDate }</td>
								<td><span class="label label-danger">in progress</span></td>
							</tr>

						</tbody>
					</table>
				</div>
				</section>


			</div>
			<!--end col-6 -->
			<!-- <div class="col-md-4">
				<section class="panel"> <header class="panel-heading">
				Twitter Feed </header>
				<div class="panel-body">
					<div class="twt-area">
						<form action="#" method="post">
							<textarea class="form-control" name="profile-tweet"
								placeholder="Share something on Twitter.." rows="3"></textarea>

							<div class="clearfix">
								<button class="btn btn-sm btn-primary pull-right" type="submit">
									<i class="fa fa-twitter"></i> Tweet
								</button>
								<a class="btn btn-link btn-icon fa fa-location-arrow"
									data-original-title="Add Location" data-placement="bottom"
									data-toggle="tooltip" href="#" style="text-decoration: none;"
									title=""></a> <a class="btn btn-link btn-icon fa fa-camera"
									data-original-title="Add Photo" data-placement="bottom"
									data-toggle="tooltip" href="#" style="text-decoration: none;"
									title=""></a>
							</div>
						</form>
					</div>
					<ul class="media-list">
						<li class="media"><a href="#" class="pull-left"> <img
								src="img/26115.jpg" alt="Avatar" class="img-circle" width="64"
								height="64">
						</a>
							<div class="media-body">
								<span class="text-muted pull-right"> <small><em>30
											min ago</em></small>
								</span> <a href="page_ready_user_profile.php"> <strong>John
										Doe</strong>
								</a>
								<p>
									In hac <a href="#">habitasse</a> platea dictumst. Proin ac nibh
									rutrum lectus rhoncus eleifend. <a href="#" class="text-danger">
										<strong>#dev</strong>
									</a>
								</p>
							</div></li>
						<li class="media"><a href="#" class="pull-left"> <img
								src="img/26115.jpg" alt="Avatar" class="img-circle" width="64"
								height="64">
						</a>
							<div class="media-body">
								<span class="text-muted pull-right"> <small><em>30
											min ago</em></small>
								</span> <a href="page_ready_user_profile.php"> <strong>John
										Doe</strong>
								</a>
								<p>
									In hac <a href="#">habitasse</a> platea dictumst. Proin ac nibh
									rutrum lectus rhoncus eleifend. <a href="#" class="text-danger">
										<strong>#design</strong>
									</a>
								</p>
							</div></li>
					</ul>
				</div>
				</section>
			</div> -->

		</div>
		<div class="row">
			<div class="col-md-5">

				<div class="panel">
					<header class="panel-heading"> Teammates </header>

					<ul class="list-group teammates">
						<li class="list-group-item"><a href=""><img
								src="img/26115.jpg" width="50" height="50"></a> <span
							class="pull-right label label-danger inline m-t-15">Manager</span>
							<a href="">${sessionScope.username}</a></li>

						<c:forEach var="teammate" items="${sessionScope.user.employee}">
							<li class="list-group-item"><a href=""><img
									src="img/26115.jpg" width="50" height="50"></a> <span
								class="pull-right label label-info inline m-t-15">Member</span>
								<a href="">${teammate.username}</a></li>
						</c:forEach>
					</ul>
					<div class="panel-footer bg-white">
						<form>
							<!-- <span class="pull-right badge badge-info">32</span> -->
							<button id="addEmployee" class="btn btn-primary btn-addon btn-sm"
								onclick="showEmployees(this.value)" type="button">
								<i class="fa fa-plus"></i> Add Teammate
							</button>
						</form>
					</div>
					<section class="panel" id="questionpanel" style="height: auto;">
					<header class="panel-heading"> Add Teammates </header>
					<div class="panel-body">
						<div class="form-group">

							<div class="col-lg-10" id="listEmp"></div>


						</div>
					</div>
					</section>
				</div>
			</div>



			<div class="col-md-7">
				<section class="panel tasks-widget"> <header
					class="panel-heading"> Todo list </header>
				<div class="panel-body">

					<div class="task-content">

						<ul class="task-list">
							<c:forEach var="task" items="${sessionScope.managertasks}">
								<li>

									<form
										action="${pageContext.request.contextPath}/deletemanagertask"
										method="post">
										<!--  <div class="task-checkbox">
                                              <input type="checkbox" class="list-child" value=""  />
                                              <input type="checkbox" class="flat-grey list-child"/>
                                              <input type="checkbox" class="square-grey"/>
                                          </div> -->
										<div class="task-title">
											<span class="task-title-sp">${task.todomessage}</span> <span
												class="label label-success">${task.creationDate}</span>
											<div class="pull-right hidden-phone">
												<button type="button" class="btn btn-default btn-xs">
													<i class="fa fa-check"></i>
												</button>
												<button type="button" class="btn btn-default btn-xs">
													<i class="fa fa-pencil"></i>
												</button>
												<input type="hidden" name="delbutton" value="${task.id}" />
												<button type="submit" class="btn btn-default btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</div>
										</div>
									</form>

								</li>
							</c:forEach>
						</ul>
					</div>


					<form>
						<div class=" add-task-row">
							<div class="panel-body">
								<div class="form-group">
									<span id="added"></span>
									<div class="form-group has-success">
										<label class="col-sm-2 control-label col-lg-2"
											for="inputSuccess">Add Here</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="taskmessage">
										</div>
									</div>
								</div>
							</div>
							<button id="addEmployee" class="btn btn-primary btn-addon btn-sm"
								onclick="addTasks(document.getElementById('taskmessage').value)"
								type="button">
								<i class="fa fa-plus"></i> Add Tasks
							</button>
							<a class="btn btn-default btn-sm pull-right" href="#">See All
								Tasks</a>
						</div>

					</form>


				</div>
				</section>

			</div>
		</div>
		<!-- row end --> </section> <!-- /.content -->
		<div class="footer-main">Copyright &copy iLead, 2015</div>
		</aside>
		<!-- /.right-side -->

	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.0.2 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"
		type="text/javascript"></script>

	<!-- jQuery UI 1.10.3 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.3.min.js"
		type="text/javascript"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/chart.js"
		type="text/javascript"></script>

	<!-- datepicker
        <script src="${pageContext.request.contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
	<!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
	<!-- calendar -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/fullcalendar/fullcalendar.js"
		type="text/javascript"></script>

	<!-- Manager App -->
	<script
		src="${pageContext.request.contextPath}/resources/js/Director/app.js"
		type="text/javascript"></script>

	<!-- Manager dashboard demo (This is only for demo purposes) -->
	<script
		src="${pageContext.request.contextPath}/resources/js/Director/dashboard.js"
		type="text/javascript"></script>

	<!-- Manager for demo purposes -->
	<script type="text/javascript">
		$('input').on('ifChecked', function(event) {
			// var element = $(this).parent().find('input:checkbox:first');
			// element.parent().parent().parent().addClass('highlight');
			$(this).parents('li').addClass("task-done");
			console.log('ok');
		});
		$('input').on('ifUnchecked', function(event) {
			// var element = $(this).parent().find('input:checkbox:first');
			// element.parent().parent().parent().removeClass('highlight');
			$(this).parents('li').removeClass("task-done");
			console.log('not');
		});
	</script>
	<script>
		$('#noti-box').slimScroll({
			height : '400px',
			size : '5px',
			BorderRadius : '5px'
		});

		$('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey')
				.iCheck({
					checkboxClass : 'icheckbox_flat-grey',
					radioClass : 'iradio_flat-grey'
				});
	</script>
	<script type="text/javascript">
		$(function() {
			"use strict";
			//BAR CHART
			var data = {
				labels : [ "2001", "2002", "2003", "2004", "2005",
						"2006", "2007" ],
				datasets : [ {
					label : "My First dataset",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : [ 65, 59, 80, 81, 56, 55, 40 ]
				}, {
					label : "My Second dataset",
					fillColor : "rgba(151,187,205,0.2)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(151,187,205,1)",
					data : [ 28, 48, 40, 19, 86, 27, 90 ]
				} ]
			};
			new Chart(document.getElementById("linechart").getContext("2d"))
					.Bar(data, {
						responsive : true,
						maintainAspectRatio : false,
					});

		});
		 Chart.defaults.global.responsive = true;
	</script>
</body>
</html>