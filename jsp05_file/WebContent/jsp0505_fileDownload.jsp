<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("f");
	
	String fromPath = "D:/lec/00.share/98.temp/upload/" + fileName;
	String toPath = "D:/lec/00.share/98.temp/download/" + fileName;
	
	/*
		실제웹서버운영에 관련된 경로
		ServletContext context = getServletContext(); // 현재웹커테이너의 root폴더, WebContent
		String downPath = context.getRealPath("upload");
		String saveFilePath = "D:/lec/00.share/98.temp/download/" + fileName;
		out.println("<h3>Context      = " + context + "</h3>");
		out.println("<h3>downPath     = " + downPath + "</h3>");
		out.println("<h3>saveFilePath = " + saveFilePath + "</h3>");		
	*/
	
	byte[] b = new byte[4096];
	File f = new File(toPath);	
	
	FileInputStream fis = new FileInputStream(fromPath);
	
	String sMimeType = getServletContext().getMimeType(fromPath); // mime type : pdf, hwp, txt
	if(sMimeType == null) sMimeType = "application/octet-stream";
	
	String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
	String sEnString1 = URLEncoder.encode(fileName, "utf-8");
	
	response.setContentType(sMimeType);
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Content-Disposition", "attachment; filename = " + sEnString1);
	
	ServletOutputStream os = response.getOutputStream();
	int numRead;
	
	while((numRead = fis.read(b, 0, b.length)) != -1) {
		os.write(b, 0, numRead);
	}
	
	os.flush();
	os.close();
	fis.close();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<h1>파일다운로드하기</h1>
</body>
</html>