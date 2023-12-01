<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String DRV = "org.mariadb.jdbc.Driver";
		String URL = "jdbc:mariadb://localhost:3306/testdb";
		String USR = "root";
		String PWD = "12345";
		String sql = "";
	%>

	<h1>DataBase Connect</h1>
	<%
		Class.forName(DRV);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(URL, USR, PWD);
			sql = "select * from member where member_id = '" + id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
	%>
				<table border="1">
					<tr>
						<td>아이디</td>
						<td><%= id %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%= rs.getString("member_name") %></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><%= rs.getString("mobile") %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%= rs.getString("age") %></td>
					</tr>
				</table>
	<%
			} else {
	%>
				<%= id %>를 찾지 못했습니다!!
	<%
			}
	
		} catch(Exception e) {
	%>
			에러 : <%= e.getMessage() %>
	<%
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				// dummy
			}
		}	
	%>
</body>
</html>










