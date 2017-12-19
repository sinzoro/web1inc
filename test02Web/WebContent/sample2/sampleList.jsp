<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sample.entity.SampleEntity" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>
				학급코드
			</td>
			<td>
				학과명
			</td>
		</tr>

<%
	ArrayList list = (ArrayList)request.getAttribute("list");
	
	for(int i=0; i<list.size();i++){
%>
	<tr>
		<td><%=((SampleEntity)list.get(i)).getDeptCode() %></td>
		<td><%=((SampleEntity)list.get(i)).getDeptName() %></td>
	</tr>
<%	
	}
%>
	
	</table>


</body>
</html>