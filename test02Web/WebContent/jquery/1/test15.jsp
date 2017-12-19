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

<script type="text/javascript"	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>

	<table border="1"> 
    <tr><td>Row with Index #0</td></tr> 
    <tr><td>Row with Index #1</td></tr> 
 
    <tr><td>Row with Index #2</td></tr> 
    <tr><td>Row with Index #3</td></tr>
    
    <tr><td>Row with Index #4</td></tr> 
    <tr><td>Row with Index #5</td></tr>
    
    <tr><td>Row with Index #6</td></tr> 
    <tr><td>Row with Index #7</td></tr>
    
    <tr><td>Row with Index #8</td></tr> 
    <tr><td>Row with Index #9</td></tr>
    
    <tr><td>Row with Index #10</td></tr> 
    <tr><td>Row with Index #11</td></tr>
  </table> 

<script>

	$("tr:even").css("background-color","red");
	$("tr:odd").css("background-color","green");
	$("tr:eq(2)").css("background-color","blue");
	$("tr:gt(10)").css("background-color","yellow");
	$("tr:lt(1)").css("background-color","silver");

</script>

</body>
</html>
