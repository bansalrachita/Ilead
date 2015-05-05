<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Manager | Employee Performance</title>
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
<!-- google font -->
<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<!-- JQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$("#results").hide();
		$("#leaderQuiz").click(function() {
			$("#results").toggle("slow");
		});
	});
</script>

<script>
	function showLeader(str) {
		var xmlhttp;
		if (str == "") {
			document.getElementById("leaderQuiz").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("results").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/showLeader?QM_ID=" + str,
				true);
		xmlhttp.send();
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
		<aside class="right-side"> <!-- Main content --> <section
			class="content">
		<div class="row">
			<!-- /.col -->
			<div class="col-md-12">
				<div class="panel">
					<header class="panel-heading"> Quiz Applications </header>
					<div class="panel-body">
						<div class="box-tools">
							<ul class="pagination pagination-sm m-b-10 m-t-10 pull-right">
								<li><a href="#">&laquo;</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</div>
						<table class="table">
							<tr>
								<th style="width: 10px">#</th>
								<th>Quiz</th>
								<th>Response</th>
								<th style="width: 40px">% Participation</th>
							</tr>

							<c:set var="count" value="1"></c:set>
							<c:set var="c" value="0"></c:set>



							<c:forEach begin="${c}" end="0">
								<c:forEach var="quiz" items="${quizMaster}">

									<tr>
										<td>${count}.</td>
										<td>${ quiz.quizName}&nbsp</td>


										<td><c:set var="perCount"
												value="${(empCount[c] / countEmployees)*100}"></c:set> <c:choose>
												<c:when test="${perCount < 40 }">
													<div class="progress xs">
														<div class="progress-bar progress-bar-danger"
															style="width: ${perCount}%"></div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="progress xs progress-striped active">
														<div class="progress-bar progress-bar-success"
															style="width: ${perCount}%"></div>
													</div>
												</c:otherwise>
											</c:choose></td>
										<td><span class="badge bg-red"><fmt:formatNumber
													type="number" maxIntegerDigits="3" value="${perCount}" />
												%</span></td>
									</tr>

									<c:set var="c" value="${c+1}"></c:set>
									<c:set var="count" value="${count +1 }"></c:set>
								</c:forEach>
							</c:forEach>



						</table>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->


			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-xs-12">
				<div class="panel">
					<header class="panel-heading"> Leaderboard Results </header>
					<!-- <div class="box-header"> -->

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<form class="form-horizontal tasi-form">
								<div class="form-group">
									<label class="col-sm-2 control-label col-lg-2"
										for="inputSuccess">Select Quiz</label>
									<div class="col-lg-4">
										<select id="leaderQuiz" class="form-control m-b-10"
											onclick="showLeader(this.value)">
											<c:forEach var="quiz" items="${quizes}">
												<option value="${quiz.QM_ID }">${quiz.quizName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</form>

							<div class="input-group">


								<input type="text" name="table_search"
									class="form-control input-sm pull-right" style="width: 150px;"
									placeholder="Search" />
								<div class="input-group-btn">
									<button class="btn btn-sm btn-default">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
						<div id="results">
							
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
		</section><!-- /.content -->
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
