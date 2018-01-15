<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="common.jsp" %>
<%@ page import="com.list10.entity.ScoreEntity" %>
    
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
			<td width='200'>성적취득년도</td>
			<td width='200'>학기</td>
			<td width='200'>신청학점</td>
			<td width='200'>취득학점</td>
			<td width='200'>평점평균</td>
			<td width='200'>백분률 총점</td>
			<td width='200'>성적구분</td>
			<td width='200'>성적처리일자</td>
		</tr>



	<c:forEach var="list" items="${list }" begin="0" step="1" >
	<tr>
		<td>${list.getStuNo() } </td>
		<td>${list.getScoYear() } </td>
		<td>${list.getScoTerm() } </td>
		<td>${list.getReqPonumber() } </td>
		<td>${list.getTakePonumber() }  </td>
		<td>${list.getExamAvg() }  </td>
		<td>${list.getExamTotal() }  </td>
		<td>${list.getScoDiv() }  </td>
		<td>${list.getScoDate() }  </td>
	</tr>
	</c:forEach>

	</table>



</body>
</html>