package com.list10.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.CircleEntity;
import com.list.common.connection.ConnectDB;

public class CircleDao {

	public ArrayList getCircleList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();
			
			sql = "SELECT CIR_NUM, CIR_NAME, STU_NO, STU_NAME, PRESIDENT FROM CIRCLE ";
			rs = stmt.executeQuery(sql);
			
			System.out.println( sql );

			while( rs.next() ){
				CircleEntity ce = new CircleEntity();
				
				int cir_num = 0;
				String cir_name = null;
				String stu_no = null;
				String stu_name = null;
				String president = null;
				
				ce.setCirNum(rs.getInt("CIR_NUM"));
				ce.setCirName(rs.getString("CIR_NAME"));
				ce.setStuNo(rs.getString("STU_NO"));
				ce.setStuName(rs.getString("STU_NAME"));
				ce.setPresident(rs.getString("PRESIDENT"));

				list.add(ce);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList

}
