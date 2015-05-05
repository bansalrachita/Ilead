<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of employees AJAX</title>
</head>
<body>
	<div>
		<div class="form-group">
			<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Select Team Member</label>
			<div class="col-md-5">
			<form action="${pageContext.request.contextPath}/AddMember" method="post">
				<select class="form-control m-b-10" name="employee">
				<c:forEach var="employee" items="${employees }">
					<option value="${employee.userId}">${employee.username}</option>
				</c:forEach>
				</select>
				<div style="float: right;">
				<br>
				<button type="submit" class="btn btn-success">Submit</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>