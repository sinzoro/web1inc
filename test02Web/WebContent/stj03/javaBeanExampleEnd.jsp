<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	java ex)
	BeanExample01 beanExample01 = new beanExample01(); <br>
	
	
	<jsp:useBean id="beanExample01" class="com.beans.BeanExample01"></jsp:useBean>
	<%-- <jsp:setProperty property="id" name="beanExample01"/>
	<jsp:setProperty property="pw" name="beanExample01"/> --%>
	<jsp:setProperty property="*" name="beanExample01"/>
	
	id : <%=beanExample01.getId() %><br>
	id : <jsp:getProperty property="id" name="beanExample01"/><br>
	pw : <%=beanExample01.getPw() %><br>
	pw : <jsp:getProperty property="pw" name="beanExample01"/>
	
	
	

</body>
</html>