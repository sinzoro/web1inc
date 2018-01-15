package com.list10.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.ProfessorEntity;
import com.list.common.connection.ConnectDB;

public class ProfessorDao {

	public ArrayList getProfessorList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();
			
			sql = "SELECT PROF_CODE, PROF_NAME, PROF_ENAME, CREATE_DATE FROM PROFESSOR";
			rs = stmt.executeQuery(sql);
			
			System.out.println( sql );

			while( rs.next() ){
				ProfessorEntity pe = new ProfessorEntity();
				
				int cir_num = 0;
				String cir_name = null;
				String stu_no = null;
				String stu_name = null;
				String president = null;
				
				pe.setProfCode(rs.getString("PROF_CODE"));
				pe.setProfName(rs.getString("PROF_NAME"));
				pe.setProfEname(rs.getString("PROF_ENAME"));
				pe.setCreateDate(rs.getString("CREATE_DATE"));

				list.add(pe);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList

}
