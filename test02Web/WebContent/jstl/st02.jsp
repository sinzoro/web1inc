<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    //각각의 Object Scope에 객체를 저장하자..
    //1. page scope에 저장
    pageContext.setAttribute("name",new String("pageObject scope에 저장된 문자열"));
 
    //2.request scope에 저장
    request.setAttribute("name",new String("requestObject scope에 저장된 문자열"));
    
    //3.1 session scope에 빈(size() ==0인) Vector저장
    session.setAttribute("name",new Vector());
    
    //3.2 session scope에 값을 갖는 Vector 저장
    Vector v =new Vector();
    v.add(new String("session Object Scope의 Vector에 저장된 문자열"));
    session.setAttribute("name1",v);
    
    //3.3 Application Scope에 값을 갖는 Map저장
    HashMap hm = new HashMap();
    hm.put("a",new String("application Scope의 HashMap에 저장된 문자열"));
    application.setAttribute("name",hm);
%>
	<jsp:forward page="elScopeEnd.jsp"/>

</body>
</html>