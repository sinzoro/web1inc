<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.internal.LinkedTreeMap"%>


<%

	String params = request.getParameter("params");
	System.out.println( params );

	///
	ArrayList<Object> list = new Gson().fromJson(params, ArrayList.class);
	String str = list.get(0).toString();
	System.out.println( str );
	
	System.out.println("params 첫번째  daughters = "+((LinkedTreeMap)list.get(0)).get("daughters") );
	String str2 = ((LinkedTreeMap)list.get(0)).get("daughters").toString();
	
	///
	ArrayList<Object> list2 = new Gson().fromJson(str2, ArrayList.class);
	String str3 = list.get(0).toString();
	System.out.println( str3 );
	
	System.out.println("params 첫번째  age = "+((LinkedTreeMap)list2.get(0)).get("age") );
	//String str4 = ((LinkedTreeMap)list.get(0)).get("age").toString();
	
	System.out.println("params 두번째  age = "+((LinkedTreeMap)list2.get(1)).get("age") );
	//String str5 = ((LinkedTreeMap)list.get(1)).get("age").toString();
	
	
	///
	System.out.println("end");
%>




