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
		$(".myClass") 엘리멘트의 myClass 속성에 접근
		
		getElementsByClassNamd() 와 같은 기능
	<p>
	
	<div class="notMe">div class="notMe"</div>
	
	<div class="myClass">div class="notMe"</div>
	<span class="myClass">span class="notMe"</span>
<script type="text/javascript">

	$(".myClass").css("border","3px solid red");
	
</script>

</body>
</html>