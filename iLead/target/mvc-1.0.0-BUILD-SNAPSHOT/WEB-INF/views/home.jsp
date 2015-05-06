<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
<link rel="stylesheet" href="http://bootsnipp.com/dist/bootsnipp.min.css?ver=70eabcd8097cd299e1ba8efe436992b7">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootswatch/3.3.0/slate/bootstrap.min.css">
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/login.js" />"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://bootsnipp.com/dist/scripts.min.js"></script>
<script src="http://d1n0x3qji82z53.cloudfront.net/src-min-noconflict/ace.js"></script>
 <title>Login Page</title>
</head>
<body>
<section id="login">
    <div class="container">
    	<div class="row">
    	    <div class="col-xs-12">
        	    <div class="form-wrap">
                <h1>Sign In</h1>
                	<form:form method="POST" commandName="user">
<!--                     <form role="form" action="javascript:;" method="post" id="login-form"> -->
                        <div class="form-group">
                            <label for="email" class="sr-only">Username</label>
                            <form:input path="username" name="username" id="email" class="form-control" placeholder="Username" />
                            <form:errors path="username" cssStyle="color:#ff0000" />
<!--                             <input type="email" name="email" id="email" class="form-control" placeholder="Username"> -->
                        </div>
                        <div class="form-group">
                            <label for="key" class="sr-only">Password</label>
                            <form:input path="password" name="key" id="key" class="form-control" placeholder="Password" />
                            <form:errors path="password" cssStyle="color:#ff0000" />
<!--                             <input type="password" name="key" id="key" class="form-control" placeholder="Password"> -->
                        </div>
                        <div class="checkbox">
                            <span class="character-checkbox" onclick="showPassword()"></span>
                            <span class="label">Show password</span>
                        </div>
                        <div class="form-group">
                            Login As
                            <form:select path="role">
                            	 <form:option value="None" label="None"></form:option>
	                            <form:option value="Manager" label="Manager"></form:option>
	                            <form:option value="Employee" label="Employee"></form:option>
	                        </form:select>
	                        <form:errors path="role" cssStyle="color:#ff0000" />
                        </div>
                        <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Log in">
                    </form:form>
                    <a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal">Forgot your password?</a>
                    <a href="${pageContext.request.contextPath}/CreateNewLogin" class="create"><u>Create new login account</u></a>
                    <hr>
             </div>
    		</div> <!-- /.col-xs-12 -->
    	</div> <!-- /.row -->
    </div> <!-- /.container -->
</section>

<div class="modal fade forget-modal" tabindex="-1" role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Recovery password</h4>
			</div>
			<form action="${pageContext.request.contextPath}/RecoverEmail" method="post">
			<div class="modal-body">
				<p>Type your email account</p>
				<input type="email" name="recovery-email" id="recovery-email" class="form-control" autocomplete="off">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-custom">Recovery</button>
			</div>
			</form>
		</div> <!-- /.modal-content -->
	</div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <p>Page © - 2015</p>
                <p>Powered by <strong><a href="http://www.facebook.com/tavo.qiqe.lucero" target="_blank">studentBoard</a></strong></p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>