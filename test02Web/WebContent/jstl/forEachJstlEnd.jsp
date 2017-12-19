<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="com.basic.Job"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	
	<h1>JSTL Core ���̺귯�� �ǽ�1</h1>

	<c:forEach var="n" items="${myArray}">
		<c:out value="${n}" />
	</c:forEach>
	<br>
	
	
	<h1>JSTL Core ���̺귯�� �ǽ�2</h1>
	
	<c:forEach var="n" items="${myArray}" begin="0" end="6">
		<c:out value="${n}" />
	</c:forEach>
	<br>
	
	
	<h1>JSTL Core ���̺귯�� �ǽ�3</h1>
	
	<c:forEach var="n" items="${name}" >
		<c:out value="${n}" />
	</c:forEach>
	<br>
	
	
	<h1>JSTL Core ���̺귯�� �ǽ�4</h1>
	
	<c:forEach var="job" items="${job}" varStatus="status" begin="0" end="1" step="1">
		{<c:out value="${status.index+1}" />��° : 
		<c:out value="${job.getJobCode()}" />-
		<c:out value="${job.jobCode}" />-
		<c:out value="${job.jobName}" />}
		<!-- c:out value="${status.step}" / --><br>
	</c:forEach>
	
	<c:forEach var="job" items="${job}" varStatus="status" begin="0" step="1">
		{<c:out value="${status.index+1}" />��° : 
		<c:out value="${job.getJobCode()}" />-
		<c:out value="${job.jobCode}" />-
		<c:out value="${job.jobName}" />}
		<!-- c:out value="${status.step}" / --><br>
	</c:forEach>
	
	
	<!--  -->
	
	<h1>JSTL Core ���̺귯�� �ǽ�5</h1>
	
	<c:forTokens var="n" items="${data}" delims="," >
		<c:out value="${n}" />
		<br>
	</c:forTokens>
	<br>
	
	
	<h1>JSTL Core ���̺귯�� �ǽ�6</h1>
	
	<c:forEach var="loop" begin="1" end="5" step="1" >
		<c:out value="${loop}" />
	</c:forEach>
	<br>
	
	

</body>
</html>