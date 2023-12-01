<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>메이페이지 Layout</h1>
	<table border="1" width="400" cellpading="0" cellspacing="0">
	<tr>
		<td colspan="2">
			<jsp:include page="./module/top.jsp" flush="false"/>
		</td>
	</tr>
	<tr height="300">
		<td width="100" valign="center">
			<jsp:include page="./module/left.jsp" flush="false"/>
		</td>
		<td width="300" valign="center">
			 본문영역
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="./module/bottom.jsp" flush="false"/>
		</td>
	</tr>
	</table>
</body>
</html>