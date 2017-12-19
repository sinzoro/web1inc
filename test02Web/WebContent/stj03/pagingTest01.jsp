<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    

<%@ page import="com.paging.*" %>
<%@ page import="java.util.ArrayList" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>pagingTest01</title>
</head>
<body>

	<p>페이징 분리<p>
	
	<%
		String viewPage = request.getParameter("viewPage");
		viewPage = ( viewPage == null?"1":viewPage );
	
		String pagingPath = "./pagingTest01.jsp";
		ListPagingLogic listPagingLogic = new ListPagingLogic( viewPage, pagingPath );
		
	
	%>
	
	<form action=<%=pagingPath %> method=get >
		<table border=1>
		<tr>
			<td width=100 align="center">제목</td>
			<td colspan=2 width=400 align="center">내용</td>
		</tr>
		<% int allCount = listPagingLogic.getAllCount(); %>
		<% ArrayList<PagingData> pList = listPagingLogic.getList(); %>
		<% int listCount = pList.size(); %>
		<% for( int i=0 ; i< listCount; i++ ){ %>
			<tr>
				<td align="center"><%=i+1 %></td>
				<td align="center"><%=pList.get(i).getNum() %>___<%=pList.get(i).getNum_code()  %></td>
				<td align="center"><%=pList.get(i).getNum_data()  %></td>
			</tr>
		<%}%>
		<tr>
			<td><%=allCount %>&nbsp;</td>
			<td align="center"  colspan=2 ><%=listPagingLogic.getPaging() %></td>
		</tr>
		<tr>
			<td colspan=2 ></td>
			<td><inpt type=hidden name=viewPage value=<%=viewPage %>><input type=submit value=go></td>
		</tr>
		</table>
	</form>
	

</body>
</html>