<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.basic.Job"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	
	<h1>jstl fmt ���̺귯�� �ǽ� 1</h1>
	
	<c:set var="temp" value="abcdefg,ABCDEFGH,�츮����,<>" />
	<c:out value="${'abcdefg,ABCDEFGH,�츮����,<>'} }" /><br><br>
	\${fn:length(abcdefg,ABCDEFGH,�츮����,<>)} : ${fn:length(temp)} <br>
	\${fn:contains('abcdefg,ABCDEFGH,�츮����,<>','h')} : ${fn:contains(temp,'h')} <br>	
	\${fn:containsIgnoreCase('abcdefg,ABCDEFGH,�츮����,<>','h')} : ${fn:containsIgnoreCase(temp, 'h')} <br>
	\${fn:endsWith('abcdefg,ABCDEFGH,�츮����,<>','>')} : ${fn:endsWith(temp,'>')} <br>
	\${fn:indexOf('abcdefg,ABCDEFGH,�츮����,<>','<')} : ${fn:indexOf(temp,'<')} <br><br><br>
	
	\${fn:split('abcdefg,ABCDEFGH,�츮����,<>',',')} : ${fn:split(temp,',')} <br>
	
	<c:forEach var="arr" items="${fn:split(temp,',') }">
		<c:out value="${arr }" /><br>
	</c:forEach>
	
	
	<h1>jstl fmt ���̺귯�� �ǽ� 2</h1>
	
	<% String[] a = {"1","2","3","4","5"}; %>
	
	<c:set var="arr" value="<%=a %>" />
	\${fn:join(array, separator) } : <c:out value="${fn:join(arr,'-') }" /> <br> <br>
	
	\${fn:replace('abcdefg,ABCDEFGH,�츮����,<>','ABCDEFGH','--------')} : ${fn:replace('abcdefg,ABCDEFGH,�츮����,<>','ABCDEFGH','--------')} <br>
	
	\${fn:startsWith('abcdefg,ABCDEFGH,�츮����,<>','a')} : ${fn:startsWith(temp,'a')} <br>
	\${fn:substring('abcdefg,ABCDEFGH,�츮����,<>',0,2)} : ${fn:substring(temp,0,2)} <br>
	\${fn:substringAfter('abcdefg,ABCDEFGH,�츮����,<>','d')} : ${fn:substringAfter(temp,'d')} <br>
	\${fn:substringBefore('abcdefg,ABCDEFGH,�츮����,<>','d')} : ${fn:substringBefore(temp,'d')} <br>
	\${fn:toLowerCase('abcdefg,ABCDEFGH,�츮����,<>')} : ${fn:toLowerCase(temp)} <br>
	\${fn:toUpperCase('abcdefg,ABCDEFGH,�츮����,<>')} : ${fn:toUpperCase(temp)} <br>
	\${fn:trim('  abcdefg,ABCDEFGH,�츮����,<>  '} : ${fn:trim(temp) } <br>
	
	
</body>
</html>

