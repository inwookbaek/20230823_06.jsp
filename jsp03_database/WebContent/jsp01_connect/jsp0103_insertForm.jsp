<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="./jsp0103_insertMember.jsp" method="post">
		<table border="1">
			<tr>
			    <td>아이디</td>
			    <td><input type="text" name="memberID" size="10"></td>
			</tr>
			<tr>
			    <td>이름</td>
			    <td><input type="text" name="memberName" size="10"></td>
			<tr>
			    <td>연락처</td>
			    <td><input type="text" name="mobile" size="10"></td>
			</tr>
			<tr>
			    <td>나이</td>
			    <td><input type="text" name="age" size="10"></td>
			</tr>			
			<tr>
			    <td colspan="4" align="center">
			    	<input type="submit" value="추가">
			    </td>
			</tr>
		</table>	
	</form>
</body>
</html>