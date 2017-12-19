<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style> 
  .test{ border: 3px inset red; } 
  </style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>


	<div><p> p태그가 존재하는 div </p></div>	


	<div> p태그가 존재하지 않는 div </div>
	

	
	<script>
		
		$("div:has(p)").addClass("test");
		
	</script>
	

</body>
</html>
