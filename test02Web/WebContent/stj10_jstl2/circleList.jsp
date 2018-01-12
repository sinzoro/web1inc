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
			<td width=200>동아리가입번호</td>
			<td width=200>동아리명</td>
			<td width=200>학번</td>
			<td width=200>이름</td>
			<td width=200>동아리직책</td>
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