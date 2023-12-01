<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("memberId");
	String name = request.getParameter("name");

	String DRV = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://localhost:3306/testdb";
	String USR = "root";
	String PWD = "12345";
	String sql = "";
	int updateCount = 0;
	
	Class.forName(DRV);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = DriverManager.getConnection(URL, USR, PWD);
		sql = "update member set member_name = ? where member_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		updateCount = pstmt.executeUpdate();
	} catch(Exception e) {
		e.getMessage();
	} finally {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}				
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>회원정보수정하기</h1>
	<% 
		if(updateCount > 0) {
	%>
			<%=id %>회원님의 정보가 성공적으로 수정되었습니다!!
	<%
		} else {
	%>
			<%=id %>를 찾지못했습니다!!
	<%
		}
	%>
</body>
</html>












