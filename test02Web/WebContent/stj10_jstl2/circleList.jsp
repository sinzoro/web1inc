<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="common.jsp" %>

<%@ page import="com.list.entity.CircleEntity" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

		<table border=1>
		<tr>
			<td width=200>���Ƹ����Թ�ȣ</td>
			<td width=200>���Ƹ���</td>
			<td width=200>�й�</td>
			<td width=200>�̸�</td>
			<td width=200>���Ƹ���å</td>
		</tr>
	<%
	ArrayList list = (ArrayList)request.getAttribute("list");
		
		System.out.println( list.size() );
	
	for(int i=0; i<list.size();i++){
		
		int cir_num = 0;
		String cir_name = null;
		String stu_no = null;
		String stu_name = null;
		String president = null;
		
%>
	<tr>
		<td><%=((CircleEntity)list.get(i)).getCirNum() %></td>
		<td><%=((CircleEntity)list.get(i)).getCirName() %></td>
		<td><%=((CircleEntity)list.get(i)).getStuNo() %></td>
		<td><%=((CircleEntity)list.get(i)).getStuName() %></td>
		<td><%=((CircleEntity)list.get(i)).getPresident() %></td>
	</tr>
<%	
	}
%>
	</table>



</body>
</html>