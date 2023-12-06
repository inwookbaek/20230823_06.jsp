<%@page import="com.lec.service.DeleteMessageService"%>
<%@page import="com.lec.service.InvalidPasswordException"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	} catch(InvalidPasswordException e) {
		invalidPassword = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		if(!invalidPassword) {
	%>
			 메시지가 성공적으로 삭제 되었습니다!!
	<%
		} else {
	%>
			비밀번호가 일치하지 않습니다. 다시 입력!!!
	<%
		}
	%>
	<a href="list.jsp">[방명록목록으로 가기]</a>
</body>
</html>