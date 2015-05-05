<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row">
			<div class="col-md-12">
<section class="panel" id="quiz"> <header
					class="panel-heading"> Create Test </header>
				<div class="panel-body">
					<form class="form-horizontal tasi-form"
						action="${pageContext.request.contextPath}/createQuestion" method="post">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Question</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="questionstring">
								<span class="help-block">E.g. Which is your favorite color?</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Options</label>
							<div class="col-sm-10">
								<input type="text" id="number" class="form-control"
									onkeyup="validateForm()" name="options" placeholder="Option1, Option2, Option3.."/>
							</div>
							<span id="message" style="color: red;"></span>
						</div>

						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Correct Answer</label>
							<div class="col-sm-1">
								<input type="text" id="number" class="form-control"
									maxlength="2" onkeyup="validateForm()" name="answer" placeholder="1,2,3"/><span
									class="help-block" >Choose 1,2,3 or 4</span>
							</div>
							<span id="message" style="color: red;"></span>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Level</label>
							<div class="col-lg-10">
								<select class="form-control m-b-10" name="level">
									<option value="HIGH">High</option>
									<option value="MEDIUM">Medium</option>
									<option value="LOW">Low</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<input type="hidden" value="${selectedquiz.QM_ID}" name="QM_ID"/>
							<div class="col-sm-10" style="float: right;">
								<button type="submit" class="btn btn-success">Create</button>
							</div>

						</div>
					</form>
				</div>
				</section>
				</div>
				</div>
</body>
</html>