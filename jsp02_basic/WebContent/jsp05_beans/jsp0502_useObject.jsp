<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="com.lec.basic.Member"/>
<h1>회원정보</h1>
<%= member.getId() %><br>
<%= member.getPassword() %><br>
<%= member.getName() %><br>
<%= member.getRegisterDate() %><br>
<%= member.getEmail() %><br>