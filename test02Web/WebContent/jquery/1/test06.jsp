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
		$("tag, tag2,p.class") DOM 노드의 태그("tag,tag2,p.class")를 일괄검색
		
		"부모"로 지정된 요소의 "아이"로 지정된 모든 직접적인 자식 요소를 선택합니다.
	</p><br>
	
	<div>div</div>
	
	<p class="myClass">p class="myClass"</p>
	<p class="notMyClass">p class="notMyClass"</p>
	<span>span</span>
		
<script type="text/javascript">

	$("div,p.myClass").css("border","3px solid red");
	
</script>

</body>
</html>