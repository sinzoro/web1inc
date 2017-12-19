<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="common.jsp" %>
<%@ page import="com.list.entity.ProfessorEntity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table border=1>
	<tr>
		<td width=200>교수번호</td>
		<td width=200>교수명</td>
		<td width=200>교수영문이름</td>
		<td width=200>교수임용날짜</td>
	</tr>
	<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){
		
%>
	<tr>
		<td><%=((ProfessorEntity)list.get(i)).getProfCode() %></td>
		<td><%=((ProfessorEntity)list.get(i)).getProfName() %></td>
		<td><%=((ProfessorEntity)list.get(i)).getProfEname() %></td>
		<td><%=((ProfessorEntity)list.get(i)).getCreateDate() %></td>
	</tr>
<%	
	}
%>
	</table>



</body>
</html>