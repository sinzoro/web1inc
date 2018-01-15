<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common.jsp" %>
<%@ page import="com.list10.entity.PostEntity" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td width='200'>우편번호</td>
			<td width='200'>동이름</td>
			<td width='200'>주소</td>
			<td width='200'>전화지역번호</td>
		</tr>
		


		<c:forEach var="list" items="${list }" begin="0" step="0">
		<tr>
			<td>{list.getPostNo() } </td>
			<td>{list.getPostDong() }  </td>
			<td>{list.getPostAddress() }  </td>
			<td>{list.getDdd() }  </td>
		</tr>
		</c:forEach>
		
	</table>



</body>
</html>