<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>RequestGetParameter</title>
</head>
<body>

	<h2>�Ķ���� ������</h2>
	<form action=01/RequestGetParameter method="post">
	<!-- <form action=GetParameterNames method="post"> -->
	<!-- <form action=GetParameterMap method="post"> -->
		�ؽ�Ʈ : <input type="text" name="name">
		<br>
		�ؽ�Ʈ�ڽ�<textarea rows="5" cols="30" name="content"></textarea>
		<br>
		select : <select name="city">
					<option value="seoul" selected>����</option>
					<option value="paris">�ĸ�</option>
					<option value="la">LA</option>
				 </select>
		radio : <input type="radio" name="sradio" value="large">large</input>
				<input type="radio" name="sradio" value="midium" checked>midium</input>
				<input type="radio" name="sradio" value="small">small</input>
		checkbox : <input type="checkbox" name="pet" value="dog">������</input>
					<input type="checkbox" name="pet" value="cat" checked>�����</input>
				    <input type="checkbox" name="pet" value="pig">����</input>
		<input type="submit" value="����">
	</form>

</body>
</html>