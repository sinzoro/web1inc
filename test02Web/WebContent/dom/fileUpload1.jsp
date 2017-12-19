<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	String uploadPath=request.getRealPath("/upload");

	System.out.println( uploadPath );
	
	int size = 10*1024*1024;
	String name="";
	String subject="";
	String[] filename = null;
	String[] origfilename = null;	
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());
		
		String fileNameCount = multi.getParameter("fileNameCount");
		String fileNameArr = multi.getParameter("fileNameArr");
		
		//System.out.println( fileNameCount );
		
		if( fileNameCount == null ){
			fileNameCount = "1";
		}

		filename = new String[Integer.parseInt(fileNameCount)];
		origfilename = new String[Integer.parseInt(fileNameCount)];

		name=multi.getParameter("name");
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();
		
		String[] testArr = fileNameArr.split(":");
		int fnCount = testArr.length;
		
		System.out.println( fnCount );
		for( int i=0;i<testArr.length;i++ ){
			System.out.println( testArr[i] );
		}
		
		for( int i=0;i<Integer.parseInt(fileNameCount);i++ ){
			if( files.hasMoreElements() ){
				for( int j=0;j<fnCount;j++ ){
					if( testArr[j].equals(i+"") ){
						String file1 = (String)files.nextElement();
						filename[i]=multi.getFilesystemName(file1);
						origfilename[i]=multi.getOriginalFileName(file1);
						
						//타임스탬프
						long currentTime = System.currentTimeMillis();
				        SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
				        String dateTimeString = simDf.format(new java.util.Date(currentTime));
				        int randomNumber = (int)(Math.random()*100000);   
				        String uniqueFileName = "" + dateTimeString + randomNumber;   
						String newuniqueFileName="";
						 
						 File oldFile = new File(uploadPath + "\\" + filename[i]);
						 File newFile = new File(uploadPath + "\\" + uniqueFileName); 
						
						 int count=1;
						 while(newFile.exists()){
							 newuniqueFileName = uniqueFileName + "_" + count;
							 count = count + 1;
							 newFile = new File(uploadPath + "\\" + newuniqueFileName); 
						 }
						 oldFile.renameTo(newFile);
					}//if 체크된 파일 하나만
				}//for 체크된 파일만
			}//if 파일 하나씩
		}//for 파일 총갯수
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>


<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="text" name="name" value="<%=name%>">
	<input type="text" name="subject" value="<%=subject%>">
	<input type="text" name="filename1" value="<%=(filename[0]==null?"":filename[0])%>">
	<<%-- input type="text" name="filename2" value="<%=(filename[1]==null?"":filename[1])%>">
	<input type="text" name="filename3" value="<%=(filename[2]==null?"":filename[2])%>"> --%>
	<input type="text" name="origfilename1" value="<%=(origfilename[0]==null?"":origfilename[0])%>">
	<%-- <input type="text" name="origfilename2" value="<%=(origfilename[1]==null?"":origfilename[1])%>">
	<input type="text" name="origfilename3" value="<%=(origfilename[2]==null?"":origfilename[2])%>"> --%>
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>

