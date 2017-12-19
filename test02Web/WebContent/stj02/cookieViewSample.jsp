<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.net.URLDecoder" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>cookieViewSample</title>
</head>
<body>

	<%
		Cookie[] cookie = request.getCookies();
	//
		if( cookie != null && cookie.length > 0 ){
			for( int i=0; i<cookie.length; i++ ){
				out.print( cookie[i].getName() +" : ");
	%><%=cookie[i].getValue()+" : " %><%=URLDecoder.decode(cookie[i].getValue())+"<br>" %><%
			}
		}
	%>


</body>
</html>