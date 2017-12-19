package com.paging;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Random;

public class TestP {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "scott";
	String userpw = "tiger";

	public void connectP() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver); // driver load
			con = DriverManager.getConnection(url, userid, userpw);

			stmt = con.createStatement(); // 쿼리를 생성하기 위한 객체생성
			// String sql = "SELECT DEPT_CODE, DEPT_NAME, DEPT_ENAME, CREATE_DATE FROM
			// DEPARTMENT"; // 실행시 쿼리
			String sql = "SELECT sum(count(num_code)) as count FROM BOARDTEST GROUP BY num_code";

			rs = stmt.executeQuery(sql); 

			System.out.println( sql );

			rs = stmt.executeQuery(sql); // 쿼리실행하며 데이터 저장

			ResultSetMetaData resultMetaData = rs.getMetaData();
			//int sab = resultMetaData.getColumnCount();
			
			
			
//			Random rd = new Random();
//			for( int i=0; i<1000; i++ ) {
//				sql = "insert into BOARDTEST values("+i+",'"+(char)((rd.nextInt(60)+60))+i+(char)((rd.nextInt(60)+60))+"')";
//				stmt.executeUpdate(sql);
//			}
			

//			int deptCode = 0;
//			String deptName = null;
//			String deptEname = null;
//			Timestamp createDate = null;
//
//			while (rs.next()) {
//				deptCode = rs.getInt("DEPT_CODE");
//				deptName = rs.getString("DEPT_NAME");
//				deptEname = rs.getString("DEPT_ENAME");
//				createDate = rs.getTimestamp("CREATE_DATE");
//
//				System.out.println("deptCode : " + deptCode);
//				System.out.println("deptName : " + deptName);
//				System.out.println("deptEname : " + deptEname);
//				System.out.println("createDate : " + createDate);
//				System.out.println("sab : " + sab);
//
//			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				rs = null;
				if (stmt != null)
					stmt.close();
				stmt = null;
				if (con != null)
					con.close();
				con = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // try 2
		} // try 1
	}

	public static void main(String[] args) {
		TestP tp = new TestP();
		tp.connectP();
	}

}
