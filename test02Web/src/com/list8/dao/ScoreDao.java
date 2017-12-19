package com.list8.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.ScoreEntity;
import com.list.common.connection.ConnectDB;

public class ScoreDao {

	public ArrayList getScoreList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT STU_NO, SCO_YEAR, SCO_TERM, REQ_PONUMBER, TAKE_PONUMBER, EXAM_AVG, EXAM_TOTAL, SCO_DIV, SCO_DATE  FROM SCORE";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ScoreEntity se = new ScoreEntity();
				se.setStuNo(rs.getString("STU_NO"));
				se.setScoYear(rs.getString("SCO_YEAR"));
				se.setScoTerm(rs.getInt("SCO_TERM"));
				se.setReqPonumber(rs.getInt("REQ_PONUMBER"));
				se.setTakePonumber(rs.getInt("TAKE_PONUMBER"));
				se.setExamAvg(rs.getInt("EXAM_AVG"));
				se.setExamTotal(rs.getInt("EXAM_TOTAL"));
				se.setScoDiv(rs.getString("SCO_DIV"));
				se.setScoDate(rs.getTimestamp("SCO_DATE"));

				list.add(se);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList


}
