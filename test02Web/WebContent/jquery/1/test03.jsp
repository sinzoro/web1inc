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

<script type="text/javascript"
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
<script type="text/javascript">

	function count() {
		alert("<p>갯수는" + $("P").length + "개 입니다.");
		//alert("<p>갯수는" + $("P").size() + "개 입니다.");
	}
	
</script>

</head>
<body>

	<div>
		<p>문장 1.</p>
		<p>문장 2.</p>
		<p>문장 3.</p>
		<p>문장 4.</p>
	</div>
	<div>
		<p>문장 5.</p>
		<p>문장 6.</p>
	</div>

	<form>
		<input type="button" value="선택" onClick="count()">
	</form>


</body>
</html>