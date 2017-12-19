<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="connectionData.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, userpw);
			stmt = con.createStatement();
			
			String sql = "SELECT PROF_CODE, PROF_NAME, PROF_ENAME, CREATE_DATE FROM PROFESSOR";
			
			rs = stmt.executeQuery(sql);
	%>
	
	<table border=1>
	<tr>
		<td width=200>교수번호</td>
		<td width=200>교수명</td>
		<td width=200>교수영문이름</td>
		<td width=200>교수임용날짜</td>
	</tr>
	<%
		String prof_code = null;
		String prof_name = null;
		String prof_ename = null;
		String create_date = null;
		
			while( rs.next() ){
				prof_code = rs.getString("PROF_CODE");
				prof_name = rs.getString("PROF_NAME");
				prof_ename = rs.getString("PROF_ENAME");
				create_date = rs.getString("CREATE_DATE");
	%>
	<tr>
		<td width=200><%=prof_code %></td>
		<td width=200><%=prof_name %></td>
		<td width=200><%=prof_ename %></td>
		<td width=200><%=create_date %></td>
	</tr>
	<%
			}
			
		}catch( Exception e ){
			e.printStackTrace();
		}finally{
			if( rs != null )rs.close();rs = null;
			if( stmt != null )stmt.close();stmt = null;
			if( con != null )con.close();con = null;
		}
	
	
	
	%>


	</table>



</body>
</html>