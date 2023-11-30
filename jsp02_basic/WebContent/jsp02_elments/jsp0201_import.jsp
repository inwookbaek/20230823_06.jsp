<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<% Calendar  cal = Calendar.getInstance(); %>
	오늘은 
		<%= cal.get(Calendar.YEAR) %> 년
		<%= cal.get(Calendar.MONTH) + 1 %> 월
		<%= cal.get(Calendar.DATE) %> 일
	<hr />
	<!-- import속성을 사용하지 않는 경우 직접 로딩 -->	
	<% java.util.Date now = new java.util.Date(); %>
	오늘은 <%= now %>
</body>
</html>