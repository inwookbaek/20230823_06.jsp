<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.setAttribute("id", request.getParameter("id"));
	session.setAttribute("name", "홍길동");
%>

<h1>세션영역 정보저장 & 조회</h1>

아이디 : <%= session.getAttribute("id") %><br>
이름 : <%= session.getAttribute("name") %>