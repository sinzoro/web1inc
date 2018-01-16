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

		int rsNum = 0;
		String divStr = "";
		String srchDeptCode = dMap.get("deptCode");
		ArrayList<DepartmentEntity> list = new ArrayList<DepartmentEntity>();
		DepartmentEntity departmentEntity = new DepartmentEntity();
		
		try {
			
			list = (ArrayList<DepartmentEntity>)(IBatisDBConnector.getSqlMapInstance()).queryForList("getDepartmentDeptCodeList", departmentEntity);

			for(int i=0;i<list.size();i++ ) {
				divStr = list.get(i).getDeptCode()+"";
				if( srchDeptCode.equals(divStr) ) {
					rsNum = -1;
					break;
				}
				rsNum = -2;
			}
			
			if ( rsNum==-2 ) {
				rsNum = (Integer)(IBatisDBConnector.getSqlMapInstance()).update("insertDepartment",dMap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return 0;//rsNum;

	} // setDepartmentInsert

	
}
