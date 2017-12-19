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

	<p>기능설명</p>
	<p>
		$("조상 자손")
		지정된 조상의 자손 모든 요소를 선택합니다.
	</p>
	<form action="">
		<div>form 영역은 초록색</div>
		<label>Child:</label>
		<input name="name" />
		
		<fieldset>
			<label>Grandchild:</label>
			<input name="newsletter" />
		</fieldset>
	</form>
	form 외부 : <input name="name" />
		
<script type="text/javascript">

	$("form input").css("border","2px solid blue");
	
</script>

</body>
</html>