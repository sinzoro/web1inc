<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

	<%
	
	String deptCode = request.getParameter("deptCode");
	deptCode = (deptCode==null?"10":deptCode);
	deptCode = (deptCode.equals("")?"10":deptCode);
	String deptName = request.getParameter("deptName");
	deptName = (deptName==null?"test":deptName);
	deptName = (deptName.equals("")?"test":deptName);
	String deptEname = request.getParameter("deptEname");
	deptEname = (deptEname==null?"test":deptEname);
	deptEname = (deptEname.equals("")?"test":deptEname);
	String CreateDate = request.getParameter("CreateDate");
	CreateDate = (CreateDate==null?"2017-10-25":CreateDate);
	CreateDate = (CreateDate.equals("")?"2017-10-25":CreateDate);
	String errMsg = request.getParameter("errMsg");
	errMsg = (errMsg==null?"noErr":errMsg);
	errMsg = (errMsg.equals("")?"noErr":errMsg);
	String errRs = request.getParameter("errRs");
	errRs = (errRs==null?"0":errRs);
	
	
	
	%>

	<form action=/test02Web/DepartmentAction id='formIns' method=get>
		<input type=hidden name='cmd' id='cmd' value='insert'>
		<table border=1>
			<tr>
				<td width=200>errMsg</td>
				<td width=400><input type=text name=errMsg value=<%=errMsg %> ></td>
			</tr>
			<tr>
				<td>학과코드</td>
				<td><input type=text name=deptCode id=deptCode value=<%=deptCode %> ></td>
			</tr>
			<tr>
				<td>학과명</td>
				<td><input type=text name=deptName id=deptName value=<%=deptName %> ></td>
			</tr>
			<tr>
				<td>학과영문명</td>
				<td><input type=text name=deptEname id=deptEname value=<%=deptEname %> ></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type=hidden name=errRs value=<%=errRs %>>
					<input type=button value=등록 onclick='deptInsSubmit()'>
					<input type=button value=리스트 onclick='deptListSubmit()'>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>