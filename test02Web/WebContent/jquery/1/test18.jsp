<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
div {
	width: 70px;
	height: 40px;
	background: #ee77ff;
	margin: 5px;
	float: left;
}

span {
	display: block;
	clear: left;
	color: red;
}

.starthidden {
	display: none;
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>


	<table border="1">

		<tr>
			<td>Value 1</td>
			<td></td>
		</tr>
		<tr>
			<td>Value 2</td>
			<td></td>
		</tr>

	</table>



	<script>
		$("td:parent").fadeTo(1500,0.3);
	</script>


</body>
</html>
