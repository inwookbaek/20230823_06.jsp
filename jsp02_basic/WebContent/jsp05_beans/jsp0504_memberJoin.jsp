<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.lec.basic.Member"/>
<jsp:setProperty name="member" property="*" />
<jsp:setProperty name="member" property="password"  value="<%= member.getName() %>"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>회원가입성공!!!</h3>
	<table border="1" width="400" cellpadding="0" cellspacing="0">
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty property="id" name="member"/></td>
			<td>비밀번호</td>
			<td><jsp:getProperty property="password" name="member"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="member"/></td>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="member"/></td>
		</tr>
	</table>	
</body>
</html>