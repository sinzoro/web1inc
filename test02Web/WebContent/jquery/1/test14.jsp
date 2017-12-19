<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</head>
<body>

	<div>
		<input type="checkbox" name="a" /> <span>서울</span>
	</div>

	<div>
		<input type="checkbox" name="b" /> <span>경기</span>

	</div>
	<div>
		<input type="checkbox" name="c" checked="checked" /> <span>부산</span>
	</div>

<script>

	$("input:checked + span").css("background-color","red");
	
	$("input:not(:checked) + span").css("background-color","green");
	
	$("input").attr("disabled","disabled");
	

</script>

</body>
</html>