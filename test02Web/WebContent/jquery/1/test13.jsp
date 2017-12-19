<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
div {
	width: 90px;
	height: 90px;
	float: left;
	padding: 5px;
	margin: 5px;
	background-color: #EEEEEE;
}
</style>

<script type="text/javascript"	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
<script type="text/javascript">

	
	
</script>

</head>
<body>

	<table>
		<tr>
			<td>Row 1</td>
		</tr>
		<tr>
			<td>Row 2</td>
		</tr>
		<tr>
			<td>Row 3</td>
		</tr>
	</table>
		
<script type="text/javascript">

	$("tr:last").css("font-style","italic");
	
	
</script>

</body>
</html>
