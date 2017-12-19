package com.sample.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.mvc.db.connection.IBatisDBConnector;
import com.sample.common.connection.ConnectDB;
import com.sample.entity.SampleEntity;


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
	/////////////////////
	public ArrayList<SampleEntity> getSampleListIBatis(SampleEntity sampleEntity) throws Exception{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<SampleEntity> list = new ArrayList<SampleEntity>();
		list = (ArrayList<SampleEntity>)(IBatisDBConnector.getSqlMapInstance()).queryForList("getDepartmentList", sampleEntity);
		//아이바티스 커넥션을 열고 getDepartmentList 커넥터 할거다
		return list;
	}
	public ArrayList<HashMap<String, Object>> getSampleListIBatis(HashMap<String, Object> hashmap) throws Exception{
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list = (ArrayList<HashMap<String, Object>>)(IBatisDBConnector.getSqlMapInstance()).queryForList("getDepartmentList", hashmap);
		//아이바티스 커넥션을 열고 getDepartmentList 커넥터 할거다
		return list;
	}
	public int SampleInsert(HashMap<String, String> map) throws Exception{
		int retVal=0;
		retVal = (Integer)IBatisDBConnector.getSqlMapInstance().update("sampleInsertEnd", map);
		return retVal; 
		
	}

}
