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

	<table border="1">
		<tr>
			<td width='200'>�����ȣ</td>
			<td width='200'>���̸�</td>
			<td width='200'>�ּ�</td>
			<td width='200'>��ȭ������ȣ</td>
		</tr>
		<%
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			
						
			Class.forName(driver);	// driver load
			con = DriverManager.getConnection( url, userid, userpw );
			
			stmt = con.createStatement();	//������ �����ϱ� ���� ��ü����
			String sql = "SELECT POST_NO, POST_DONG, POST_ADDRESS, DDD FROM POST";	// ����� ����
			
			rs = stmt.executeQuery(sql);	// ���������ϸ� ������ ����
			
			
			String post_no = null;
			String post_dong = null;
			String post_address = null;
			String ddd = null;
			
			while( rs.next() ){
				post_no = rs.getString("POST_NO");
				post_dong = rs.getString("POST_DONG");
				post_address = rs.getString("POST_ADDRESS");
				ddd = rs.getString("DDD");
			
			%>
			<tr>
				<td><%=post_no %></td>
				<td><%=post_dong %></td>
				<td><%=post_address %></td>
				<td><%=ddd %></td>
			</tr>
			<%}
			}catch( Exception e ){
				e.printStackTrace();
			}finally{
				if( rs != null )rs.close();rs=null;
				if( stmt != null )stmt.close();stmt=null;
				if( con != null )con.close();con=null;
			}%>
		
		
	</table>



</body>
</html>