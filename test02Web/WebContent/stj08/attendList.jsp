<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="common.jsp" %>
<%@ page import="com.list.entity.AttendEntity" %>

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
			<td width='200'>�����⵵</td>
			<td width='200'>�����б�</td>
			<td width='200'>�̼�����</td>
			<td width='200'>�����ڵ�</td>
			<td width='200'>������ȣ</td>
			<td width='200'>�̼�����</td>
			<td width='200'>�������</td>
			<td width='200'>������û����</td>
			<td width='200'>���������</td>
			<td width='200'>����ó������</td>
		</tr>
		<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){
		
		String stu_no = null;
		String att_year = null;
		int att_term = 0;
		int att_isu = 0;
		String sub_code = null;
		String prof_code = null;
		int att_ponumber = 0;
		int att_grade = 0;
		String att_div = null;
		String att_jae = null;
		Timestamp att_date = null;
		
%>
	<tr>
		<td><%=((AttendEntity)list.get(i)).getStuNo() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttYear() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttTerm() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttIsu() %></td>
		<td><%=((AttendEntity)list.get(i)).getSubCode() %></td>
		<td><%=((AttendEntity)list.get(i)).getProfCode() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttPonumber() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttGrade() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttDiv() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttJae() %></td>
		<td><%=((AttendEntity)list.get(i)).getAttDate() %></td>
	</tr>
<%	
	}
%>
		
		
	</table>



</body>
</html>