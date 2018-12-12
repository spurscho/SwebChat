<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>채팅신청</title>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="./resources/css/memberList.css"/>
<style>
body{
	background-color: white;
}
.title{
	font-size: 10pt;
}
td{
	padding-top: 10px;
}
</style>
<script type="text/javascript">
	function sendIt(){
		var f = document.sendForm;
		var myId = f.myId.value;
		var yourId = f.yourId.value;
		var url = 'uni?myId='+myId+'&yourId='+yourId;
        opener.location.href=url;
		window.close();
		
	}
	
</script>
<body>
	<form action="" name="sendForm">
	<table align="center">
		<tr>
			<td colspan="2">
				<p class='title' style="text-align: center;">
				${yourId }님에게 채팅을 신청하시겠습니까?
				</p>
			</td>
		</tr>
		<tr align="center">
			<td>
				<input class="btn-primary" type="button" onclick="parent.window.close();" value="취소">
			</td>
			<td>
				<input class="btn-primary" type="button" onclick="sendIt();" value="신청">
				<input type="hidden" name="yourId" value="${yourId }">
				<input type="hidden" name="myId" value="${myId }">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>