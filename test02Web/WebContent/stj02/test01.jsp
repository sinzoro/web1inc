<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Random" %>

<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	안녕하세요 철호님
	hello zoro
	
	<%="냠냠" %><br>
	<%
		
		//System.out.println("로그에 초기페이지접근 넘기기");
		out.write(" page1 ");
		String name = "zoro";
	%><br>
	<%=name %>
	<p>
	///
	<%
		String ranNum = request.getParameter("ranNum");
		System.out.println( "ranNum : "+ranNum );
		Random rd = null;
		int num = 0;
		if( ranNum == null || ranNum.equals("0") ){
			rd = new Random();
			num = rd.nextInt(30)+1;
		}else{
			num = Integer.parseInt(ranNum);
		}
		
		out.print("ranNum : "+ranNum+"<br>");
		out.print("num : " +num+"<br>");
	%>
	///
	<%
		
	%>
	/// random
	<table border=1>
	<tr>
		<td width="100">숫자</td>
		<td colspan='3' width="300" align="center"><%=num %></td>
	</tr>
	<tr>
	<%	for( int i=0; i<16; i++ ){	%>
		<td width="100"><%=(i<num?i+1:"&nbsp;") %></td>
		<%if( i%4 == 3 ){ %>
			</tr>
			<tr>
		<%}%>
	<%}%>
	</tr>
	<tr>
		<td colspan=4> <a href=test01.jsp?ranNum=0 >리로드</a> </td>
	</tr>
	</table>
	
	<p>
	<%-- /// calendar ()
	<%
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat();
		String fmt = "yy/MM/dd - hh:mm:ss";
		sdf.applyPattern(fmt);
		cal.setTime(date);
		int min = cal.getActualMaximum(cal.DAY_OF_MONTH);
		int max = cal.getActualMaximum(cal.DAY_OF_MONTH);
		//현재 달 출력
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1);
		int first = cal.get(cal.DAY_OF_WEEK);
		int tempNum = first-1;
		int num2 = cal.get(cal.MONTH)+1;
		//cal.setTime(date);
		
		///
		int sel = rd.nextInt(11)+1;
		cal.set(cal.get(Calendar.YEAR), sel+1, 1);
		first = cal.get(cal.DAY_OF_WEEK);
		tempNum = first-1;
		num2 = cal.get(cal.MONTH)+1;
		
	
	%>
	<table border=1>
	<tr>
		<td width="100">숫자</td>
		<td colspan='6' width="600" align="center"><%=num2 %>월 : (<%=sdf.format(date) %>)</td>
	</tr>
	<tr>
	<%	for( int i=0; i<max; i++ ){	%>

		<%if( tempNum != 0 ){%>
			<td width="100">&nbsp;</td>
		<%tempNum--;i=-1;}else{%>
			<td width="100"><%=(i<max?i+1:"&nbsp;") %></td>
		<%}%>
		
		<%if( i%7 == 7-first ){ %>
			</tr>
			<tr>
		<%}%>
		
	<%}%>
	</tr>
	</table> --%>
	
	<form action=submit1.jsp method="get">
		<input type="text" name="ranNum" value=<%=num %> >
		<input type="text" name="rest" value=<%=((16-num)>0?(16-num):0) %> >
		<input type="submit" value="go">
	</form>
	
</body>
</html>