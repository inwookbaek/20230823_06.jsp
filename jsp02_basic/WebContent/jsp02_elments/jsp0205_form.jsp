<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="jsp0205_view_parameter.jsp" method="get">
	
		<table border="1">
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" size="10" value="홍길동"/></td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td><input type="text" name="address" size="30" value="서울 서초구 서초동..."/></td>
			</tr>
			<tr>
				<td>좋아하는 동물 : </td>
				<td>
					<input type="checkbox" name="pet" value="dog"/>강아지<br>
					<input type="checkbox" name="pet" value="cat"/>고양이<br>
					<input type="checkbox" name="pet" value="pig"/>돼지
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"/></td>
			</tr>
		</table>	
	</form>
</body>
</html>