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
			
			String sql = "select cir_num, cir_name, stu_no, stu_name, president from circle ";
			
			rs = stmt.executeQuery(sql);
				
	
	%>
		<table border=1>
		<tr>
			<td width=200>동아리가입번호</td>
			<td width=200>동아리명</td>
			<td width=200>학번</td>
			<td width=200>이름</td>
			<td width=200>동아리직책</td>
		</tr>
	<%
		int cir_num = 0;
		String cir_name = null;
		String stu_no = null;
		String stu_name = null;
		String president = null;
	%>
	<% while( rs.next() ){ %>
	<%
		cir_num = rs.getInt("CIR_NUM");
		cir_name = rs.getString("CIR_NAME");
		stu_no = rs.getString("STU_NO");
		stu_name = rs.getString("STU_NAME");
		president = rs.getString("PRESIDENT");
	%>
		<tr>
			<td width=200><%=cir_num %></td>
			<td width=200><%=cir_name %></td>
			<td width=200><%=stu_no %></td>
			<td width=200><%=stu_name %></td>
			<td width=200><%=president %></td>
		</tr>
	<% } %>
		</table>
	<%
		}catch( Exception e ){
			e.printStackTrace();
		}finally{
			if( rs != null )rs.close();rs = null;
			if( stmt != null )stmt.close();stmt = null;
			if( con != null )con.close();con = null;
			
		}
	
	%>



</body>
</html>