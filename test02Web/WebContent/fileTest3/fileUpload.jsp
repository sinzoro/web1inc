<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath=request.getRealPath("/upload");
	
	int size = 10*1024*1024;
	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	
	String test = "";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		name=multi.getParameter("name");
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1= multi.getOriginalFileName(file1); 

		
		//타임스탬프
		long currentTime = System.currentTimeMillis();   
        SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateTimeString = simDf.format(new java.util.Date(currentTime));
        int randomNumber = (int)(Math.random()*100000);   
        String uniqueFileName = "" + dateTimeString + randomNumber;   
		String newuniqueFileName="";
		 
		 File oldFile = new File(uploadPath + "\\" + filename1);
		 File newFile = new File(uploadPath + "\\" + uniqueFileName); 
		
		 
		 test = uniqueFileName;
		 System.out.println( uniqueFileName );
		 System.out.println( filename1 );
		 System.out.println( newuniqueFileName );
		 System.out.println( oldFile );
		 System.out.println( newFile );
		 
		 int count=1;
		 while(newFile.exists()){
			 newuniqueFileName = uniqueFileName + "_" + count;
			 count = count + 1;
			 newFile = new File(uploadPath + "\\" + newuniqueFileName);
			 
			 
		 }
		 
		 oldFile.renameTo(newFile);	

			//System.out.println( oldFile );
			//System.out.println( newFile );
			
			//System.out.println( filename1 );
			//System.out.println( newuniqueFileName );
		
		
		
		String file2 =(String)files.nextElement();
		filename2=multi.getFilesystemName(file2);
		origfilename2=multi.getOriginalFileName(file2);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="text" name="name" value="<%=name%>">
	<input type="text" name="subject" value="<%=subject%>">
	<input type="text" name="filename1" value="<%=test%>">
	<input type="text" name="filename2" value="<%=filename2%>">
	<input type="text" name="origfilename1" value="<%=test%>">
	<input type="text" name="origfilename2" value="<%=origfilename2%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
