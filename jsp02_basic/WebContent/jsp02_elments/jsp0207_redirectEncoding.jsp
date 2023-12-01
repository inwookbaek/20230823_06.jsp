<%@page import="java.net.URLEncoder"%>
<%@page pageEncoding="UTF-8"%>
<%
	String value = "안녕하세요?";
	String encodeValue = URLEncoder.encode(value, "euc-kr");
	response.sendRedirect("jsp0205_form.jsp?name=" + encodeValue);
//  utf-8로 인코딩 결과  : ?name=%EC%95%88%EB%85%95%ED%95%98%EC%84%B8%EC%9A%94%3F
//  euc-kr로 인코딩 결과 : ?name=%BE%C8%B3%E7%C7%CF%BC%BC%BF%E4%3F
%>

