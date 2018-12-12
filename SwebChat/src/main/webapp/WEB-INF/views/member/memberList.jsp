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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/memberList.css"/>
<script type="text/javascript">
	function showPopup(idFromList) {
		window.name = "memberList";
		var screenW = screen.availWidth; // 스크린 가로사이즈
		var screenH = screen.availHeight; // 스크린 세로사이즈
		var popW = 300; // 띄울창의 가로사이즈
		var popH = 180; // 띄울창의 세로사이즈
		var posL = (screenW - popW)/2;	// 좌측정렬
		var posT = (screenH - popH)/2;	// 우측정렬
		window.open('applyChatPopup?yourId=' + idFromList, '채팅신청', 'width='
				+ popW + ',height=' + popH + ',top=' + posT + ',left=' + posL
				+ ',resizable=no,scrollbars=no');
	}
</script>
<body>
	<br/><br/>
	<div class="container">
		<div class="row">
		<%
			List<MemberDTO> list = (List<MemberDTO>) request.getAttribute("lists");
			for (MemberDTO dto : list) {
		%>
			<div class="col-md-7">
				<div class="card">
					<div class="gaadiex-list">
						<div class="gaadiex-list-item border-b-1">
							<i class="fa fa-user"></i>
							<div class="gaadiex-list-item-text">
								<h3>
									<a href="#"><%=dto.getId() %></a>
									<input type="button" class="btn-primary" value="신청" onclick="showPopup('<%=dto.getId()%>');" style="float: right;">
								</h3>
								<h4>Do you want to apply chatting?</h4>
								<p>I'll be in your neighborhood doing errands</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			
		</div>
	</div>
</body>
</html>