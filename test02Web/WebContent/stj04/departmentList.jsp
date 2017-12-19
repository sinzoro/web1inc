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

	<form action=./deptInsert.jsp method=get>
		<table border="1">
			<tr>
				<td colspan=5 align=right><input type=submit value=����ϱ� ></td>
			</tr>
			<tr>
				<td width='200'>�а���ȣ</td>
				<td width='200'>�а�������</td>
				<td width='200'>�а�������</td>
				<td width='200'>�а�������</td>
				<td width='200'>�л������󼼺���</td>
			</tr>
			<%
			
			
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
							
				Class.forName(driver);	// driver load
				con = DriverManager.getConnection( url, userid, userpw );
				
				stmt = con.createStatement();	//������ �����ϱ� ���� ��ü����
				String sql = "SELECT DEPT_CODE, DEPT_NAME, DEPT_ENAME, CREATE_DATE FROM DEPARTMENT";	// ����� ����
				
				rs = stmt.executeQuery(sql);	// ���������ϸ� ������ ����
				
				
				int deptCode = 0;
				String deptName = null;
				String deptEname = null;
				Timestamp createDate = null;
				
				while( rs.next() ){
					deptCode = rs.getInt("DEPT_CODE");
					deptName = rs.getString("DEPT_NAME");
					deptEname = rs.getString("DEPT_ENAME");
					createDate = rs.getTimestamp("CREATE_DATE");
				
				%>
				<tr>
					<td><%=deptCode %></td>
					<td><%=deptName %></td>
					<td><%=deptEname %></td>
					<td><%=createDate %></td>
					
					<%-- <td> <a href=./studentList.jsp?srch=<%=deptCode %> >�л�����</a> </td> --%> <%  %>	<!-- �ι�° ���� �ѱ��� �Ѿ�� �������� �ȶ�� �Ѿ������ �ʴ´� ����? -->
					<%-- <% String link = "./studentList.jsp?srch="+deptCode+"&subj="+ new String( deptName.getBytes("8859_1"), "euc-kr"); %> --%>
					<% String link = "./studentList.jsp?srch="+deptCode+"&subj="+ URLEncoder.encode(deptName, "UTF-8"); %>
					<td> <a href="<%=link%>" >�л�����</a> </td>
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
	</form>


</body>
</html>