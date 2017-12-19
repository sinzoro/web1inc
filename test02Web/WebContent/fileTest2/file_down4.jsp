<%-- file_down.jsp Test --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.ServletUtils" %>

<%
	String filename = request.getParameter("file_name");

	String savePath="upload";
	
	ServletContext context = getServletContext();
	
	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = sDownloadPath + "\\" + filename;
	
	byte[] b = new byte[4096];
	
	File oFile = new File(sFilePath);
	
	FileInputStream in = new FileInputStream(sFilePath);
	
	String sMineType = getServletContext().getMimeType(sFilePath);
	
	System.out.println("sMineType >> "+sMineType);
	
	// octet-stream은 8비트로 된 일련의 데이타를 뜻합니다.
	if(sMineType == null)
	{
		sMineType="application/octet/stream";
	}
	
	response.setContentType(sMineType);
	
	String sEncoding = new String(filename.getBytes("utf-8"),"8859_1");
	// 한글 업로드 (한글명이 깨지는 것을 방지);
	
	response.setHeader("Content-Disposition", "attachment; filename="+sEncoding);
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead;
	
	// 바이트 배열 b 의 0 번 부터 numRead 번 까지 브라우저 출력
	while((numRead = in.read(b, 0, b.length)) != -1)
	{
		out2.write(b, 0, numRead);
	}
	out2.flush();
	out2.close();
	in.close();
%>


