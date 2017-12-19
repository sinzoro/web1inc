<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.Random" %>    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String chkValue = request.getParameter("ranNum");
		int ranNum = 0;
	
		out.print(chkValue+"<br>");
		if( chkValue == null ){
			out.print("null"+"<br>");
			chkValue = "0";
		}else{
			out.print(chkValue+"<br>");
			Random rd = new Random();
			ranNum = rd.nextInt( Integer.parseInt(chkValue) )+1;
		}

	%>
	
	<form action="test01.jsp" method="get">
		<table border="1" >
		<tr>
			<td width="100">숫자2</td>
			<td colspan="3" width="300"><%=ranNum %></td>
		</tr>
		<tr>
		<%
			int max = ( (ranNum%4)==0?(ranNum):(ranNum/4+1)*4 );
		%>
		<% for( int i=0 ; i< max ; i++ ){ %>
			<%if( i < ranNum ){ %>
				<td width=100><%=i+1 %></td>
			<%}else{%>
				<td width=100>&nbsp;</td>
			<%}%>
			<% if( i%4 == 3 ){ %>
			</tr>
			<tr>
			<%} %>
		<%}%>
		</tr>
		<tr>
			<td colspan=4><input type=submit value=뒤로></td>
		</tr>
		</table>
		<input type="hidden" name=ranNum value=<%=chkValue %> >
	</form>
	
	
</body>
</html>