<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public int multiply(int x, int y) {
		return x * y;
	}

	public int add(int a, int b) {
		return a + b;
	}
	
	public int sub(int x, int y) {
		return x - y;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<% 
		int sum = 0;
		for(int i=1;i<=10;i++) {
			sum += i;
		}
	%>
	1~10까지 합 = <%= sum %> 입니다.<br>
	<!-- 표현식 -->
	1~10까지 합 = <%= 1+2+3+4+5+6+7+8+9+10 %> 입니다.
	<hr />
	10 곱하기 20은 <%= multiply(10, 20) %><br>
	10 더하기 20은 <%= add(10, 20) %><br>
	20 빼기   10은 <%= sub(20, 10) %><br>
</body>

</html>