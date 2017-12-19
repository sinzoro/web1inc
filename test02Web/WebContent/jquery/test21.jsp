<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
span {
	color: #008;
}

span.sogreen {
	color: green;
	font-weight: bolder;
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>


	<div>
		<span>John,</span> <span>Karl,</span> <span>Brandon</span>

	</div>
	<div>
		<span>Glen,</span> <span>Tane,</span> <span>Ralph</span>

	</div>
	<div>
		<span>hong,</span>

	</div>


	<script>

		//$("div span:first-child").css("text-decoration","underline");
		
		//$("div span:last-child").css("text-decoration","underline");
		
		$("div span:only-child").css("text-decoration","underline");	// 하나만 있을때
	
	</script>


</body>
</html>
