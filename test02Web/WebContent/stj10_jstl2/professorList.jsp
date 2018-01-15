<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="common.jsp" %>
<%@ page import="com.list10.entity.ProfessorEntity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border=1>
	<tr>
		<td width=200>교수번호</td>
		<td width=200>교수명</td>
		<td width=200>교수영문이름</td>
		<td width=200>교수임용날짜</td>
	</tr>



		<c:forEach var="list" items="${list }" begin="0" step="1" >
		<tr>
			<td>${list.getProfCode()} </td>
			<td>${list.getProfName()} </td>
			<td>${list.getProfEname()}  </td>
			<td>${list.getCreateDate()} </td>
		</tr>
		</c:forEach>

	</table>



</body>
</html>