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
		map.put("today","2017년11월20일입니다.");
		
		pageContext.setAttribute("mapVar",map);
	
	%>
	
	<c:set var="todayCheck" value="${map}" />
	<c:out value="${mapVar.today}" />
	<c:out value="${empty mapVar.today}" />
	<c:out value="${empty todayCheck}" />
	
	<P>
	<!-- Map 선언 -->
	 <c:set var="mapTest" value="<%=new java.util.HashMap()%>" />
	<!-- Map 에 값 넣기 -->
	 <c:set target="${mapTest}" property="key1" value="value1" />
	 <c:set target="${mapTest}" property="key2" value="value2" />
	${mapTest.key1}<!-- value1 이 출력됨 -->
	${mapTest.key2}<!-- value2 이 출력됨 -->
	
	<P>
	<c:forEach var="mapTest" items="${mapTest}">
		${mapTest.key}<!--  key1, key2 ... 이 출력됨 -->
	 	${mapTest.value}<!--  value1, value2 ... 이 출력됨 --> 
	</c:forEach>

	<P>
	<c:set var="todayCheck" value="${mapTest}" />
	<c:out value="${todayCheck}" />
	
	<p>
	
	<c:set var="myColor" value="빨강" />
	<c:out value="${myColor}" />
	<c:if test="${myColor == '빨강' }">
		색상은 빨강색이다..
	</c:if>
	
	<c:set var="grade" value="70" />
	<c:choose>
		<c:when test="${ grade >= 90 }">
			학점은 A 이다.
		</c:when>
		<c:when test="${ grade >= 80 }">
			학점은 B 이다.
		</c:when>
		<c:when test="${ grade >= 70 }">
			학점은 C 이다.
		</c:when>
	</c:choose>



</body>
</html>