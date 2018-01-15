package com.list10.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import com.list.entity.DepartmentEntity;
import com.mvc.db.connection.IBatisDBConnector;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.list.common.connection.ConnectDB;

public class DepartmentDao {

	public ArrayList getDepartmentList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT DEPT_CODE AS DEPTCODE, DEPT_NAME AS DEPTNAME, DEPT_ENAME AS DEPTENAME, CREATE_DATE AS CREATEDATE FROM DEPARTMENT";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				DepartmentEntity de = new DepartmentEntity();
				de.setDeptCode(rs.getInt("DEPTCODE"));
				de.setDeptName(rs.getString("DEPTNAME"));
				de.setDeptEname(rs.getString("DEPTENAME"));
				de.setCreateDate(rs.getTimestamp("CREATEDATE"));

				list.add(de);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getDepartmentList
	
	public ArrayList getDepartmentIbatisList() {

		ArrayList list = new ArrayList();
		DepartmentEntity departmentEntity = new DepartmentEntity();

		try {
			
			list = (ArrayList<DepartmentEntity>)(IBatisDBConnector.getSqlMapInstance()).queryForList("getDepartmentList", departmentEntity);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getDepartmentList

	public int setDepartmentInsert(HashMap<String, String> dMap) {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		String deptCode = dMap.get("deptCode");
		String deptName = dMap.get("deptName");
		String deptEname = dMap.get("deptEname");
		int rsNum = 0;
		
		
		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT DEPT_CODE AS DEPTCODE FROM DEPARTMENT";
			rs = stmt.executeQuery(sql);

			String divStr = "";

			while (rs.next()) {
				divStr = rs.getString("deptCode");
				if (divStr.equals(deptCode)) {
					rsNum = -1;
					break;
				}
				rsNum = -2;
			}
			// System.out.println( "errRs2 : "+errRs );

			if ( rsNum==-2 ) {
				sql = "insert into DEPARTMENT( dept_code, dept_name, dept_ename, Create_date ) values(" + deptCode
						+ ", '" + deptName + "', '" + deptEname + "', sysdate )"; // 실행시 쿼리

				System.out.println(sql);

				rsNum = stmt.executeUpdate(sql); // 쿼리실행하며 데이터 저장

			}
			
			// System.out.println( "errRs : "+errRs );

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return rsNum;

	} // setDepartmentInsert

	
}
