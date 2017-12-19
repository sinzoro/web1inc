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
	
	
	/* int size = 10*1024*1024;
	byte c[] = new byte[size]; */
	
	
	FileInputStream in = new FileInputStream(sFilePath);
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType1>>>" + sMimeType);

	if (sMimeType == null){
		//sMimeType = "application/octet-stream";
		sMimeType = "doesn/matter";
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

	//response.setHeader("Content-Disposition", "attachment; filename= " + fileName);
	response.setHeader("Content-Disposition", "JSP Generated Data; filename= " + fileName);

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


