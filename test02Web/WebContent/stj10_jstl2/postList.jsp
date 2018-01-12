<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="common.jsp" %>
<%@ page import="com.list.entity.PostEntity" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td width='200'>우편번호</td>
			<td width='200'>동이름</td>
			<td width='200'>주소</td>
			<td width='200'>전화지역번호</td>
		</tr>
		<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){
		
		String postNo = null;
		String postDong = null;
		String postAddress = null;
		String ddd = null;
		
%>
	<tr>
		<td><%=((PostEntity)list.get(i)).getPostNo() %></td>
		<td><%=((PostEntity)list.get(i)).getPostDong() %></td>
		<td><%=((PostEntity)list.get(i)).getPostAddress() %></td>
		<td><%=((PostEntity)list.get(i)).getDdd() %></td>
	</tr>
<%	
	}
%>
	</table>



</body>
</html>