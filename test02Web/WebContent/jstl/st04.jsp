<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<p>
	
	<%
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("today","2017��11��20���Դϴ�.");
		
		pageContext.setAttribute("mapVar",map);
	
	%>
	
	<c:set var="todayCheck" value="${map}" />
	<c:out value="${mapVar.today}" />
	
	
	<p>
	
	<c:set var="myColor" value="����" />
	<c:if test="${myColor == '����' }">
		������ �������̴�..
	</c:if>
	
	<c:set var="grade" value="70" />
	<c:choose>
		<c:when test="${ grade >= 90 }">
			������ A �̴�.
		</c:when>
		<c:when test="${ grade >= 80 }">
			������ B �̴�.
		</c:when>
		<c:when test="${ grade >= 70 }">
			������ C �̴�.
		</c:when>
	</c:choose>



</body>
</html>