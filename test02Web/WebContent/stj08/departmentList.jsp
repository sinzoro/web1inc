<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="common.jsp" %>

<%@ page import="com.list.entity.DepartmentEntity"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language='javascript'>

	function deptSubmit( deptCode ){
		
		
		document.getElementById('srch').value = deptCode;
		
		document.getElementById('cmd').value = 'select';
		
		document.getElementById('formDept').action = '/test02Web/StudentAction';
		document.getElementById("formDept").submit();
	}


</script>

</head>
<body>

	<form id='formDept' action='/test02Web/DepartmentAction' method=get>
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
			<%
				ArrayList list = (ArrayList) request.getAttribute("list");

				int deptCode = 0;
				String deptName = null;
				String deptEname = null;
				Timestamp createDate = null;

				for (int i = 0; i < list.size(); i++) {
					
					deptCode = ((DepartmentEntity) list.get(i)).getDeptCode();
					deptName = ((DepartmentEntity) list.get(i)).getDeptName();
					deptEname = ((DepartmentEntity) list.get(i)).getDeptEname();
					createDate = ((DepartmentEntity) list.get(i)).getCreateDate();

			%>
			<tr>
				<td><%=deptCode %></td>
				<td><%=deptName %></td>
				<td><%=deptEname %></td>
				<td><%=createDate %></td>
				<td>
				<a href="javascript:deptSubmit( <%=deptCode %> );" >학생정보</a>
				</td>
			</tr>
			<%
				}
			%>
			<input type=hidden id='srch' name='srch' value=''>
		</table>
	</form>


</body>
</html>