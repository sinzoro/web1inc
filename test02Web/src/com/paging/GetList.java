package com.paging;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GetList {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userid = "scott";
	private String userpw = "tiger";

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	ArrayList<PagingData> pList = new ArrayList<PagingData>();
	PagingData pagingData = null;

	private void dbConnection() {
		try {
			Class.forName(driver); // driver load
			con = DriverManager.getConnection(url, userid, userpw);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}// dbConnection
	private void dbDisconnection() {
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
			e.printStackTrace();
		} // try 2
	}

	public ArrayList<PagingData> getListOnePageData(int startNum, int endNum) {

		try {
			dbConnection();
			stmt = con.createStatement(); 
			String sql = "SELECT NUM1 ,NUM_CODE ,NUM_DATA FROM"+ 
					"( SELECT ROWNUM AS NUM1, NUM ,NUM_CODE ,NUM_DATA FROM" + 
					"( SELECT ROWNUM AS NUM ,NUM_CODE ,NUM_DATA FROM BOARDTEST ) X" + 
					" WHERE NUM > "+startNum+" AND NUM <= "+endNum+" ) Y " + 
					" ORDER BY NUM_CODE DESC";

			rs = stmt.executeQuery(sql); 

			System.out.println( sql );

			String num = null;
			String num_code = null;
			String num_data = null;

			while (rs.next()) {
				num = rs.getString("NUM1");
				num_code = rs.getString("NUM_CODE");
				num_data = rs.getString("NUM_DATA");

				pagingData = new PagingData();
				pagingData.setNum(num);
				pagingData.setNum_code(num_code);
				pagingData.setNum_data(num_data);
				
				pList.add(pagingData);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		} // try 1
		
		return pList;
	}

	public int getAllcountNum2() {
		
		int allCont = 0;
		
		try {
			dbConnection();
			stmt = con.createStatement();
			String sql = "SELECT sum(count(num_code)) as count FROM BOARDTEST GROUP BY num_code";
			
			rs = stmt.executeQuery(sql);

			//System.out.println( sql );

			if (rs.next()) {
				allCont = Integer.parseInt( rs.getString("COUNT") );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnection();
		} // try 1
		
		return allCont;
	}
	
}
