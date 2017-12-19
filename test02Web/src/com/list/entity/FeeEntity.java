package com.list.entity;

import java.sql.Timestamp;

public class FeeEntity {
	
	String stuNo = null;
	String feeYear = null;
	int feeTerm = 0;
	int feeEnter = 0;
	int feePrice = 0;
	int feeTotal = 0;
	String jangCode = null;
	int jangTotal = 0;
	int feePay = 0;
	String feeDiv = null;
	Timestamp feeDate = null;
	
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getFeeYear() {
		return feeYear;
	}
	public void setFeeYear(String feeYear) {
		this.feeYear = feeYear;
	}
	public int getFeeTerm() {
		return feeTerm;
	}
	public void setFeeTerm(int feeTerm) {
		this.feeTerm = feeTerm;
	}
	public int getFeeEnter() {
		return feeEnter;
	}
	public void setFeeEnter(int feeEnter) {
		this.feeEnter = feeEnter;
	}
	public int getFeePrice() {
		return feePrice;
	}
	public void setFeePrice(int feePrice) {
		this.feePrice = feePrice;
	}
	public int getFeeTotal() {
		return feeTotal;
	}
	public void setFeeTotal(int feeTotal) {
		this.feeTotal = feeTotal;
	}
	public String getJangCode() {
		return jangCode;
	}
	public void setJangCode(String jangCode) {
		this.jangCode = jangCode;
	}
	public int getJangTotal() {
		return jangTotal;
	}
	public void setJangTotal(int jangTotal) {
		this.jangTotal = jangTotal;
	}
	public int getFeePay() {
		return feePay;
	}
	public void setFeePay(int feePay) {
		this.feePay = feePay;
	}
	public String getFeeDiv() {
		return feeDiv;
	}
	public void setFeeDiv(String feeDiv) {
		this.feeDiv = feeDiv;
	}
	public Timestamp getFeeDate() {
		return feeDate;
	}
	public void setFeeDate(Timestamp feeDate) {
		this.feeDate = feeDate;
	}
	
}

