<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 스크립트릿
	//D:\lec\06.jsp\.metadata\.plugins\org.eclipse.wst.server.core
	//      \tmp0\work\Catalina\localhost\jsp02_basic\org\apache\jsp\jsp01_hello
	Date now = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>현재시간?</h1>
	<h3><%= now %></h3>
	<h3><%= new java.util.Date() %></h3>
</body>
</html>
