<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/animate.css">
<link rel="stylesheet" href="./resources/css/style.css">
<title>SwebChat - LEAVE</title>
</head>
<script type="text/javascript">
function deleted() {
	var userpwd = $("#pwd").val();
	var userpwd2 = $("#re-pwd").val();
	
	if (userpwd.length == 0) {
		alert("비밀번호를 입력해 주세요.");
		$("#pwd").focus();
		return false;
	}
	
	if (userpwd!=userpwd2){
		alert("비밀번호를 확인해 주세요");
		$("#re-pwd").focus();
		return false;
	}
	
	if(confirm("탈퇴하시겠습니까?")){
		$("#myForm").submit();	
	}
	
}
</script>
<body>

<%-- <form action="/swebchat/deleted_ok" method="post" name="myForm" id="myForm">

아이디 : ${sessionScope.id}
패스워드 : <input type="password" id="pwd" name="pwd">
<input type="button" value="OK" onclick="deleted();">

</form> --%>

<br><br><br><br>

<div class="container">
	<div class="row">
</div>
	<div class="row">
		<div class="col-md-4 col-md-offset-4">

			<form action="/swebchat/deleted_ok" method="post" id="myForm" class="fh5co-form animate-box" data-animate-effect="fadeIn">
				<h2>LEAVE</h2>
					<div class="form-group" style="align-content: center;">
						<label for="name" class="sr-only">Id</label>
						<h3>${sessionScope.id}</h3>
				</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" autocomplete="off">
					</div>
					<div class="form-group">
						<label for="re-password" class="sr-only">Re-type Password</label>
						<input type="password" class="form-control" id="re-pwd" placeholder="Re-type Password" autocomplete="off">
					</div>
					<div class="form-group">
						<input type="button" value="Leave" class="btn btn-primary" onclick="deleted();">
						<a href="list"><input type="button" value="Cancel" class="btn btn-primary"></a>
					</div>
				</form>

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