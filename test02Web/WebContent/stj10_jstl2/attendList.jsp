<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="common.jsp" %>
<%@ page import="com.list10.entity.AttendEntity" %>

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
			<td width='200'>수강년도</td>
			<td width='200'>수강학기</td>
			<td width='200'>이수구분</td>
			<td width='200'>과목코드</td>
			<td width='200'>교수번호</td>
			<td width='200'>이수학점</td>
			<td width='200'>취득점수</td>
			<td width='200'>수강신청구분</td>
			<td width='200'>재수강구분</td>
			<td width='200'>수강처리일자</td>
		</tr>
		




	<c:forEach var="aList" items="${aList }" begin="0" step="1">
		<tr>
			<td>${aList.getStuNo() }</td>
			<td>${aList.getAttYear() }</td>
			<td>${aList.getAttTerm() }</td>
			<td>${aList.getAttIsu() }</td>
			<td>${aList.getSubCode() }</td>
			<td>${aList.getProfCode() }</td>
			<td>${aList.getAttPonumber() }</td>
			<td>${aList.getAttGrade() }</td>
			<td>${aList.getAttDiv() }</td>
			<td>${aList.getAttJae() }</td>
			<td>${aList.getAttDate() }</td>
		</tr>
	</c:forEach>
</table>



</body>
</html>