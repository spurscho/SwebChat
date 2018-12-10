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
<body>
	<table>
		<% 
		List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("lists");
		for(MemberDTO dto:list){
		%>
		<tr>
			<td>
			<%=dto.getId() %></a>
			</td>
		</tr>
		<tr>
			<td><%=dto.getPwd() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>