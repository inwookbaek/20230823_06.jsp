<%@page import="com.lec.basic.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Member member = new Member();
	member.setId("hong");
	member.setPassword("12345");
	member.setName("소향");
	member.setRegisterDate(new java.util.Date());
	member.setEmail("hong@gmail.com");	
	request.setAttribute("member", member); // 객체(member)를 request영역에 저장
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	아이디 :   ${ member.getId() }<br>
	비밀번호 : ${ member.getPassword() }<br>
	이름 :     ${ member.getName() }<br>
	가입일 :   ${ member.getRegisterDate() }<br>
	이메일 :   ${ member.getEmail() }<br>
</body>
</html>