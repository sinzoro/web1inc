<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="common.jsp" %>
<%@ page import="com.list.entity.FeeEntity" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td width='200'>학번</td>
			<td width='200'>등록년도</td>
			<td width='200'>등록학기</td>
			<td width='200'>입학금</td>
			<td width='200'>등록금(수업료)</td>
			<td width='200'>등록금총액=입학금+수업료</td>
			<td width='200'>장학코드</td>
			<td width='200'>장학금액</td>
			<td width='200'>납부총액=등록금총액-장학금액</td>
			<td width='200'>등록구분</td>
			<td width='200'>등록날짜</td>
		</tr>
		<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){
		
%>
	<tr>
		<td><%=((FeeEntity)list.get(i)).getStuNo() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeeYear() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeeTerm() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeeEnter() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeePrice() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeeTotal() %></td>
		<td><%=((FeeEntity)list.get(i)).getJangCode() %></td>
		<td><%=((FeeEntity)list.get(i)).getJangTotal() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeePay() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeeDiv() %></td>
		<td><%=((FeeEntity)list.get(i)).getFeeDate() %></td>
	</tr>
<%	
	}
%>
	</table>



</body>
</html>