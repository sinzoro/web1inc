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
			
			String sql = "SELECT SUB_CODE, SUB_NAME, SUB_ENAME, CREATE_YEAR FROM SUBJECT";
			
			rs = stmt.executeQuery(sql);
			
			String sub_code = null;
			String sub_name = null;
			String sub_ename = null;
			String create_year = null;
	%>
		


	<table border=1>
	<tr>
		<td>과목번호</td>
		<td>과목명</td>
		<td>영문과목명</td>
		<td>개설년도</td>
	</tr>
	
	<%
			while( rs.next() ){
				
				sub_code = rs.getString("SUB_CODE");
				sub_name = rs.getString("SUB_NAME");
				sub_ename = rs.getString("SUB_ENAME");
				create_year = rs.getString("CREATE_YEAR");
	%>
	<tr>
		<td><%=sub_code %></td>
		<td><%=sub_name %></td>
		<td><%=sub_ename %></td>
		<td><%=create_year %></td>
	</tr>
	<%		}
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