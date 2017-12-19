<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>RequestGetParameter</title>
</head>
<body>

	<h2>파라미터 보내기</h2>
	<form action=01/RequestGetParameter method="post">
	<!-- <form action=GetParameterNames method="post"> -->
	<!-- <form action=GetParameterMap method="post"> -->
		텍스트 : <input type="text" name="name">
		<br>
		텍스트박스<textarea rows="5" cols="30" name="content"></textarea>
		<br>
		select : <select name="city">
					<option value="seoul" selected>서울</option>
					<option value="paris">파리</option>
					<option value="la">LA</option>
				 </select>
		radio : <input type="radio" name="sradio" value="large">large</input>
				<input type="radio" name="sradio" value="midium" checked>midium</input>
				<input type="radio" name="sradio" value="small">small</input>
		checkbox : <input type="checkbox" name="pet" value="dog">강아지</input>
					<input type="checkbox" name="pet" value="cat" checked>고양이</input>
				    <input type="checkbox" name="pet" value="pig">돼지</input>
		<input type="submit" value="저장">
	</form>

</body>
</html>