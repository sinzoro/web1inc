package com.servletEx.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.servletEx.common.connection.ConnectDB;
import com.servletEx.entity.sample.SampleEntity;

public class SampleDao {

	public ArrayList getSampleList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT DEPT_CODE AS deptCode, DEPT_NAME AS deptName FROM DEPARTMENT";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				SampleEntity se = new SampleEntity();
				se.setDeptCode(rs.getString("deptCode"));
				se.setDeptName(rs.getString("deptName"));

				list.add(se);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList

	public ArrayList getSampleListOne(SampleEntity sampleEntity) {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT DEPT_CODE AS deptCode, DEPT_NAME AS deptName FROM DEPARTMENT WHERE DEPT_CODE ="
					+ sampleEntity.getDeptCode();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				SampleEntity se = new SampleEntity();
				se.setDeptCode(rs.getString("deptCode"));
				se.setDeptName(rs.getString("deptName"));

				list.add(se);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleListOne1
	
	public ArrayList getSampleListOne(HashMap codeMap) {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT DEPT_CODE AS deptCode, DEPT_NAME AS deptName FROM DEPARTMENT WHERE DEPT_CODE ="
					+ codeMap.get("deptCode");
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				SampleEntity se = new SampleEntity();
				se.setDeptCode(rs.getString("deptCode"));
				se.setDeptName(rs.getString("deptName"));

				list.add(se);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleListOne2

}
