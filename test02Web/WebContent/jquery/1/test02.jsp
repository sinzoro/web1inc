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

<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
<script type="text/javascript">


	
	$(document).ready(function(){
		$("#but12").click(function(){
			alert('btn click');
		});
	});

	

</script>

</head>
<body>

	<p>기능설명</p>
	<p>$("#id")는 document.getElementById("id")와 같은 기능</p>
	<div id="notMe">
		<p>id="notMe"</p>
	</div>
	
	<div id="myDiv">id="myDiv"</div>
	<input type="button" id="but12" name="but12" value="버튼">
	<script>
		$("#myDiv").css("border","3px solid red");
	</script>

</body>
</html>