<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
	var flag = true;

	function falsefunct() {
		return flag;
	}

	function validateForm() {
		var field = document.getElementById("number").value;
		var error = "Must be a numerical Value!";
		if (isNaN(field)) {
			document.getElementById("message").innerHTML = error;
			flag = false;
		} else {
			document.getElementById("message").innerHTML = " ";
			flag = true;
		}
	}
</script>

</head>
<body>
<div class="row">
			<div class="col-md-12">
<section class="panel" id="quiz1"> <header
					class="panel-heading"> Create Test </header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form"
						action="${pageContext.request.contextPath}/updateQuiz"
						method="post">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Title</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="testName"  placeholder="${selectedquiz.quizName }">
								<span class="help-block">Give a relevant Name to your
									test</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Number of
								Questions</label>
							<div class="col-sm-1">
								<input type="text" id="number" class="form-control"
									maxlength="2" onkeyup="validateForm()" name="number" placeholder="${selectedquiz.numberofQuestions }"/><span
									class="help-block" >Maximum 10</span>
							</div>
							<span id="message" style="color: red;"></span>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Maximum Points</label>
							<div class="col-sm-1">
								<input type="text" id="number" class="form-control"
									maxlength="2" onkeyup="validateForm()" name="maxPoints" placeholder="${selectedquiz.maxPoints }"/><span
									class="help-block" >specify a number</span>
							</div>
							<span id="message" style="color: red;"></span>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label" id="datepicker">Deadline</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" placeholder=" ${selectedquiz.deadline }" name="deadline"/>
			
							</div>
						</div>
						<div class="form-group">
							<input type="hidden" value="${selectedquiz.QM_ID }" name="QM_ID"/>
							<div class="col-sm-10" style="float: right;">
								<button type="submit" class="btn btn-success">Update</button>
							</div>

						</div>
					</form>
				</div>
				</section>
				</div>
				</div>
</body>
</html>