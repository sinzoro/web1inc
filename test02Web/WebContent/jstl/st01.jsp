<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	session.setAttribute("test","testValue");
	request.setAttribute("xName","xNameValue");
	
	String abc = "1133";

%>

<h3>${sessionScope.test }</h3>
<h3>${requestScope.xName }</h3>
<h3>${param.name }</h3>
<h3>${paramValues.pets[1] }</h3>
-----
<c:out value="${abc}" />
${abc}

</body>
</html>