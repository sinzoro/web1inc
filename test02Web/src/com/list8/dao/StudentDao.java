package com.list8.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import com.list.entity.StudentEntity;
import com.list.common.connection.ConnectDB;


public class StudentDao {

	public ArrayList getStudentList(HashMap<String,String> SMap) {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();
			
			System.out.println( SMap.get("srch") );

			sql = " SELECT " + 
					"STU_NO, STU_NAME, D.DEPT_NAME, " + 
					"STU_ENAME, D.DEPT_CODE, " + 
					"GRADE, CLASS, " + 
					"JUYA, ID_NUM, " + 
					"POST_NO, ADDRESS, " + 
					"TEL, PHONE_NO, BIRTH_YEAR " + 
					"FROM STUDENT s, DEPARTMENT d " + 
					"WHERE s.DEPT_CODE = d.DEPT_CODE ";
			if( !SMap.get("srch").equals("") ) {
				sql += "AND D.DEPT_CODE="+SMap.get("srch");
			}
			rs = stmt.executeQuery(sql);

			System.out.println(sql);
			
			while (rs.next()) {
				StudentEntity se = new StudentEntity();
				se.setStuNo(rs.getString("STU_NO"));
				se.setStuName(rs.getString("STU_NAME"));
				se.setStuEname(rs.getString("STU_ENAME"));
				se.setDeptCode(rs.getString("DEPT_CODE"));
				se.setGrade(rs.getInt("GRADE"));
				se.setClass1(rs.getInt("CLASS"));
				se.setJuya(rs.getString("JUYA"));
				se.setIdNum(rs.getString("ID_NUM"));
				se.setPostNo(rs.getString("POST_NO"));
				se.setAddress(rs.getString("ADDRESS"));
				se.setTel(rs.getString("TEL"));
				se.setPhoneNo(rs.getString("PHONE_NO"));
				se.setBirthYear(rs.getString("BIRTH_YEAR"));
				se.setSubj(rs.getString("DEPT_NAME"));

				list.add(se);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList


}
