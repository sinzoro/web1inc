package com.list.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.list.entity.PostEntity;
import com.list.common.connection.ConnectDB;

public class PostDao {

	public ArrayList getPostList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList list = new ArrayList();

		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();

			sql = "SELECT POST_NO, POST_DONG, POST_ADDRESS, DDD FROM POST";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				PostEntity pe = new PostEntity();
				pe.setPostNo(rs.getString("POST_NO"));
				pe.setPostDong(rs.getString("POST_DONG"));
				pe.setPostAddress(rs.getString("POST_ADDRESS"));
				pe.setDdd(rs.getString("DDD"));
				
				list.add(pe);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}// getSampleList


}
