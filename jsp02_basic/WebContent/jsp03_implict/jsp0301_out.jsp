<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page buffer="16kb" autoFlush="false" %>
<!--  
    
    https://scshim.tistory.com/394
    
	<JSP처리과정>
	
	WAS는 JSP페이지에 대한 요청이 들어오면
	
	1. JSP에 해당하는 서블릿이 없을 경우
	
	   1) JSP페이지로부터 자바코드를 생성
	   2) 자바코드를 컴파일해서 서블릿클래스를 생성
	   3) 서블릿에 클라이언트요청을 전달
	   4) 서블릿이 처리한 결과를 응답
	   5) 응답을 웹브라우저에 전달	
	
	2. JSP에 해당하는 서블릿이 있을 경우
	   
	   1) 서블릿에 클라이언트 요청을 전달
	   2) 서블릿이 요청을 처리한 결과를 생성
	   3) 응답을 웨브라우저에 전송
	   
	JSP를 실행한다는 말은 곧 JSP페이지를 컴파일한 결과안 서블릿클래스를 실행한다는 의미가
	된다. 정확하게 표현한다면 "JSP페이지를 컴파일한 서블릿을 실행"한다는 의미이다.
	
	<출력버퍼와 응답>
	
	JSP페이지는 응답결과를 곧바로 웹브라우저에 전송하지 않고 대신에 출력버퍼(buffer)에
	임시로 저장했다가 한번에 웹브라우저에 전송한다. 이에 따른 장점은
	
	1. 데이터전송성능향상
	2. JSP실행도중에도 버퍼를 비우고 새로운 내용을 전송
	3. 버퍼가 다 차기전까지 헤더정보 변경가능 
-->

<!--  
	기본객체와 영역(Scope)
	
	1. JSP기본객체
	   1) request(javax.servlet.http.HttpServletRequest) : 클라이언트 요청정보를 저장
	   2) response(javax.servlet.http.HttpServletResponse) : 응답정보를 저장
	   3) out(javax.servlet.jsp.JspWriter) : JSP페이지가 생성결과를 출력할 때 사용하는 
	      출력스트림
	   4) pageContext(javax.servlet.jsp.PageContext) : JSP페이지에 대한 정보를 저장
	   5) session(javax.servlet.http.HttpSession) : HTTP 세션정보를 저장
	   6) application(javax.servlet.ServletContext) : 웹애플리케이션에 대한 정보를 저장
	   7) page(java.lang.Object) : JSP페이지를 구현한 자바클래스 인스턴스(객체)임
	   8) config(javax.servlet.ServletConfig) : JSP페이지의 설정정보를 저장
	   9) exception(java.lang.Throwable) : 익셉션객체, 에러페이지에서만 사용가능

-->

	<!--
		out기본객체는 웹브라우저에 데이터를 전송하는 출력스트림으로서 JSP페이지가 생성한
		데이터를 출력한다. 
		
		out기본객체의 출력메서드는 
		
		1. print() : 데이터를 출력
		2. println() : 데이터를 출력하고 줄바꿈문자(\r\n 또는 \n)를 출력
		3. newLine() : 줄바꿈문자(\r\n 또는 \n)를 출력
		
		out기본객체의 buffer관련메서드
		
		1. getBufferSize() : 버퍼의 크기를 리턴
		2. getRemaining() : 현재 남은 버퍼의 크기를 리턴
		3. clear() : 버퍼의 내용을 비운다. 이미 플러시가 되었다면 익셉션발생
		4. clearBuffer() : 버퍼의 내용을 비운다. 플러시가 되었더라도 익셉션이 발생안함
		5. flush() : 버퍼를 flush한다.
		6. isAutoFlush : 버퍼가 다 찼을 때 자동으로 flush할 경우 true를 리턴
	-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		out.println("안녕하세요?");
	%>
	<hr>
	<%
		out.print("<h1>");
		out.print("안녕하세요? 나는 out기본객체입니다!");
		out.print("</h1>");
	%>
	<hr />
	<h3>Buffer 정보</h3>
	버퍼크기 : <%= out.getBufferSize() %><br>
	버퍼잔량 : <%= out.getRemaining() %><br>
	Auto Flush : <%= out.isAutoFlush() %><br>
</body>
</html>













