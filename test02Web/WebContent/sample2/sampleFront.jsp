<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/sampleAction2" >
		학과코드 : <input type="text" name="deptName" >
		학과명 : <input type="text" name="deptCode" >
		학과영문명 : <input type="text" name="deptEname" >
		<input type="submit" value="" >
	</form>

</body>
</html>