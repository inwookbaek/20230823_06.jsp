<%@page import="com.lec.service.MessageListView"%>
<%@page import="com.lec.service.GetMessageListService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if(pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	} 

	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);

%>
<c:set var="viewData" value="<%= viewData %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1 align="center">방명록 리스트</h1>
	<form action="./writeMessage.jsp" method="post">
		<table border="1" width="600" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="guestName"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<td>방명록</td>
				<td><textarea name="message" id="" cols="30" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"" align="center">
					<input type="submit" value="방명록등록"/>
				</td>
			</tr>
		</table>
	</form>
	<hr />
	
	<c:if test="${ viewData.isEmpty() }">
		등록된 메시지가 없습니다.
	</c:if>
	
	<c:if test="${ !viewData.isEmpty() }">
		<table border="1" align="center">		 
			<c:forEach var="message" items="${ viewData.messageList }">
				<tr>
					<td>메시지번호 : ${ message.id }</td>
					<td>게스트이름 : ${ message.guestName }</td>
					<td>메시지     : ${ message.message }</td>
					<td><a href="confirmDeletion.jsp?messageId=${ message.id }">[삭제]</a></td>
					<td><a href="updateForm.jsp?messageId=${ message.id }">[수정]</a></td>
				</tr>
			</c:forEach>
		</table>
		
		<div align="center">
			<c:forEach var="pageNum" begin="1" end="${ viewData.pageTotalCount }">
				<a href="list.jsp?page=${ pageNum }">[${pageNum}] </a>
			</c:forEach>
		</div>
		
	</c:if>	
	
</body>
</html>