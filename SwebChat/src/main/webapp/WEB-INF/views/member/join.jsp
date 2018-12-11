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
	var idck = 0;
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	$(document).ready(function() {
		$("#id_checkBtn").unbind("click").click(function(e) {
			e.preventDefault();
			fn_userIDCheck();
		});
	});
	
	//userId를 param
	function fn_userIDCheck() {
		var userId = $("#id").val();
		if (userId.length < 3) {
			alert("아이디를 3자리 이상 입력해 주세요.");
		} else {
			$.ajax({
				async : true,
				type : "POST",
				url : "/swebchat/checkUserId",
				data : userId,
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					} else {
						alert("사용가능한 아이디입니다.");
						idck = 1;
					}
				},
				error : function(error) {
					alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
				}
			});
		}
	}
	
	function signUp() {
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
		
		if (confirm("회원가입을 하시겠습니까?")) {
			 if (idck == 0) {
				alert("아이디 중복체크를 해주세요.");
				return false;
			} else { 
				alert("회원가입을 축하합니다~^^ \n로그인 창으로 이동합니다.");
				$("#myForm").submit();
			}
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>

<form action="/swebchat/join_ok" method="post" name="myForm" id="myForm">

아이디 : <input type="text" id="id" name="id">
<a href="#"	id="id_checkBtn">중복확인</a><br>
패스워드 : <input type="password" id="pwd" name="pwd">
<input type="button" value="submit" onclick="signUp();">

</form>

</body>
</html>