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
<title>Insert title here</title>
</head>
<body>

	<div>
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
	</div>

</body>
</html>