<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/animate.css">
<link rel="stylesheet" href="./resources/css/style.css">
<script type="text/javascript">
	function login() {
		var userid = $("#id").val();
		var userpwd = $("#pwd").val();

		if (userid.length == 0) {
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;
		} 

		if (userpwd.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			$("#pwd").focus();
			return false;
		}
		
		$("#myForm").submit();	
	}
</script>
<title>SwebChat - LOGIN</title>
</head>
<body>

	<!-- <div>
		<form action="/swebchat/login_ok" method="post" name="myForm" id="myForm">
			<div>
				<label>Id:</label> <input type="text" id="id" name="id">
			</div>
			<div>
				<label>Password:</label> 
				<input type="password" id="pwd" name="pwd">
			</div>
			<input type="button"value="login" onclick="login();">
			<input type="button" value="join" onclick="location.href='/swebchat/join'">
		</form>
	</div> -->
<br><br><br><br>
	
<div class="container">
	<div class="row">
</div>
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
	
		<!-- Start Sign In Form -->
			<form action="login_ok" method="post" id="myForm" name="myForm" class="fh5co-form animate-box" data-animate-effect="fadeIn">
				<h2>Sign In</h2>
				<div class="form-group">
					<label for="username" class="sr-only">UserID</label>
					<input type="text" class="form-control" id="id" name="id" placeholder="UserID" autocomplete="off">
				</div>
				<div class="form-group">
					<label for="password" class="sr-only">Password</label>
					<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" autocomplete="off">
				</div>
				<div class="form-group">
					<p>Not registered? <a href="/swebchat/join">Sign Up</a></p>
				</div>
				<div class="form-group">
					<input type="button" value="Sign In" class="btn btn-primary" onclick="login();">
				</div>
			</form>
					<!-- END Sign In Form -->
		</div>
	</div>
</div>
					
<!-- jQuery -->
<script src="./resources/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./resources/js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="./resources/js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="./resources/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="./resources/js/main.js"></script>
</body>
</html>