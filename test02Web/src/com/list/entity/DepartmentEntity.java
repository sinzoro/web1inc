package com.list.entity;

import java.sql.Timestamp;

public class DepartmentEntity {
	
	int deptCode = 0;
	String deptName = null;
	String deptEname = null;
	Timestamp createDate = null;
	
	public int getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptEname() {
		return deptEname;
	}
	public void setDeptEname(String deptEname) {
		this.deptEname = deptEname;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	
	

}

