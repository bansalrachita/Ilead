<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="form-group">
		<form method="post"
			action="${pageContext.request.contextPath}/submitQuiz?id=${quizTemplate[0].quizMaster.QM_ID}">
			<c:forEach var="template" items="${quizTemplate}">
				<br />	${template.QT_ID} .  ${template.questionString } <br />
				<br>
				<c:set var="count" value="1"></c:set>
				<c:forTokens var="options" items="${template.options}" delims=",">
					${count } .	${options} 	<br />
					<c:set var="count" value="${count+1}"></c:set>
				</c:forTokens>
				<br />
				<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Choices</label>
				<div class="col-lg-10">

					<select multiple="multiple" class="form-control"
						name="${template.QT_ID}">
						<c:forEach var="optioncount" begin="1" end="${count-1}">
							<option value="${optioncount}">${optioncount}</option>
							<c:set var="count" value="${count+1}"></c:set>
						</c:forEach>
					</select> <br />

				</div>
			</c:forEach>
			<div style="float: right;">
				<button class="btn btn-success" type="submit">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>