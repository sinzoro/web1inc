<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="common.jsp" %>

<%@ page import="com.list.entity.SubjectEntity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	
	<table border=1>
	<tr>
		<td>과목번호</td>
		<td>과목명</td>
		<td>영문과목명</td>
		<td>개설년도</td>
	</tr>
	
	<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){
		
%>
	<tr>
		<td><%=((SubjectEntity)list.get(i)).getSubCode() %></td>
		<td><%=((SubjectEntity)list.get(i)).getSubName() %></td>
		<td><%=((SubjectEntity)list.get(i)).getSubEname() %></td>
		<td><%=((SubjectEntity)list.get(i)).getCreateYear() %></td>
	</tr>
<%	
	}
%>
	</table>

</body>
</html>