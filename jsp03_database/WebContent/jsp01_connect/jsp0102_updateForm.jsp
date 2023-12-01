<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="./jsp0102_updateMember.jsp" method="post" >
	
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" size="10"/></td>
				<td>이름</td>
				<td><input type="text" name="name" size="10"/></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="submit" value="수정"/></td>
			</tr>
		</table>
	
	</form>
</body>
</html>