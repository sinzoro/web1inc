<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="common.jsp" %>
<%@ page import="com.list.entity.ScoreEntity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td width='200'>�й�</td>
			<td width='200'>�������⵵</td>
			<td width='200'>�б�</td>
			<td width='200'>��û����</td>
			<td width='200'>�������</td>
			<td width='200'>�������</td>
			<td width='200'>��з� ����</td>
			<td width='200'>��������</td>
			<td width='200'>����ó������</td>
		</tr>
		<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){

%>
	<tr>
		<td><%=((ScoreEntity)list.get(i)).getStuNo() %></td>
		<td><%=((ScoreEntity)list.get(i)).getScoYear() %></td>
		<td><%=((ScoreEntity)list.get(i)).getScoTerm() %></td>
		<td><%=((ScoreEntity)list.get(i)).getReqPonumber() %></td>
		<td><%=((ScoreEntity)list.get(i)).getTakePonumber() %></td>
		<td><%=((ScoreEntity)list.get(i)).getExamAvg() %></td>
		<td><%=((ScoreEntity)list.get(i)).getExamTotal() %></td>
		<td><%=((ScoreEntity)list.get(i)).getScoDiv() %></td>
		<td><%=((ScoreEntity)list.get(i)).getScoDate() %></td>
	</tr>
<%	
	}
%>
	</table>



</body>
</html>