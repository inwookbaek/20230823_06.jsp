<%@page import="com.lec.dto.Message"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lec.jdbc.ConnectionProvider"%>
<%@page import="com.lec.dao.MessageDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	
	MessageDao messageDao = MessageDao.getInstance();
	Connection conn = ConnectionProvider.getConnection();
	Message view_data = messageDao.select(conn, messageId);
%>
<c:set var="view_data" value="<%= view_data %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="./updateMessage.jsp" method="post">
		<table border="1" width="600" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="guestName" value="${ view_data.guestName }" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>방명록</td>
				<td><textarea name="message" id="" cols="30" rows="10">[수정]${ view_data.message }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"" align="center">
					<input type="hidden" name="messageId" value="${ param.messageId }"/>
					<input type="submit" value="방명록수정"/>
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>