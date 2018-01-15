<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="common.jsp" %>
<%@ page import="com.list10.entity.FeeEntity" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td width='200'>학번</td>
			<td width='200'>등록년도</td>
			<td width='200'>등록학기</td>
			<td width='200'>입학금</td>
			<td width='200'>등록금(수업료)</td>
			<td width='200'>등록금총액=입학금+수업료</td>
			<td width='200'>장학코드</td>
			<td width='200'>장학금액</td>
			<td width='200'>납부총액=등록금총액-장학금액</td>
			<td width='200'>등록구분</td>
			<td width='200'>등록날짜</td>
		</tr>





		<c:forEach var="list" items="${list }" begin="0" step="1" >
		<tr>
			<td>${list.getStuNo() } </td>
			<td>${list.getFeeYear() } </td>
			<td>${list.getFeeTerm() } </td>
			<td>${list.getFeeEnter() } </td>
			<td>${listgetFeePrice() } </td>
			<td>${list.getFeeTotal() } </td>
			<td>${list.getJangCode() }  </td>
			<td>${list.getJangTotal() } </td>
			<td>${list.getFeePay() } </td>
			<td>${list.getFeeDiv() } </td>
			<td>${list.getFeeDate() } </td>
		</tr>
		</c:forEach>
		
	</table>



</body>
</html>