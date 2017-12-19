<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="/test02Web/SampleAction" method="post" >
		학과코드 : <input type="text" name="deptCode">
		<input type="hidden" name="cmd" value="selectOne">
		<p>
		<input type="submit" value="조회하기">
	
	</form>

</body>
</html>