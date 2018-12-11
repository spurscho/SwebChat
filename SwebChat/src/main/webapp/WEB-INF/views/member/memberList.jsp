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
<style>
.td{
	padding: 20px;
	margin: 20px;

}

</style>
<body>
	<table align="center">
		<%
			List<MemberDTO> list = (List<MemberDTO>) request.getAttribute("lists");
			for (MemberDTO dto : list) {
		%>
		<tr>
			<td>
				<a href="<%=contextPath%>/applyChatPopup?id=<%=dto.getId()%>"> 
					<%=dto.getId()%>
				</a>
			</td>
			<td>
				<%=dto.getPwd()%>
			</td>
			<td>
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
				style="height: 30%;font-size: 10pt;text-align: center;">
				 신청
				</button>
				<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel"><%=dto.getId()%>에게 해당 회원에게 채팅을 신청하시렵니까?</h4>
				    </div>
				    <div class="modal-footer" style="text-align: center;">
				      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				      <button type="button" class="btn btn-primary">신청하기</button>
				    </div>
			    </div>
			  </div>
			</div>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>