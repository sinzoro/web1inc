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

<script type="text/javascript"
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>

	<table border="1"> 
    <tr><td>Row with Index #0</td></tr> 
    <tr><td>Row with Index #1</td></tr> 
 
    <tr><td>Row with Index #2</td></tr> 
    <tr><td>Row with Index #3</td></tr>
    
    <tr><td></td></tr> 
    <tr><td>Row with Index #5</td></tr>
    
    <tr><td></td></tr> 
    <tr><td></td></tr>
    
    <tr><td>Row with Index #8</td></tr> 
    <tr><td>Row with Index #9</td></tr>
    
    <tr><td></td></tr> 
    <tr><td>Row with Index #11</td></tr>
  </table> 

	<div>John Resig</div>

	<div>George Martin</div>
	<div>Malcom John Sinclair</div>
	<div>J. Ohn</div>

	
	<script>
		
		$("div:contains('John')").css("text-decoration","underline");
		
		$("td:empty").html("<input type='check'>");
		
		//$("td:empty").text("비었음").css("background","green");
		
	</script>
	

</body>
</html>
