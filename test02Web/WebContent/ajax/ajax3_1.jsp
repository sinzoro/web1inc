<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("ajax jsp log");
	System.out.println("첫번째값 :" + request.getParameter("num"));
	System.out.println("두번째값 :" + request.getParameter("name"));
	
	System.out.println("cmd :" + request.getParameter("cmd"));
	
%>
{"num":"<%=request.getParameter("num") %>","name":"<%=request.getParameter("name") %>"}

