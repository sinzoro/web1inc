<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
div {
	width: 50px;
	height: 40px;
	margin: 5px;
	border: 3px outset green;
	float: left;
}

.starthidden {
	display: none;
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>


	<button>숨겨진 객체 보이기</button>
	<div></div>
	<div class="starthidden">숨겨진 객체</div>
	<div></div>

	<div></div>
	<div style="display: none;">숨겨진 객체</div>



	<script>

		$("div:hidden").click(function (){
			$(this).css("background","yellow");
		});
		
		$("button").click(function (){
			$("div:hidden").show("fast");
		});
		
	
	</script>


</body>
</html>
