<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("ajax jsp log");
	System.out.println("첫번째값 :" + request.getParameterValues("sendData[]")[0]); //배열로받을거면 이것으로...
	System.out.println("두번째값 :" + request.getParameterValues("sendData[]")[1]); //배열로받을거면 이것으로...
	System.out.println("세번째값 :" + request.getParameterValues("sendData[]")[2]); //배열로받을거면 이것으로...

%>
{"name":"<%=request.getParameterValues("sendData[]")[0] %>"}


