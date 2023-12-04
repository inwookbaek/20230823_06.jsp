<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h4>회원목록</h4>
	<table border="1" width="100%">
		<tr align="center">
			<td>아이디</td>
			<td>이름</td>
			<td>연락처</td>
			<td>나이</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				// 1. Connection pool을 사용하려면 라이브러리를 추가해야 한다.(maven repository)
				// 1) commons-dbcp2-?.?.?.jar
				// 2) commons-logging-?.?.?.jar
				// 3) commons-pool2-?.?.?.jar
				// 2. web.xml에 PoolName(jspstudyPoolName)을 등록
				
				String drv = "jdbc:apache:commons:dbcp:jspstudyPoolName";
				conn = DriverManager.getConnection(drv);
				String sql = "select * from member order by member_id";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
		%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getInt(4) %></td>
					</tr>
		<%	
				}
			} catch(Exception e) {
				e.getMessage();
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
	</table>	
</body>
</html>