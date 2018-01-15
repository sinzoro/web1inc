package com.list10.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.SubjectEntity;
import com.list.common.connection.ConnectDB;

public class SubjectDao {

	public ArrayList getSubjectList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT SUB_CODE, SUB_NAME, SUB_ENAME, CREATE_YEAR FROM SUBJECT";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				SubjectEntity se = new SubjectEntity();
				se.setSubCode(rs.getString("SUB_CODE"));
				se.setSubName(rs.getString("SUB_NAME"));
				se.setSubEname(rs.getString("SUB_ENAME"));
				se.setCreateYear(rs.getString("CREATE_YEAR"));

				list.add(se);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList

}
