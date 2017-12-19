<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	System.out.println("ajax jsp log");
	System.out.println("num:"+request.getParameter("num"));
	System.out.println("name:"+request.getParameter("name"));


%>{"name":"<%=request.getParameterValues("name") %>"}
	



