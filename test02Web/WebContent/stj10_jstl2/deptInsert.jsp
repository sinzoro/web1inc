<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script language='javascript'>


	function deptInsSubmit(){
		
		var deptCode = document.getElementById('deptCode').value;
		var deptName = document.getElementById('deptName').value;
		var deptEname = document.getElementById('deptEname').value;
		
		//여기부터 넘기고 등록 테스트 부터 시작
		
		if( deptCode=='' || deptName=='' || deptEname=='' ){
			alert('빈값만 체크');
			return 0;
		}
		
		document.getElementById("formIns").submit();

	}

	function deptListSubmit(){
		document.getElementById('cmd').value = 'select';
		document.getElementById("formIns").submit();
	}
	
</script>


</head>
<body>

	
	
	<c:set var="deptCode" value='${ deptCode eq "" || deptCode eq null ?"10":deptCode }' />
	<c:set var="deptName" value='${ deptName eq "" || deptName eq null ?"test":deptName }' />
	<c:set var="deptEname" value='${ deptEname eq "" || deptEname eq null ?"test":deptEname }' />
	<c:set var="CreateDate" value='${ CreateDate eq "" || CreateDate eq null ?"2017-10-25":deptEname }' />
	<c:set var="errMsg" value='${ errMsg eq "" || errMsg eq null ?"noErr":errMsg }' />
	<c:set var="errRs" value='${ errRs eq "" || errRs eq null ?"0":errRs }' />


	<form action='${pageContext.request.contextPath }/DepartmentAction10' id='formIns' method=get>
		<input type=hidden name='cmd' id='cmd' value='insert'>
		<table border=1>
			<tr>
				<td width=200>errMsg</td>
				<td width=400><input type=text name=errMsg value=${errMsg } ></td>
			</tr>
			<tr>
				<td>학과코드</td>
				<td><input type=text name=deptCode id=deptCode value=${deptCode } ></td>
			</tr>
			<tr>
				<td>학과명</td>
				<td><input type=text name=deptName id=deptName value=${deptName } ></td>
			</tr>
			<tr>
				<td>학과영문명</td>
				<td><input type=text name=deptEname id=deptEname value=${deptEname } ></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type=hidden name=errRs value=${errRs } >
					<input type=button value=등록 onclick='deptInsSubmit()'>
					<input type=button value=리스트 onclick='deptListSubmit()'>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>