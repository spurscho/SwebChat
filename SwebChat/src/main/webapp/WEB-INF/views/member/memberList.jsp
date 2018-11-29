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
		<tr>
			<td style="text-align: center;">${dto.ordernum }</td>
			<td style="text-align: center;">${dto.id }</td>
			<td style="text-align: center;">${dto.pname }</td>
			<td style="text-align: center;">${dto.model}</td>
			<td style="text-align: center;">${dto.pamount}</td>
			<td style="text-align: center;">${dto.price }</td>
			<td style="text-align: center;">${dto.totalprice }</td>
			<td style="text-align: center;">${dto.orderdate }</td>
		</tr>
	</table>
</body>
</html>