<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.internal.LinkedTreeMap"%>


<%
	
	String key = request.getParameter("key");

	HashMap jsonData = new Gson().fromJson(key,HashMap.class);
	System.out.println( jsonData );
	System.out.println( "name:"+jsonData.get("name") );
	
	ArrayList list = (ArrayList)jsonData.get("employees");
	
	System.out.println("employees 첫번째 name = "+((LinkedTreeMap)list.get(0)).get("name") );
	
	//System.out.println( key );


%>
	{"name":"<%=jsonData.get("name") %>"}



