<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	pageContext기본객체
	
	pageContext기본객체는 JSP페이지와 일대일로 연결된 객체로서
	1. 기본객체구하기
	2. 속성처리하기
	3. 페이지흐름제어하기
	4. 에러데이터구하기
	
	pageContext기본객체 메서드
	
	1. getRequest() : request의 기본객체를 구한다
	2. getResponse() : response의 기본객체를 구한다.
	3. getSession() : session기본객체를 구한다.
	4. getServletContext() : application기본객체를 구한다.
	5. getServletConfig() : config의 기본객체를 구한다.
	6. getOut() : out기본객체를 구한다
	7. getPage() : page의 기본객체를 구한다.
	8. getException : exception기본객체를 구한다.
	
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>pageContext 기본객체</h3>
	<%
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
		System.out.println(request + ", " + req);
		// request : org.apache.catalina.connector.RequestFacade@3f5422f7 
		// req     : org.apache.catalina.connector.RequestFacade@3f5422f7
		// result  : request와 req은 동일 객체이다.
	%>
	<b>request vs pageContext.getRequst()의 동일여부</b><br>
	<%= req == request %>
	<hr />
	<b>pageContext.getOut() 메서드 이용</b><br>
	<%
		pageContext.getOut().print("안녕하세요? getOut()메서드로 출력합니다!");
	%>
	
</body>
</html>








