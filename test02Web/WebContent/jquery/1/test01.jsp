<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
<script type="text/javascript">

	window.onload = function(){
		alert('window.onload run');
	}
	
	$(document).ready(function(){
		alert( 'onload run' );
	});

	$(function(){
		alert( 'run1' );
	});
	
	$(function(){
		alert( 'run2' );
	});

</script>

</head>
<body>

</body>
</html>