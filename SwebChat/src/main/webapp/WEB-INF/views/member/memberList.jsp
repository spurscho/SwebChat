<%@page import="com.swebchat.member.model.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String contextPath = request.getContextPath();
%>
<body>
	<table>
		<% 
		List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("lists");
		for(MemberDTO dto:list){
		%>
		<tr>
			<td>
				<a href="<%=contextPath %>/applyChatPopup?id=<%=dto.getId()%>">
				<%=dto.getId() %>
				</a>
			</td>
		</tr>
		<tr>
			<td><%=dto.getPwd() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>