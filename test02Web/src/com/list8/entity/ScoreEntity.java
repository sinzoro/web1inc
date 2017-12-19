package com.list8.entity;

import java.sql.Timestamp;

public class ScoreEntity {
	
	String stuNo = null;
	String scoYear = null;
	int scoTerm = 0;
	int reqPonumber = 0;
	int takePonumber = 0;
	float examAvg = 0f;
	int examTotal = 0;
	String scoDiv = null;
	Timestamp scoDate = null;
	
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getScoYear() {
		return scoYear;
	}
	public void setScoYear(String scoYear) {
		this.scoYear = scoYear;
	}
	public int getScoTerm() {
		return scoTerm;
	}
	public void setScoTerm(int scoTerm) {
		this.scoTerm = scoTerm;
	}
	public int getReqPonumber() {
		return reqPonumber;
	}
	public void setReqPonumber(int reqPonumber) {
		this.reqPonumber = reqPonumber;
	}
	public int getTakePonumber() {
		return takePonumber;
	}
	public void setTakePonumber(int takePonumber) {
		this.takePonumber = takePonumber;
	}
	public float getExamAvg() {
		return examAvg;
	}
	public void setExamAvg(float examAvg) {
		this.examAvg = examAvg;
	}
	public int getExamTotal() {
		return examTotal;
	}
	public void setExamTotal(int examTotal) {
		this.examTotal = examTotal;
	}
	public String getScoDiv() {
		return scoDiv;
	}
	public void setScoDiv(String scoDiv) {
		this.scoDiv = scoDiv;
	}
	public Timestamp getScoDate() {
		return scoDate;
	}
	public void setScoDate(Timestamp scoDate) {
		this.scoDate = scoDate;
	}
	
}

