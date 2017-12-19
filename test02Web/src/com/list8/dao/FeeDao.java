package com.list8.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.FeeEntity;
import com.list.common.connection.ConnectDB;

public class FeeDao {

	public ArrayList getFeeList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT STU_NO, FEE_YEAR, FEE_TERM, FEE_ENTER, FEE_PRICE, FEE_TOTAL, JANG_CODE, JANG_TOTAL, FEE_PAY, FEE_DIV, FEE_DATE FROM FEE ";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				FeeEntity fe = new FeeEntity();
				fe.setStuNo(rs.getString("STU_NO"));
				fe.setFeeYear(rs.getString("FEE_YEAR"));
				fe.setFeeTerm(rs.getInt("FEE_TERM"));
				fe.setFeeEnter(rs.getInt("FEE_ENTER"));
				fe.setFeePrice(rs.getInt("FEE_PRICE"));
				fe.setFeeTotal(rs.getInt("FEE_TOTAL"));
				fe.setJangCode(rs.getString("JANG_CODE"));
				fe.setJangTotal(rs.getInt("JANG_TOTAL"));
				fe.setFeePay(rs.getInt("FEE_PAY"));
				fe.setFeeDiv(rs.getString("FEE_DIV"));
				fe.setFeeDate(rs.getTimestamp("FEE_DATE"));

				list.add(fe);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList


}
