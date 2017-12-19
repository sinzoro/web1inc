<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>

<%
	
	Enumeration em = request.getParameterNames();
	
	while( em.hasMoreElements() ){
		
		String parameterName = (String)em.nextElement();
		String parameterValue = request.getParameter(parameterName);
		String[] parameterValues = request.getParameterValues(parameterName);
		
		if(parameterValues != null){
			for(int i=0; i<parameterValues.length; i++){
				System.out.println("array_"+parameterName+"-"+parameterValues[i]);
			}
		}else{
			System.out.println(parameterName+"-"+parameterValue);
		}
		
	}



%>
	{"name":"<%=request.getParameter("name")%>"}



