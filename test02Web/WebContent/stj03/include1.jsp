<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%=request.getParameter("testR") %><br>
	<% //out.print(test);	//접근 안됨 - request는 접근 될듯 %>
	in1<br>
	<% String test1 = "ccc123"; %>

</body>
</html>