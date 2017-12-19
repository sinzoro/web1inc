<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.jquery.com/jquery-3.2.1.js">
	<script language="javascript">
</script>
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
	$("span:first").text("Found " + $(":hidden", document.body).length + " hidden elements total."); 
	$("div:hidden").show(3000); $("span:last").text("Found " + $("input:hidden").length + " hidden inputs."); 


	</script>