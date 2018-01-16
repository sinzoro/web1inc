<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="common.jsp"%>
<%@ page import="com.list10.entity.StudentEntity"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language='javascript'>
	function studentListSubmit() {
		//document.getElementById('cmd').value = 'select';
		document.getElementById("formStu").submit();
	}

	function deptListSubmit() {
		//document.getElementById('cmd').value = 'select';
		document.getElementById('formStu').action = '${pageContext.request.contextPath}/test02Web/DepartmentAction10';
		document.getElementById("formStu").submit();
	}
</script>

</head>
<body>

	<form action='' id="formStu" method=get>
		<input type=hidden name='cmd' id='cmd' value='select'>
		<table border="1">
			<tr>
				<td colspan=10>10=간호학과 20=경영학과 30=수학학과 40=컴퓨터정보학과 50=정보통신학과
					60=회계학과 70=전기학과 80=전자학과</td>

				<td colspan=2><input type=text name=srch value=''></td>
				<td colspan=1><input type=button value='검색'
					onclick='studentListSubmit()'></td>
				<td colspan=1><input type=button value='코드리스트'
					onclick='deptListSubmit()'></td>
			</tr>
			<tr>
				<td width='200'>학과</td>
				<td width='200'>학번</td>
				<td width='200'>학생이름</td>
				<td width='300'>영문이름</td>
				<td width='200'>학과코드</td>
				<td width='200'>학년</td>
				<td width='200'>반</td>
				<td width='200'>주야구분</td>
				<td width='200'>주민등록번호</td>
				<td width='200'>우편번호</td>
				<td width='200'>주소</td>
				<td width='200'>전화번호</td>
				<td width='200'>휴대전화번호</td>
				<td width='200'>출생년도</td>
			</tr>
			
			

			
			<c:forEach var="list" items="${list }" begin="0" step="1" >
			<tr>
				<td>${list.getSubj()}  </td>
				<td>${list.getStuNo()} </td>
				<td>${list.getStuName()} </td>
				<td>${list.getStuEname()} </td>
				<td>${list.getDeptCode()} </td>
				<td>${list.getGrade()} </td>
				<td>${list.getClass1()} </td>
				<td>${list.getJuya()} </td>
				<td>${list.getIdNum()} </td>
				<td>${list.getPostNo()} </td>
				<td>${list.getAddress()} </td>
				<td>${list.getTel()} </td>
				<td>${list.getPhoneNo()} </td>
				<td>${list.getBirthYear()} </td>
			</tr>
			</c:forEach>

		</table>
	</form>


</body>
</html>