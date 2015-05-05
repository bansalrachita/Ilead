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
<table class="table table-hover">
								<tr>
									<th>#Rank</th>
									<th>#Employee ID</th>
									<th>Name</th>
									<th>Attempts</th>
									<th>Best Score</th>
									<th>Submission Date</th>
									<th>Status</th>
								</tr>
								<c:forEach var="employee" items="${employees }">
									<tr>
										<td></td>
										<td>${employee.userId}</td>
										<td>${employee.firstname} ${employee.lastname }</td>
										<td>${employee.attempts}</td>
										<c:forEach var="result" items="${employee.quizResult}">
										<td>${result.points}</td>
										<td>${employee.submissiondate }</td>
										<c:if test="${result.flag == false}">
									    <td><span class="label label-success">completed</span></td>
									    </c:if>
									    <c:if test="${result.flag == true}">
									    <td><span class="label label-fail">Late</span></td>
									    </c:if>
									    </c:forEach>
									</tr>
								</c:forEach>
							</table>
</body>
</html>