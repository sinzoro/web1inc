<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common.jsp" %>

<%@ page import="com.list10.entity.DepartmentEntity"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language='javascript'>

	function deptSubmit( deptCode ){
		
		
		document.getElementById('srch').value = deptCode;
		
		document.getElementById('cmd').value = 'select';
		
		document.getElementById('formDept').action = '${pageContext.request.contextPath}/StudentAction10';
		document.getElementById("formDept").submit();
	}


</script>

</head>
<body>

	<form id='formDept' action='${pageContext.request.contextPath}/DepartmentAction10' method=get>
		<table border="1">
			<tr>
				<td colspan=5 align=right><input type=submit value=등록하기 ></td>
				<input type=hidden id='cmd' name='cmd' value='insertPage'>
			</tr>
			<tr>
				<td width='200'>학과번호</td>
				<td width='200'>학과국문명</td>
				<td width='200'>학과영문명</td>
				<td width='200'>학과생성명</td>
				<td width='200'>학생정보상세보기</td>
			</tr>


		<c:forEach var="list" items="${list }" begin="0" step="1" >
			<tr>
				<td>${list.getDeptCode() }</td>
				<td>${list.getDeptName() }</td>
				<td>${list.getDeptEname() }</td>
				<td>${list.getCreateDate() }</td>
				<td>
				<a href="javascript:deptSubmit( ${list.getDeptCode() } );" >학생정보</a>
				</td>
			</tr>
		</c:forEach>>
			
			<input type=hidden id='srch' name='srch' value='${srch }'>
		</table>
	</form>


</body>
</html>