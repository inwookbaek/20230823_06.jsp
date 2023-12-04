<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String viewData = "";
%>
<c:set var="viewData" value=<%= viewData %> />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1 align="center">방명록 리스트</h1>
	<form action="./writeMessage.jsp" method="post">
		<table border="1" width="600" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="guestName"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<td>방명록</td>
				<td><textarea name="message" id="" cols="30" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"" align="center">
					<input type="submit" value="방명록등록"/>
				</td>
			</tr>
		</table>
	</form>
	<hr />
	
	<c:if test="${ viewData.isEmpty() }">
		등록된 메시지가 없습니다.
	</c:if>
	
</body>
</html>