<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
<link rel="stylesheet" href="http://bootsnipp.com/dist/bootsnipp.min.css?ver=70eabcd8097cd299e1ba8efe436992b7">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootswatch/3.3.0/slate/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
body { padding-top:30px; }
.form-control { margin-bottom: 10px; }
span {color:#ff0000;}
</style>
<script>
var flag = true;

function falsefunct(){
	return flag;
}
function validateForm() {
    var age = document.getElementById("userage").value;
    var error = "Must be a numerical Value!";
    if (isNaN(age)) {  	
    	document.getElementById("UserAge").innerHTML = error;
    	flag=false;
    }else{
    	document.getElementById("UserAge").innerHTML = " ";
    	flag=true;
    }
}


function checkUsername(){
	var newUsername = document.getElementById("newUser").value;
	var newUsername1 = document.getElementById("newUserCheck").value;
	if(newUsername === newUsername1){
		document.getElementById("showMessage").innerHTML= " ";
		flag=true;
	}else{
		document.getElementById("showMessage").innerHTML = "Incorrect";
		flag = false;
	}
}

</script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm" style="margin-left: 400px; ">
            <legend><a href="http://www.jquery2dotnet.com"><i class="glyphicon glyphicon-globe"></i></a> Sign up!</legend>
            <form action="${pageContext.request.contextPath}/home" method="post" name="signUpForm" class="form" role="form">
            <div class="row">
                <div class="col-xs-6 col-md-6">
                    <input class="form-control" name="firstname" placeholder="First Name" type="text"
                        required autofocus />
                </div>
                <div class="col-xs-6 col-md-6">
                    <input class="form-control" name="lastname" placeholder="Last Name" type="text" />
                </div>
            </div>
            <input class="form-control" name="yourusername" placeholder="Your Username" id="newUser" type="text" required/>
            <input class="form-control" name="reenterusername" id="newUserCheck" placeholder="Re-enter Username" type="text" onkeyup="checkUsername()" required/>
            <span id="showMessage"></span>
            <input class="form-control" name="password" placeholder="New Password" type="password" required/>
            <input class="form-control" name="age" id="userage" placeholder="Age" type="text" maxlength="5" onkeyup="validateForm()"/>
            <span id="UserAge"></span>
            <input class="form-control" name="contact" placeholder="Contact" type="text" required/>
            Role<br/>
             <label class="radio-inline">
                <input type="radio" name="role" id="inlineradio1" value="Manager"  required/>
                Manager
            </label>
            <label class="radio-inline">
                <input type="radio" name="role" id="inlineradio2" value="Employee" required/>
                Employee
            </label>
            <br/><br/>
            Gender<br/>
            <label class="radio-inline">
                <input type="radio" name="sex" id="inlineCheckbox1" value="male" required/>
                Male
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" id="inlineCheckbox2" value="female" required/>
                Female
            </label>
            <br />
            <br />
            <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="return falsefunct()">
                Sign up</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>