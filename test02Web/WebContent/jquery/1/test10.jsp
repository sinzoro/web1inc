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

	<div>#prev ������ ����</div>
	<span id="prev">span#prev</span>
	<div>div ����</div>
	
	<div>div ���� <div id="small">div ������ �ڽ�</div></div>
	<span>span ��ũ ����</span>
	<div>div ����</div>
		
<script type="text/javascript">

	$("#prev ~ div").css("border","3px groove blue");
	
	
</script>

</body>
</html>
