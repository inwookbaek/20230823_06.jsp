<%@page import="com.lec.service.WriteMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="com.lec.dto.Message">
	<jsp:setProperty name="message" property="*"/>
</jsp:useBean>
<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 	${ param.guestName }<br>
 	${ param.password }<br>
 	${ param.message }<br>
 	<hr />
 	<h4>방명록이 성공적으로 등록되었습니다!!</h4>
 	<br />
 	<a href="list.jsp">[방명록목록보기]</a>
</body>
</html>