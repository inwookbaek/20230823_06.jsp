<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<b>request.getParameter() 메서드 사용</b><br>
	<%= request.getParameter("name") %><br>
	<%= request.getParameter("address") %><br>
	<%= request.getParameter("pet") %><br>
	<hr />
	
	<b>request.getParameterValues() 메서드 사용</b><br>
	<%
		String[] pets = request.getParameterValues("pet");
		if(pets != null) {
			for(String pet:pets) {
	%>
				<%= pet %><br>
	<%
			}
		}
	%>
	<hr />
	
	<b>request.getParmeterNames() 메서드 사용</b><br>
	<%
		Enumeration paramEnum = request.getParameterNames();
		while(paramEnum.hasMoreElements()) {
			String paramName = (String) paramEnum.nextElement();
	%>
				param이름 = <%= paramName %><br>
	<%
		}
	%>
	<hr />
	
	<b>request.getParameterMap() 메서드 사용</b><br>
	<%
		Map map = request.getParameterMap();
		String[] p_name = (String[]) map.get("name");
		if(p_name != null) {
	%>
			파라미터이름 = <%= p_name[0] %>
	<%
		}
	%>
	<hr />
	
	<b>reguest 헤더정보</b><br>
	<%
		Enumeration<String> headers = request.getHeaderNames();
		while(headers.hasMoreElements()) {
			String headerName = (String) headers.nextElement();
			String headerValue = request.getHeader(headerName);
	%>		
			<%= headerName %> = <%= headerValue %><br>
	<%
		}
	%>		
</body>
</html>