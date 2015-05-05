<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee | General UI</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-black">
	<!-- header logo: style can be found in header.less -->
	<header class="header">
		<a href="index.html" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
			Employee
		</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
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
												<img src="img/avatar3.png" class="img-circle"
													alt="User Image" />
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
												<img src="img/avatar2.png" class="img-circle"
													alt="user image" />
											</div>
											<h4>
												Director Design Team <small><i class="fa fa-clock-o"></i>
													2 hours</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img src="img/avatar.png" class="img-circle"
													alt="user image" />
											</div>
											<h4>
												Developers <small><i class="fa fa-clock-o"></i>
													Today</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img src="img/avatar2.png" class="img-circle"
													alt="user image" />
											</div>
											<h4>
												Sales Department <small><i class="fa fa-clock-o"></i>
													Yesterday</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img src="img/avatar.png" class="img-circle"
													alt="user image" />
											</div>
											<h4>
												Reviewers <small><i class="fa fa-clock-o"></i> 2
													days</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
								</ul>
							</li>
							<li class="footer"><a href="#">See All Messages</a></li>
						</ul></li>

					<!-- Tasks: style can be found in dropdown.less -->
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
												<div class="progress-bar progress-bar-info"
													style="width: 60%" role="progressbar" aria-valuenow="20"
													aria-valuemin="0" aria-valuemax="100">
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
							class="fa fa-user"></i> <span>${sessionScope.username} <i
								class="caret"></i></span>
					</a>
						<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
							<li class="dropdown-header text-center">Account</li>

							<li><a href="#"> <i
									class="fa fa-clock-o fa-fw pull-right"></i> <span
									class="badge badge-success pull-right">10</span> Updates
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
		</nav>
	</header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas">
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="img/avatar3.png" class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>Hello, ${sessionScope.username}</p>

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
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li><a
						href="${pageContext.request.contextPath}/Employee_Index.html">
							<i class="fa fa-dashboard"></i> <span>Dashboard</span>
					</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/Employee_General.html">
							<i class="fa fa-gavel"></i> <span>Profile</span>
					</a></li>

					<li><a
						href="${pageContext.request.contextPath}/Employee_Dashboard.html">
							<i class="fa fa-globe"></i> <span>Take Quiz</span>
					</a></li>

					<li><a
						href="${pageContext.request.contextPath}/Simple_Tables.html">
							<i class="fa fa-glass"></i> <span>Simple tables</span>
					</a></li>

				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="right-side">

			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i> Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li class="active">Current page</li>
						</ul>
						<!--breadcrumbs end -->
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<div class="stat">
							<div class="stat-icon" style="color: #fa8564;">
								<i class="fa fa-file-o fa-3x stat-elem"></i>
							</div>
							<h5 class="stat-info">${project }</h5>
						</div>
					</div>
					<div class="col-md-2">
						<div class="stat">
							<div class="stat-icon" style="color: #AC75F0">
								<i class="fa fa-envelope-o fa-3x stat-elem"></i>
							</div>
							<h5 class="stat-info">${count} Updates</h5>
						</div>
					</div>
					<div class="col-md-2">
						<div class="stat">
							<div class="stat-icon" style="color: #AC75F0">
								<i class="fa fa-dollar fa-3x stat-elem"></i>
							</div>
							<h5 class="stat-info">${user.salary} Earnings</h5>
						</div>
					</div>
				</div>

					<div class="col-lg-6">
						<!--tab nav start-->
						<section class="panel general">
							<header class="panel-heading tab-bg-dark-navy-blue">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home">Home</a>
									</li>
									<li class=""><a data-toggle="tab" href="#about">About</a>
									</li>
									<li class=""><a data-toggle="tab" href="#profile">Profile</a>
									</li>
									<li class=""><a data-toggle="tab" href="#contact">Contact</a>
									</li>
								</ul>
							</header>
							<div class="panel-body">
								<div class="tab-content">
									<div id="home" class="tab-pane active">
										<a href="#myModal-1" data-toggle="modal"
											class="btn btn-xs btn-warning"> Update Password </a>
										<div aria-hidden="true" aria-labelledby="myModalLabel"
											role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button aria-hidden="true" data-dismiss="modal"
															class="close" type="button">×</button>
														<h4 class="modal-title">Update My Password</h4>
													</div>
													<div class="modal-body">

														<form
															action="${pageContext.request.contextPath}/updatePassword"
															method="post" class="form-horizontal" role="form">
															<div class="form-group">
																<label for="inputEmail1"
																	class="col-lg-2 col-sm-2 control-label">New
																	Password</label>
																<div class="col-lg-10">
																	<input type="password" class="form-control"
																		id="inputPassword" placeholder="Password">
																</div>
															</div>
															<div class="form-group">
																<label for="inputPassword1"
																	class="col-lg-2 col-sm-2 control-label">Confirm
																	Password</label>
																<div class="col-lg-10">
																	<input type="password" class="form-control"
																		id="inputPassword4" placeholder="Password">
																</div>
															</div>
															<div class="form-group">
																<div class="col-lg-offset-2 col-lg-10">
																	<button type="submit" class="btn btn-default">Submit</button>
																</div>
															</div>
														</form>

													</div>

												</div>
											</div>
										</div>
									</div>
									<div id="about" class="tab-pane"
										style="text-align: center; margin: 40px;">
										<h5>${sessionScope.user.about}</h5>
										<br />
										<br /> <a class="btn btn-success" data-toggle="modal"
											href="#myModal"> Update About </a>
									</div>

									<div id="profile" class="tab-pane" style="text-align: center;">
										<br>
										<br>
										<div class="container-fluid well span6">
											<div class="row-fluid">
												<div class="span2">
													<img
														src="https://secure.gravatar.com/avatar/de9b11d0f9c0569ba917393ed5e5b3ab?s=140&r=g&d=mm"
														class="img-circle">
												</div>

												<div class="span8">
													<h3>${sessionScope.user.firstname}
														${sessionScope.user.lastname}</h3>
													<h5>Gender: ${sessionScope.user.gender}</h5>
													<h5>Old: ${sessionScope.user.age} Years</h5>
													<h5>Earning: $ ${sessionScope.user.salary } Yearly</h5>
													<h5>Role: ${sessionScope.user.role}</h5>
													<h5>Current Manager: ${sessionScope.managerFName}
														${sessionScope.managerLName}</h5>

												</div>



												<div class="span2">
													<a class="btn btn-warning" data-toggle="modal"
														href="#myModal2"> Uodate Profile</a>
												</div>




											</div>
										</div>

									</div>
									<div id="contact" class="tab-pane"
										style="text-align: justify; margin: 30px;">
										<h6>Contact Number: +1-${sessionScope.user.contact }</h6>
										<h6>Email: ${sessionScope.user.email}</h6>
										<div class="span2">
											<a class="btn btn-warning" data-toggle="modal"
												href="#myModal3"> Update Contact</a>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!--tab nav start-->
						<div class="row">
							<div class="col-md-12">
								<!--notification start-->
								<section class="panel">
									<div class="panel-body">
										<c:forEach var="update" items="${updates}">
											<c:choose>
												<c:when test="${update.category == 'Ohsnap!' }">
													<div class="alert alert-block alert-danger ">
														<button data-dismiss="alert" class="close close-sm"
															type="button">
															<i class="fa fa-times"></i>
														</button>
														<strong>Oh snap!</strong> ${update.message}<br /> <span
															class="label label-default">${update.date }</span>
													</div>
												</c:when>
												<c:when test="${update.category == 'WellDone!' }">
													<div class="alert alert-success ">
														<button data-dismiss="alert" class="close close-sm"
															type="button">
															<i class="fa fa-times"></i>
														</button>
														<strong>Well done!</strong> ${update.message}<br /> <span
															class="label label-default">${update.date }</span>
													</div>
												</c:when>
												<c:when test="${update.category == 'HeadsUp!' }">
													<div class="alert alert-info ">
														<button data-dismiss="alert" class="close close-sm"
															type="button">
															<i class="fa fa-times"></i>
														</button>
														<strong>Heads up!</strong> ${update.message}<br /> <span
															class="label label-default">${update.date }</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="alert alert-warning ">
														<button data-dismiss="alert" class="close close-sm"
															type="button">
															<i class="fa fa-times"></i>
														</button>
														<strong>Warning!</strong>${update.message}<br /> <span
															class="label label-default">${update.date }</span>
													</div>
												</c:otherwise>

											</c:choose>
										</c:forEach>
									</div>
								</section>
								<!--notification end-->
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<section class="panel">
									<header class="panel-heading"> Default Buttons </header>
									<div class="panel-body">
										<button type="button" class="btn btn-default">Default</button>
										<button type="button" class="btn btn-primary">Primary</button>

										<button type="button" class="btn btn-info">Info</button>
										<button type="button" class="btn btn-warning">Warning</button>
										<button type="button" class="btn btn-danger">Danger</button>

										<p class="text-muted text-center">Labels</p>
										<p class="text-center">
											<span class="label label-default">label</span> <span
												class="label label-primary">Primary</span> <span
												class="label label-success">Success</span> <span
												class="label label-info">Info</span> <span
												class="label label-inverse">Inverse</span> <span
												class="label label-warning">Warning</span> <span
												class="label label-danger">Danger</span>
										</p>
										<p class="text-muted text-center">Badges</p>
										<p class="m-bot-none text-center">
											<span class="badge">5</span> <span
												class="badge badge-primary">10</span> <span
												class="badge badge-success">15</span> <span
												class="badge badge-info">20</span> <span
												class="badge badge-inverse">25</span> <span
												class="badge badge-warning">30</span> <span
												class="badge badge-danger">35</span>
										</p>
										<a class="btn btn-danger" data-toggle="modal" href="#myModal4">
											Alert ! </a>
										<!-- Modal -->
										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title">About Me</h4>
													</div>
													<form
														action="${pageContext.request.contextPath}/updateAboutMe"
														method="get">
														<div class="modal-body">

															<input type="text" name="about" />

														</div>
														<div class="modal-footer">
															<button data-dismiss="modal" class="btn btn-default"
																type="button">Close</button>
															<button class="btn btn-success" type="submit">Save
																changes</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- modal -->

										<!-- Modal -->
										<div class="modal fade" id="myModal2" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title">Update Profile</h4>
													</div>
													<form
														action="${pageContext.request.contextPath}/UpdateProfile"
														method="get">
														<div class="modal-body">

															<label for="Lastname"> Lastname</label> <input
																type="text" name="Lastname" /><br />
															<br /> <label for="Age">Age </label> <input type="text"
																name="Age" /><br />
															<br />
															<div class="form-group">
																<label for="exampleInputFile">Upload Photo</label> <input
																	type="file" id="exampleInputFile">
															</div>

														</div>
														<div class="modal-footer">
															<button data-dismiss="modal" class="btn btn-default"
																type="button">Close</button>
															<button class="btn btn-success" type="submit">Save
																changes</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- modal -->
										<!-- Modal -->
										<div class="modal fade" id="myModal3" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title">Update Contact</h4>
													</div>
													<form
														action="${pageContext.request.contextPath}/UpdateContact"
														method="get">
														<div class="modal-body">
															<label for="Phone">Phone</label> <input type="text"
																name="phone" maxlength="10" /><br /> <label for="Email">Email</label>
															<input type="text" name="email" />

														</div>
														<div class="modal-footer">
															<button data-dismiss="modal" class="btn btn-default"
																type="button">Close</button>
															<button class="btn btn-success" type="submit">Save
																changes</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- modal -->

										<!-- Modal -->
										<div class="modal fade" id="myModal4" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title">Modal Tittle</h4>
													</div>
													<div class="modal-body">Body goes here...</div>
													<div class="modal-footer">
														<button class="btn btn-danger" type="button">Ok</button>
													</div>
												</div>
											</div>
										</div>
										<!-- modal -->



									</div>
								</section>
							</div>
						</div>


					</div>

				</div>

			</section>
		</div>
		<div class="footer-main">iLead</div>
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
	<!-- Director App -->
	<script
		src="${pageContext.request.contextPath}/resources/js/Director/app.js"
		type="text/javascript"></script>
</body>
</html>
