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

	<p>��ɼ���</p>
	<p>
		$("�θ� > �ڽ�")
		
		"�θ�"�� ������ ����� "�ڽ�"�� ������ ��� �������� �ڽ� ��Ҹ� �����մϴ�.
	</p><br>
	
	<ul class="topnav">
		<li>Item 1</li>
		<li>Item 2
			<ul><li>Nested item 1</li><li>Nested item2 </li><li>Nested item 3</li></ul>
		</li>
		<li>Item 3</li>
	</ul>
		
<script type="text/javascript">

	$("ul.topnav > li").css("border","3px solid red");
	
</script>

</body>
</html>