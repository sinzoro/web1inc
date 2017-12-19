<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.internal.LinkedTreeMap"%>


<%

	System.out.println("num="+request.getParameter("num"));
	System.out.println("name="+request.getParameter("name"));



%>{"name":"<%=request.getParameter("name") %>"}




