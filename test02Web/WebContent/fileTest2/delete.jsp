<%-- file_down.jsp Test --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.ServletUtils" %>

<%
request.setCharacterEncoding("EUC-KR");
String fileName = new String(request.getParameter("fileUrl").getBytes("ISO-8859-1"), "KSC5601");
String fileUrl = "WebContent/StyleUpload/" + fileName;
if(fileUrl == null) return;
boolean fileexists = true;
try
{
 ServletContext cxt = getServletConfig().getServletContext();
 String file = cxt.getRealPath(fileUrl);
 File fileEx = new File(file);
 if(fileEx.exists()) 
 {
  fileEx.delete();
 }
}
catch(Exception e) 
{
    e.printStackTrace();
 }


%>


