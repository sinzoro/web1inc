<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>

<%@ page buffer="1kb" %>
<%@ page autoFlush="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	Enumeration initParam = application.getInitParameterNames();
	String initParamName="";	
	
	while( initParam.hasMoreElements() ){
		initParamName = (String)initParam.nextElement();
	%>
	
	<p>name : <%=initParamName %>, value : <%=application.getInitParameter(initParamName) %>
	
	<%}%>
	
	<%
		for( int i=0; i<3000; i++ ){
			out.print("1234");
		}
	%>



	<%
		String chkValue = request.getParameter("chkValue");
		Enumeration chkNames = request.getParameterNames();
		Map chkMap = request.getParameterMap();
		
		//
		out.print( chkValue );
		//
		while( chkNames.hasMoreElements() ){
			System.out.println( chkNames.nextElement() );
		}
		
		
	
	%>

</body>
</html>