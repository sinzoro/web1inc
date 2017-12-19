<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>

<%

	request.setCharacterEncoding("UTF-8");

	String fileName = request.getParameter("file_name");

	String savePath = "upload";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = sDownloadPath + "\\" + fileName;
	byte b[] = new byte[4096];


	System.out.println( fileName );
	System.out.println( sDownloadPath );
	System.out.println( sFilePath );
	
	// 브라우저가 IE인지 확인할 플래그.
    //boolean MSIE = request.getHeader("user-agent").indexOf("MSIE") != -1;
	boolean MSIE = request.getHeader("user-agent").indexOf("Trident") != -1;

    // 파일 다운로드 시 받을 때 저장될 파일명
    String fileNameToSave = "";

    // IE,FF 각각 다르게 파일이름을 적용해서 구분해주어야 한다.
    if(MSIE){
        // 브라우저가 IE일 경우 저장될 파일 이름
        // 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
        fileNameToSave = URLEncoder.encode(fileName, "UTF8").replaceAll("\\+", " ");
    }else{
        // 브라우저가 IE가 아닐 경우 저장될 파일 이름
        fileNameToSave = new String(fileName.getBytes("UTF-8"), "8859_1");
    }
    System.out.println( "MSIE:"+MSIE );
    System.out.println( "fileNameToSave:"+fileNameToSave );
	
	
	/* int size = 10*1024*1024;
	byte c[] = new byte[size]; */
	
	
	FileInputStream in = new FileInputStream(sFilePath);
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType1>>>" + sMimeType);

	if (sMimeType == null){
		sMimeType = "application/octet-stream";
	}
	System.out.println("sMimeType2>>>" + sMimeType);
	
	out.clear();					//	response err 해결
	out=pageContext.pushBody(); 	//	response err 해결

	response.reset();
	response.setContentType(sMimeType);
	String agent = request.getHeader("User-Agent");
	System.out.println( agent );
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

	if (ieBrowser) {
		fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	} else {
		//fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		//fileName = new String(fileName.getBytes("UTF-8"), "EUC-KR");
		//fileName = new String(fileName.getBytes("UTF-8"), "8859_1");
		//fileName = new String(fileName.getBytes("EUC-KR"), "UTF-8");
		fileName = new String(fileName.getBytes("ISO8859_1"),"UTF-8");
	}
	
	System.out.println("fileName1>>>" + fileName);

	response.setHeader("Content-Disposition", "attachment; filename= " + fileName);

	ServletOutputStream out2 = response.getOutputStream();
	int numRead;

	System.out.println("fileName2>>>" + fileName);
	
	while ((numRead = in.read(b, 0, b.length)) != -1) {
		out2.write(b, 0, numRead);
	}
	
	System.out.println("fileName3>>>" + fileName);
	
	if(in != null) in.close();
	if(out2 != null) out2.flush(); out2.close();
	
	//out2.flush();
	//out2.close();
	//in.close();
	
	System.out.println("fileName4>>>" + fileName);
%>


