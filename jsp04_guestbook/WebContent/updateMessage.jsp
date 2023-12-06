<%@page import="com.lec.service.UpdateMessageService"%>
<%@page import="com.lec.service.MessageNotFoundException"%>
<%@page import="com.lec.service.InvalidPasswordException"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	String message = request.getParameter("message");
	boolean invalidPass = false;
	
	try {
		UpdateMessageService updateMessageService = UpdateMessageService.getInstance();
		updateMessageService.updateMessage(messageId, password, message);
	} catch(MessageNotFoundException e) {
		e.getMessage();
	} catch(InvalidPasswordException e) {
		System.out.println("invalidPass = " + invalidPass);
		invalidPass = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<h3>메시지수정하기</h3>
		<%
			if(!invalidPass) {
		%>
				<h4>메시지가 성공적으로 수정되었습니다!!</h4>
		<%
			} else {
		%>
				<h4 style="color:red;">비밀번호가 일치하지 않습니다. 다시 입력하세요!!</h4>
		<%
			}
		%>
		<br />
		<a href="list.jsp">목록보기</a>
	</div>
</body>
</html>