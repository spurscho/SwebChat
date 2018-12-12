<%@page import="com.swebchat.member.model.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function showPopup(idFromList){
		  window.name = "memberList";
		  var screenW = screen.availWidth;  // 스크린 가로사이즈
		  var screenH = screen.availHeight; // 스크린 세로사이즈
		  var popW = 300; 					// 띄울창의 가로사이즈
		  var popH = 180; 					// 띄울창의 세로사이즈
		  var posL=( screenW-popW ) / 2;	// 좌측정렬
		  var posT=( screenH-popH ) / 2;	// 우측정렬
		  window.open('applyChatPopup?yourId='+idFromList,'채팅신청','width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');
	}

</script>
<style>
td{
	padding: 20px;
}

</style>
<body>
	<table align="center">
		<tr>
			<td>아이디</td>
			<td>신청버튼</td>
		</tr>
		<%
			List<MemberDTO> list = (List<MemberDTO>) request.getAttribute("lists");
			for (MemberDTO dto : list) {
		%>
		<tr>
			<td>
				<%=dto.getId()%>
			</td>
			<td>
				<button type="button" onclick="showPopup('<%=dto.getId()%>');">신청</button>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>