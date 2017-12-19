<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="" >

		
		<% String test = "sss"; %>
		<%@ include file="include1.jsp" %>
		<%=test1 %>
		<br>
		<br>
		<% String test3 = "abc123"; %>
		<jsp:include page="include2.jsp">
			<jsp:param value="<%=test3 %>" name="test3"/>
		</jsp:include>
		<%=test3 %>
		<br>
		<input type="hidden" name="testR" value="<%=test %>" >
		<input type="submit" value="다시">
	
	</form>
	
	

</body>
</html>