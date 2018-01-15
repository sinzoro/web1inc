<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="common.jsp" %>

<%@ page import="com.list10.entity.SubjectEntity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<table border=1>
	<tr>
		<td>과목번호</td>
		<td>과목명</td>
		<td>영문과목명</td>
		<td>개설년도</td>
	</tr>
	




	<c:forEach var="list" items="${list }" begin="0" step="1" >
	
	<tr>
		<td>${list.getSubCode() } </td>
		<td>${list.getSubName() } </td>
		<td>${list.getSubEname() } </td>
		<td>${list.getCreateYear() } </td>
	</tr>
	</c:forEach>
	
	</table>

</body>
</html>