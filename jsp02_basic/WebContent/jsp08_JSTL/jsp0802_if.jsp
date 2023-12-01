<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>JSTL core tag - if</h1>
	<%
		if(true) {
	%>
			참입니다!<br>
	<%
		}
	%>
	<hr />
	<c:if test="true">
		참입니다!
	</c:if>
	<hr />
	<c:if test="${ param.id == 'hong'}">
		아이디 : ${ param.id }
	</c:if>
	<br />
	<c:if test="${ param.age >= 18}">
		성인입니다!!!
	</c:if>	
	<hr />
	
	<ul>
		<c:choose>
			<c:when test="${ param.id == 'hong'}">
				<li>당신의 아이디는 <b>${ param.id }</b> 입니다</li>
			</c:when>
			<c:when test="${ param.age >= 18}">
				<li>당신은 18세 이상입니다. 당신은 성인입니다!!</li>
			</c:when>
			<c:otherwise>
				<li>당신의 아이디는 hong이 아니고 18세이상도 아닙니다!</li>
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>










