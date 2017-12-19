<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file="connectionData.jsp" %>

<%@ page import="java.sql.PreparedStatement" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td width='200'>�й�</td>
			<td width='200'>��ϳ⵵</td>
			<td width='200'>����б�</td>
			<td width='200'>���б�</td>
			<td width='200'>��ϱ�(������)</td>
			<td width='200'>��ϱ��Ѿ�=���б�+������</td>
			<td width='200'>�����ڵ�</td>
			<td width='200'>���бݾ�</td>
			<td width='200'>�����Ѿ�=��ϱ��Ѿ�-���бݾ�</td>
			<td width='200'>��ϱ���</td>
			<td width='200'>��ϳ�¥</td>
		</tr>
		<%
		
		Connection con = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
						
			Class.forName(driver);	// driver load
			con = DriverManager.getConnection( url, userid, userpw );
			
			
			String sql = "SELECT stu_no, fee_year, fee_term, fee_enter, fee_price, fee_total, "
					+"jang_code, jang_total, fee_pay, fee_div, fee_date FROM fee where fee_pay >= ?";	// ����� ����
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 10000);
			
			System.out.println(sql);
			
			rs = pstmt.executeQuery();	// ���������ϸ� ������ ����
			
			
			String stu_no = null;
			String fee_year = null;
			int fee_term = 0;
			int fee_enter = 0;
			int fee_price = 0;
			int fee_total = 0;
			String jang_code = null;
			int jang_total = 0;
			int fee_pay = 0;
			String fee_div = null;
			Timestamp fee_date = null;
			
			
			while( rs.next() ){
				stu_no = rs.getString("STU_NO");
				fee_year = rs.getString("FEE_YEAR");
				fee_term = rs.getInt("FEE_TERM");
				fee_enter = rs.getInt("FEE_ENTER");
				fee_price = rs.getInt("FEE_PRICE");
				fee_total = rs.getInt("FEE_TOTAL");
				jang_code = rs.getString("JANG_CODE");
				jang_total = rs.getInt("JANG_TOTAL");
				fee_pay = rs.getInt("FEE_PAY");
				fee_div = rs.getString("FEE_DIV");
				fee_date = rs.getTimestamp("FEE_DATE");
			
			%>
			<tr>
				<td><%=stu_no %></td>
				<td><%=fee_year %></td>
				<td><%=fee_term %></td>
				<td><%=fee_enter %></td>
				<td><%=fee_price %></td>
				<td><%=fee_total %></td>
				<td><%=jang_code %></td>
				<td><%=jang_total %></td>
				<td><%=fee_pay %></td>
				<td><%=fee_div %></td>
				<td><%=fee_date %></td>
			</tr>
			<%}
			}catch( Exception e ){
				e.printStackTrace();
			}finally{
				if( rs != null )rs.close();rs=null;
				if( pstmt != null )pstmt.close();pstmt=null;
				if( con != null )con.close();con=null;
			}%>
		
		
	</table>



</body>
</html>