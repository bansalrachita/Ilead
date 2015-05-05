<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12 form-group">
	<c:set var="count" value="1"></c:set>
	<c:forEach var="question" items="${quizTemplate}">
		<div class="col-md-2 form-group">
		</div>
		<div class="col-md-10 form-group">
		<label>Question ${count}</label>
			<blockquote>${question.questionString }</blockquote>
			<div class="col-md-4 form-group">
				<c:forTokens var="option" items="${question.options}" delims=",">
				<input type="radio" value="${option}" >${option}<br/>
				</c:forTokens>
			</div>
		</div>
		<c:set var="count" value="${count +1 }"></c:set>
	</c:forEach>
	</div>
</body>
</html>