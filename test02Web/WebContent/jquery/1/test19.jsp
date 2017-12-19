<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
div {
	width: 70px;
	height: 40px;
	background: #ee77ff;
	margin: 5px;
	float: left;
}

span {
	display: block;
	clear: left;
	color: red;
}

.starthidden {
	display: none;
}
</style>

<script type="text/javascript"	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>


	<span></span>
	<div></div>
	<div style="display: none;">Hider!</div>
	<div></div>

	<div class="starthidden">Hider!</div>
	<div></div>
	<form>
		<input type="hidden" /> <input type="hidden" /> <input type="hidden" />
	</form>
	<span></span>



	<script>

		var hiddenElements = $("body").find("hidden");
		
		//var hiddenElements = $("body").find(:hidden).not("script").not("head");
		
		
		$("span:first").text("hidden 갯수는 :"+$("input:hidden").length);

		//$("span:first").text("hidden 갯수는 :"+hiddenElements.length);
		
		
	
	</script>


</body>
</html>
