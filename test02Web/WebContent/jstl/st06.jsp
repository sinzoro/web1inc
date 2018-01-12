<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.basic.Job"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% response.setContentType("text/html"); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<c:url value="../jstl2/urlJstlEnd2.jsp?name=홍3test2홍길동333&age=74" var="moveUrl3"/>
	<c:url value="urlJstlEnd.jsp?name=홍3test2홍길동222&age=74" var="moveUrl2" />
	<!-- c:param 안 쓰면 한글 깨짐 -->
	<c:url value="./test/urlJstlEnd.jsp" var="moveUrl1" >
		<c:param name="name" value="홍길동" />
		<c:param name="age" value="74" />
	</c:url>
	
	
	<//c:out value="${moveUrl3 }" />
	<c:redirect url="${moveUrl2 }"/>
	
	
</body>
</html>

