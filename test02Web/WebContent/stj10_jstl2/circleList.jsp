<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common.jsp" %>

<%@ page import="com.list10.entity.CircleEntity" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border=1>
	<tr>
		<td width=200>동아리가입번호</td>
		<td width=200>동아리명</td>
		<td width=200>학번</td>
		<td width=200>이름</td>
		<td width=200>동아리직책</td>
	</tr>


	<c:forEach var="cList" items="${cList }" begin="0" step="1" >
	<tr>
		<td>${cList.getCirNum() }</td>
		<td>${cList.getCirName() }</td>
		<td>${cList.getStuNo() }</td>
		<td>${cList.getStuName() }</td>
		<td>${cList.getPresident() }</td>
	</tr>
	</c:forEach>

</table>



</body>
</html>