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
    //������ Object Scope�� ��ü�� ��������..
    //1. page scope�� ����
    pageContext.setAttribute("name",new String("pageObject scope�� ����� ���ڿ�"));
 
    //2.request scope�� ����
    request.setAttribute("name",new String("requestObject scope�� ����� ���ڿ�"));
    
    //3.1 session scope�� ��(size() ==0��) Vector����
    session.setAttribute("name",new Vector());
    
    //3.2 session scope�� ���� ���� Vector ����
    Vector v =new Vector();
    v.add(new String("session Object Scope�� Vector�� ����� ���ڿ�"));
    session.setAttribute("name1",v);
    
    //3.3 Application Scope�� ���� ���� Map����
    HashMap hm = new HashMap();
    hm.put("a",new String("application Scope�� HashMap�� ����� ���ڿ�"));
    application.setAttribute("name",hm);
%>
	<jsp:forward page="elScopeEnd.jsp"/>

</body>
</html>