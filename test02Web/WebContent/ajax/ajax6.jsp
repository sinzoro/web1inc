<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.internal.LinkedTreeMap"%>


<%
	
	String key = request.getParameter("key");
	System.out.println( key );

	HashMap jsonData = new Gson().fromJson(key,HashMap.class);
	//System.out.println( jsonData );
	//System.out.println( "name:"+jsonData.get("employees") );
	
	ArrayList list = (ArrayList)jsonData.get("employees");
	
	System.out.println("employees 첫번째 name = "+((LinkedTreeMap)list.get(0)).get("name") );
	
	///
	Gson gson = new Gson();
	
	HashMap jsonMapData = new HashMap();
	jsonMapData.put("firstName","길동");
	jsonMapData.put("secondName","홍");
	
	//System.out.println("jsonMapData json으로 변환 : "+gson.toJson(jsonMapData));

	///
	ArrayList aList = new ArrayList();
	aList.add("firstName");
	aList.add("scondName");
	
	//System.out.println("aList json으로 변환 : "+gson.toJson(aList));
	
	jsonMapData.put("list",aList);
	
	//System.out.println("복합출력 : "+gson.toJson(jsonMapData));
	
	//System.out.println( key );

	System.out.println( "end" );

%>
	{"name":"<%=jsonData.get("name") %>"}



