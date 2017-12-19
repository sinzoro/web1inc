package com.list.entity;

import java.sql.Timestamp;

public class AttendEntity {

	String stuNo = null;
	String attYear = null;
	int attTerm = 0;
	int attIsu = 0;
	String subCode = null;
	String profCode = null;
	int attPonumber = 0;
	int attGrade = 0;
	String attDiv = null;
	String attJae = null;
	Timestamp attDate = null;
	
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getAttYear() {
		return attYear;
	}
	public void setAttYear(String attYear) {
		this.attYear = attYear;
	}
	public int getAttTerm() {
		return attTerm;
	}
	public void setAttTerm(int attTerm) {
		this.attTerm = attTerm;
	}
	public int getAttIsu() {
		return attIsu;
	}
	public void setAttIsu(int attIsu) {
		this.attIsu = attIsu;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getProfCode() {
		return profCode;
	}
	public void setProfCode(String profCode) {
		this.profCode = profCode;
	}
	public int getAttPonumber() {
		return attPonumber;
	}
	public void setAttPonumber(int attPonumber) {
		this.attPonumber = attPonumber;
	}
	public int getAttGrade() {
		return attGrade;
	}
	public void setAttGrade(int attGrade) {
		this.attGrade = attGrade;
	}
	public String getAttDiv() {
		return attDiv;
	}
	public void setAttDiv(String attDiv) {
		this.attDiv = attDiv;
	}
	public String getAttJae() {
		return attJae;
	}
	public void setAttJae(String attJae) {
		this.attJae = attJae;
	}
	public Timestamp getAttDate() {
		return attDate;
	}
	public void setAttDate(Timestamp attDate) {
		this.attDate = attDate;
	}
	
}

