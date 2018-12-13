<%@page import="com.swebchat.member.model.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.swebchat.member.model.dto.MemberDTO"%>
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
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/memberList.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

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
	function showAlert(mention){
		alert(mention);
	}
	
</script>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">SwebChat</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="#">회원 목록</a></li>
	      <c:if test="${myId != null}">
		      <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		        ${myId }
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="/swebchat/logout">로그아웃</a></li>
		          <li><a href="/swebchat/updated">정보수정</a></li> 
		      	  <li><a href="/swebchat/deleted">회원탈퇴</a></li>  
		        </ul>
		      </li>
	      </c:if>
	    </ul>
	  </div>
	</nav>
	<br/><br/>
	<div class="container">
		<div class="row">
		<c:forEach items="${lists }" var="dto">
			<div class="col-md-7">
				<div class="card">
					<div class="gaadiex-list">
						<div class="gaadiex-list-item border-b-1">
							<i class="fa fa-user"></i>
							<div class="gaadiex-list-item-text">
								<h3>
									<a style="color: purple;">${dto.getId() }</a>
									<input type="button" class="btn-primary" value="신청" onclick="showPopup('${dto.getId() }');" style="float: right;">
								</h3>
								<h4>Do you want to apply chatting to him?</h4>
								<p>I'll be your chatting friend</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</body>
</html>