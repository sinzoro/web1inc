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

	<form action=./studentList.jsp method=get>
		<table border="1">
			<tr>
				<td width='200'>�а�</td>
				<td width='200'>�й�</td>
				<td width='200'>�л��̸�</td>
				<td width='300'>�����̸�</td>
				<td width='200'>�а��ڵ�</td>
				<td width='200'>�г�</td>
				<td width='200'>��</td>
				<td width='200'>�־߱���</td>
				<td width='200'>�ֹε�Ϲ�ȣ</td>
				<td width='200'>�����ȣ</td>
				<td width='200'>�ּ�</td>
				<td width='200'>��ȭ��ȣ</td>
				<td width='200'>�޴���ȭ��ȣ</td>
				<td width='200'>����⵵</td>
			</tr>
			<%
			
			String srch = request.getParameter("srch");
			if( srch == null )srch = "10";
			String subj = request.getParameter("subj");
			if( subj == null )subj = "nosubj";
			System.out.println("subj:" + subj);
			//String subj = "";
			
			subj = URLDecoder.decode(subj, "UTF-8"); 

			
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, userpw);
				stmt = con.createStatement();
				
				String sql = "SELECT STU_NO, STU_NAME, STU_ENAME, DEPT_CODE, GRADE, CLASS, JUYA, ID_NUM,"
						+ "POST_NO, ADDRESS, TEL, PHONE_NO, BIRTH_YEAR FROM STUDENT WHERE DEPT_CODE = "+srch;
				
				System.out.print(sql);
				
				/* String sql2 = "SELECT DEPT_NAME FROM DEPARTMENT WHERE DEPT_CODE = "+srch;
				
				System.out.print(sql2); */
				
				/* rs = stmt.executeQuery(sql2);
				
				while( rs.next() ){
					subj = rs.getString("DEPT_NAME");
				} */
				
				rs = stmt.executeQuery(sql);
				
				String stu_no = null;
				String stu_name = null;
				String stu_ename = null;
				String dept_code = null;
				int grade = 0;
				int class1 = 0;
				String juya = null;
				String id_num = null;
				String post_no = null;
				String address = null;
				String tel = null;
				String phone_no = null;
				String birth_year = null;
				
				while( rs.next() ){
					stu_no = rs.getString("STU_NO");
					stu_name = rs.getString("STU_NAME");
					stu_ename = rs.getString("STU_ENAME");
					dept_code = rs.getString("DEPT_CODE");
					grade = rs.getInt("GRADE");
					class1 = rs.getInt("CLASS");
					juya = rs.getString("JUYA");
					id_num = rs.getString("ID_NUM");
					post_no = rs.getString("POST_NO");
					address = rs.getString("ADDRESS");
					tel = rs.getString("TEL");
					phone_no = rs.getString("PHONE_NO");
					birth_year = rs.getString("BIRTH_YEAR");
				%>
				<tr>
					<td width='200'><%=subj %></td>
					<td width='200'><%=stu_no %></td>
					<td width='200'><%=stu_name %></td>
					<td width='300'><%=stu_ename %></td>
					<td width='200'><%=dept_code %></td>
					<td width='200'><%=grade %></td>
					<td width='200'><%=class1 %></td>
					<td width='200'><%=juya %></td>
					<td width='200'><%=id_num %></td>
					<td width='200'><%=post_no %></td>
					<td width='200'><%=address %></td>
					<td width='200'><%=tel %></td>
					<td width='200'><%=phone_no %></td>
					<td width='200'><%=birth_year %></td>
				</tr>
				<%}
				
				}catch( Exception e ){
					e.printStackTrace();
				}finally{
					if(rs != null)rs.close();rs = null;
					if(stmt != null)stmt.close();stmt = null;
					if(con != null)con.close();con = null;
				}
				%>
			<tr>
				<td colspan=10> 10=��ȣ�а� 20=�濵�а� 30=�����а� 40=��ǻ�������а� 50=��������а� 60=ȸ���а� 70=�����а� 80=�����а�                          
				</td>
				
				<td colspan=2><input type=text name=srch value=<%=srch %> ><input type=hidden name=subj  ></td>
				<td colspan=1><input type=submit value='�˻�'></td>
			</tr>
		</table>
	</form>


</body>
</html>