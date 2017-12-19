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
			<td width='200'>학번</td>
			<td width='200'>수강년도</td>
			<td width='200'>수강학기</td>
			<td width='200'>이수구분</td>
			<td width='200'>과목코드</td>
			<td width='200'>교수번호</td>
			<td width='200'>이수학점</td>
			<td width='200'>취득점수</td>
			<td width='200'>수강신청구분</td>
			<td width='200'>재수강구분</td>
			<td width='200'>수강처리일자</td>
		</tr>
		<%
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			
			Class.forName(driver);	// driver load
			con = DriverManager.getConnection( url, userid, userpw );
			
			stmt = con.createStatement();	//쿼리를 생성하기 위한 객체생성
			String sql = "SELECT STU_NO, ATT_YEAR, ATT_TERM, ATT_ISU, SUB_CODE, PROF_CODE, "
					+"ATT_PONUMBER, ATT_GRADE, ATT_DIV, ATT_JAE, ATT_DATE FROM ATTEND";	// 실행시 쿼리
			
			System.out.print(sql);
					
			rs = stmt.executeQuery(sql);	// 쿼리실행하며 데이터 저장
			
			
			String stu_no = null;
			String att_year = null;
			int att_term = 0;
			int att_isu = 0;
			String sub_code = null;
			String prof_code = null;
			int att_ponumber = 0;
			int att_grade = 0;
			String att_div = null;
			String att_jae = null;
			Timestamp att_date = null;
			
			while( rs.next() ){
				stu_no = rs.getString("STU_NO");
				att_year = rs.getString("ATT_YEAR");
				att_term = rs.getInt("ATT_TERM");
				att_isu = rs.getInt("ATT_ISU");
				sub_code = rs.getString("SUB_CODE");
				prof_code = rs.getString("PROF_CODE");
				att_ponumber = rs.getInt("ATT_PONUMBER");
				att_grade = rs.getInt("ATT_GRADE");
				att_div = rs.getString("ATT_DIV");
				att_jae = rs.getString("ATT_JAE");
				att_date = rs.getTimestamp("ATT_DATE");
			
			%>
			<tr>
				<td><%=stu_no %></td>
				<td><%=att_year %></td>
				<td><%=att_term %></td>
				<td><%=att_isu %></td>
				<td><%=sub_code %></td>
				<td><%=prof_code %></td>
				<td><%=att_ponumber %></td>
				<td><%=att_grade %></td>
				<td><%=att_div %></td>
				<td><%=att_jae %></td>
				<td><%=att_date %></td>
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