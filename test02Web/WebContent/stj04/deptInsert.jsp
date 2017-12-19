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
	
	String dept_code = request.getParameter("dept_code");
	dept_code = (dept_code==null?"10":dept_code);
	dept_code = (dept_code.equals("")?"10":dept_code);
	String dept_name = request.getParameter("dept_name");
	dept_name = (dept_name==null?"test":dept_name);
	dept_name = (dept_name.equals("")?"test":dept_name);
	String dept_ename = request.getParameter("dept_ename");
	dept_ename = (dept_ename==null?"test":dept_ename);
	dept_ename = (dept_ename.equals("")?"test":dept_ename);
	String Create_date = request.getParameter("Create_date");
	Create_date = (Create_date==null?"2017-10-25":Create_date);
	Create_date = (Create_date.equals("")?"2017-10-25":Create_date);
	String errMsg = request.getParameter("errMsg");
	errMsg = (errMsg==null?"noErr":errMsg);
	errMsg = (errMsg.equals("")?"noErr":errMsg);
	String errRs = request.getParameter("errRs");
	errRs = (errRs==null?"0":errRs);
	///
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName(driver);	// driver load
		con = DriverManager.getConnection( url, userid, userpw );
		stmt = con.createStatement();	//쿼리를 생성하기 위한 객체생성
		
		//System.out.println( "errRs : "+errRs );
		///
	
		String sql = "select dept_code from DEPARTMENT";
		rs = stmt.executeQuery(sql);
		
		String divStr = "";
		
		while( rs.next() ){
			divStr = rs.getString("dept_code");
			if( divStr.equals(dept_code) ){
				errRs = "-1";
				break;
			}
			errRs = "-2";
		}
		//System.out.println( "errRs2 : "+errRs );
		
		if( errRs.equals("-2") ){
			sql = "insert into DEPARTMENT( dept_code, dept_name, dept_ename, Create_date ) values("+dept_code+", '"+dept_name+"', '"+dept_ename+"', '"+Create_date+"')";	// 실행시 쿼리
			
			System.out.print(sql);
			
			stmt.executeUpdate(sql);	// 쿼리실행하며 데이터 저장
			
			
		}

		//System.out.println( "errRs : "+errRs );
		
		}catch( Exception e ){
			e.printStackTrace();
		}finally{
			if( rs != null )rs.close();rs=null;
			if( stmt != null )stmt.close();stmt=null;
			if( con != null )con.close();con=null;
			if( errRs.equals("-2") ){
				response.sendRedirect("./departmentList.jsp");
			}
			
		}
	
		
	
	%>

	<form action=./deptInsert.jsp method=get>
		<table border=1>
			<tr>
				<td width=200>errMsg</td>
				<td width=400><input type=text name=errMsg value=<%=errMsg %> ></td>
			</tr>
			<tr>
				<td>학과코드</td>
				<td><input type=text name=dept_code value=<%=dept_code %> ></td>
			</tr>
			<tr>
				<td>학과명</td>
				<td><input type=text name=dept_name value=<%=dept_name %> ></td>
			</tr>
			<tr>
				<td>학과영문명</td>
				<td><input type=text name=dept_ename value=<%=dept_ename %> ></td>
			</tr>
			<tr>
				<td>생성일자</td>
				<td><input type=text name=Create_date value=<%=Create_date %> ></td>
			</tr>
			<tr>
				<td colspan=2><input type=hidden name=errRs value=<%=errRs %>><input type=submit value=등록 ></td>
			</tr>
		</table>
	</form>
	
</body>
</html>