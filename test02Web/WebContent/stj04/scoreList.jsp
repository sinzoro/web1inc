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
			<td width='200'>성적취득년도</td>
			<td width='200'>학기</td>
			<td width='200'>신청학점</td>
			<td width='200'>취득학점</td>
			<td width='200'>평점평균</td>
			<td width='200'>백분률 총점</td>
			<td width='200'>성적구분</td>
			<td width='200'>성적처리일자</td>
		</tr>
		<%
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
						
			Class.forName(driver);	// driver load
			con = DriverManager.getConnection( url, userid, userpw );
			
			stmt = con.createStatement();	//쿼리를 생성하기 위한 객체생성
			
			String sql = "SELECT STU_NO, SCO_YEAR, SCO_TERM, REQ_PONUMBER, TAKE_PONUMBER, "
					+"EXAM_AVG, EXAM_TOTAL, SCO_DIV, SCO_DATE  FROM SCORE";

			
			
			System.out.println(sql);
					
			rs = stmt.executeQuery(sql);	// 쿼리실행하며 데이터 저장
			
			
			String stu_no = null;
			String sco_year = null;
			int sco_term = 0;
			int req_ponumber = 0;
			int take_ponumber = 0;
			float exam_avg = 0f;
			int exam_total = 0;
			String sco_div = null;
			Timestamp sco_date = null;
			
			
			while( rs.next() ){
				stu_no = rs.getString("STU_NO");
				sco_year = rs.getString("SCO_YEAR");
				sco_term = rs.getInt("SCO_TERM");
				req_ponumber = rs.getInt("REQ_PONUMBER");
				take_ponumber = rs.getInt("TAKE_PONUMBER");
				exam_avg = rs.getFloat("EXAM_AVG");
				exam_total = rs.getInt("EXAM_TOTAL");
				sco_div = rs.getString("SCO_DIV");
				sco_date = rs.getTimestamp("SCO_DATE");
			
			%>
			<tr>
				<td><%=stu_no %></td>
				<td><%=sco_year %></td>
				<td><%=sco_term %></td>
				<td><%=req_ponumber %></td>
				<td><%=take_ponumber %></td>
				<td><%=exam_avg %></td>
				<td><%=exam_total %></td>
				<td><%=sco_div %></td>
				<td><%=sco_date %></td>
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