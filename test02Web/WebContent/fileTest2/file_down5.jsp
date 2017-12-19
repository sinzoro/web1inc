<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.ServletUtils"%>

<%
	//if(vo.getString("fileDown").equals("true")) {
	//request.setCharacterEncoding("EUC-KR");
	//ServletOutputStream out = null;
	String fileName = new String(request.getParameter("file_name").getBytes("ISO-8859-1"), "KSC5601");
	//String fileUrl = "WebContent/StyleUpload/" + fileName;
	String fileUrl = "C:/project" + fileName;
	if (fileUrl == null)
		return;
	boolean fileexists = true;
	try {
		ServletContext cxt = getServletConfig().getServletContext();
		String file = cxt.getRealPath(fileUrl);
		File fileEx = new File(file);
		if (fileEx.exists()) {
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + java.net.URLEncoder.encode(fileName, "UTF-8"));
			byte[] buffer = new byte[1024 * 15];
			ServletOutputStream out2 = response.getOutputStream();
			//ServletOutputStream out = response.getOutputStream();
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bout = new BufferedOutputStream(out2);
			int n = 0;
			while ((n = in.read(buffer, 0, 1024 * 15)) != -1) {
				bout.write(buffer, 0, n);
				bout.flush();
			}
			bout.close();
			in.close();
		} else {
			fileexists = false;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	/* if(!fileexists) {
	 vo.put("message", MessageUtil.getMessage("MSG00009"));
	 }*/

	//}
%>


