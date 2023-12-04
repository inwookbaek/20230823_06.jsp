<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("memberID");
	String name = request.getParameter("memberName");
	String mobile = request.getParameter("mobile");
	int age = Integer.parseInt(request.getParameter("age"));

	String DRV = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://localhost:3306/testdb";
	String USR = "root";
	String PWD = "12345";
	String sql = "";
	int insertCount = 0;
	
	Class.forName(DRV);
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = DriverManager.getConnection(URL, USR, PWD);
		sql = "insert into member values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, mobile);
		pstmt.setInt(4, age);
		insertCount = pstmt.executeUpdate();
	} catch(Exception e) {
		e.getMessage();
	} finally {
		try {
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
	<h1>회원등록성공!!</h1>
</body>
</html>