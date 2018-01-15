package com.list10.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.AttendEntity;
import com.list.common.connection.ConnectDB;

public class AttendDao {

	public ArrayList getAttendList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();
			
			sql = "SELECT STU_NO, ATT_YEAR, ATT_TERM, ATT_ISU, SUB_CODE, PROF_CODE, " 
					+" ATT_PONUMBER, ATT_GRADE, ATT_DIV, ATT_JAE, ATT_DATE FROM ATTEND";
			rs = stmt.executeQuery(sql);
			
			System.out.println( sql );

			while( rs.next() ){
				AttendEntity ae = new AttendEntity();
				
				ae.setStuNo(rs.getString("STU_NO"));
				ae.setAttYear(rs.getString("ATT_YEAR"));
				ae.setAttTerm(rs.getInt("ATT_TERM"));
				ae.setAttIsu(rs.getInt("ATT_ISU"));
				ae.setSubCode(rs.getString("SUB_CODE"));
				ae.setProfCode(rs.getString("PROF_CODE"));
				ae.setAttPonumber(rs.getInt("ATT_PONUMBER"));
				ae.setAttGrade(rs.getInt("ATT_GRADE"));
				ae.setAttDiv(rs.getString("ATT_DIV"));
				ae.setAttJae(rs.getString("ATT_JAE"));
				ae.setAttDate(rs.getTimestamp("ATT_DATE"));

				list.add(ae);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList


}
