<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.member.dto.Member"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<% List<Member> members = (ArrayList) request.getAttribute("members"); %>
	
	<div class="container" align="center">
		<h3>회원목록</h3>
		<table class="table table-hover table-dark text-light">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>비밀번호</th>
					<th>주민번호</th>
					<th>성별</th>
					<th>마일리지</th>
				</tr>
			</thead>
			<tbody>
				<%
					int i = 0;
					for(Member member:members) {
				%>
					<tr>
						<td><%= ++i %></td>
						<td><a href="detail?id=<%= member.getId() %>&type=d"><%= member.getId() %></a></td>
						<td><%= member.getName() %></td>
						<td><%= member.getPassword() %></td>
						<td><%= member.getSsn() %></td>
						<td><%= member.getGender() %></td>
						<td><%= member.getMileage() %></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
	
	</div>
</body>
</html>