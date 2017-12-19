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

	<form>
	<input name="name1" />
		<label>Name:</label>
		<input name="name" />
		<fieldset>
			<label>NewSletter:</label>
			
			<input name="newsletter" />
		</fieldset>
		<input name="name2" />
	</form>
	적용되지 않는 폼 <input name="text" id="none" value="noText" />
		
<script type="text/javascript">

	$("label - input").css("color","blue").val("Labeled2!");
	$("label + input").css("color","blue").val("Labeled!");
	
	//$("#none").val("testValue");
	//alert( $("#none").val() );
	
	
</script>

</body>
</html>
