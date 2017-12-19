package com.board07.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import com.board.data.BoardData;
import com.board07.entity.BoardEntity;
import com.board07.entity.BoardFileEntity;
import com.servletEx.common.connection.ConnectDB;

public class BoardDao {

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";
	ArrayList<BoardEntity> boardList = new ArrayList<BoardEntity>();

	public void getConnection() {
		//
		try {
			con = ConnectDB.getConnection();
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void ConnectionClose() {
		//
		try {
			if( rs != null ) {
				rs.close();
			}
			if( stmt != null ) {
				stmt.close();
			}
			if( con != null ) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardEntity> getList(HashMap<String, String> listMap) {

		try {
			getConnection();
			//System.out.println("search_word:" + listMap.get("search_word"));
			
  			sql = " SELECT X2.NUM, BOARD_NUM, BOARD_TITLE, BOARD_CONTENT, BOARD_CLICK_CNT, CREATE_DATE FROM "
					+ " ( SELECT rownum as num, X.BOARD_NUM, X.BOARD_TITLE, X.BOARD_CONTENT, X.BOARD_CLICK_CNT, X.CREATE_DATE FROM ( "
  					+ " SELECT BOARD_NUM,BOARD_TITLE,BOARD_CONTENT,BOARD_CLICK_CNT,CREATE_DATE FROM BOARD "
					+ " WHERE DEL_YN = 'Y'  and " + listMap.get("field") + " like '%" + listMap.get("search_word")
					+ "%' order by BOARD_NUM asc ) X ) x2  WHERE NUM > " + listMap.get("startNum") + " AND NUM <= " + listMap.get("endNum") + "  order by NUM desc ";

			rs = stmt.executeQuery(sql);

			System.out.println(sql);

			int num = 0;
			int board_num = 0;
			String board_title = null;
			String board_content = null;
			int board_click_cnt = 0;
			String create_date = null;

			while (rs.next()) {
				num = rs.getInt("NUM");
				board_num = rs.getInt("BOARD_NUM");
				board_title = rs.getString("BOARD_TITLE");
				board_content = rs.getString("BOARD_CONTENT");
				board_click_cnt = rs.getInt("BOARD_CLICK_CNT");
				create_date = rs.getString("CREATE_DATE");

				BoardEntity boardEntity = new BoardEntity();
				boardEntity.setNum(num);
				boardEntity.setBoardNum(board_num);
				boardEntity.setBoardTitle(board_title);
				boardEntity.setBoardContent(board_content);
				boardEntity.setBoardClickCnt(board_click_cnt);
				boardEntity.setCreateDate(create_date);

				boardList.add(boardEntity);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1

		return boardList;
	}

	public int getAllcountNum(HashMap<String, String> countMap) {

		int allCont = 0;
		try {
			getConnection();

			String field = countMap.get("field");
			String search_word = countMap.get("search_word");

			//System.out.println("field:" + field);
			//System.out.println("search_word:" + search_word);

			if (search_word == null) {
				search_word = "";
			}

			String sql = "SELECT nvl(sum(count(board_num)),0) as count FROM BOARD  WHERE DEL_YN = 'Y'  and " + field
					+ " like '%" + search_word + "%'   GROUP BY board_num";

			rs = stmt.executeQuery(sql);

			System.out.println(sql);

			if (rs.next()) {
				allCont = Integer.parseInt(rs.getString("COUNT"));
			}
			System.out.println(allCont);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1

		return allCont;
	}

	public int setDataInsert(HashMap<String, String> insertMap) {

		int rsNum = 0; // 결과반환값
		int rsMaxNum = 0; // 최고값
		try {
			getConnection();

			String sql = "SELECT NVL(MAX(BOARD_NUM),0) AS MAXCOUNT FROM BOARD";
			System.out.println(sql);

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				rsMaxNum = rs.getInt("maxCount") + 1;
			}

			sql = "INSERT INTO BOARD(board_num, board_title, board_name, board_content, create_date)" + " VALUES( "
					+ rsMaxNum + ",'" + insertMap.get("title") + "','" + insertMap.get("name") + "','"
					+ insertMap.get("content") + "', to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') )";
			System.out.println(sql);

			rsNum = stmt.executeUpdate(sql);
			
			if(rsNum != 1) rsMaxNum = 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1

		return rsMaxNum;
	}

	public BoardEntity getDataPostPage(String selNum) {

		BoardEntity boardEntity = new BoardEntity();

		try {
			getConnection();

			String sql = "select board_title, board_name, board_content, create_date " + "from board where board_num = "
					+ selNum;

			System.out.println(sql);

			rs = stmt.executeQuery(sql);

			String boardTitle = null;
			String boardName = null;
			String boardContent = null;
			String createDate = null;

			while (rs.next()) {
				boardTitle = rs.getString("board_title");
				boardName = rs.getString("board_name");
				boardContent = rs.getString("board_content");
				createDate = rs.getString("create_date");

				boardEntity.setBoardTitle(boardTitle);
				boardEntity.setBoardName(boardName);
				boardEntity.setBoardContent(boardContent);
				boardEntity.setCreateDate(createDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1

		return boardEntity;
	}

	public int setBoardUpdateData(HashMap<String, String> updatetMap) {

		int rsNum = 0;
		try {
			getConnection();

			String sql = "UPDATE BOARD SET BOARD_CONTENT =  '" + updatetMap.get("board_content")
					+ "' where board_num = " + updatetMap.get("selNum");

			System.out.println(sql);

			rsNum = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1
		return rsNum;
	}

	public int setBoardDelData(String selNum) {

		int rsNum = 0;
		try {
			getConnection();

			String sql = "UPDATE BOARD SET DEL_YN = 'N' WHERE BOARD_NUM = " + selNum;

			System.out.println(sql);

			rsNum = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1
		return rsNum;
	}

	public void setBoardContentUp(String selNum) {

		try {
			getConnection();

			String sql = "update board set BOARD_CLICK_CNT = BOARD_CLICK_CNT+1 " + " where board_num = " + selNum;

			System.out.println(sql);

			stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1

	}

	public List byteCheck() throws Exception {
		// 칼럼 DB의 byte수 GET (insert할때 byte수 초과 방지 목적)
		List list = new ArrayList();
		try {
			getConnection();
			//System.out.println("ck");
			sql = "SELECT " + "    MAX(DECODE(COLUMN_NAME,'BOARD_TITLE',DATA_LENGTH)) AS TITLELENG "
					+ "    ,MAX(DECODE(COLUMN_NAME,'BOARD_CONTENT',DATA_LENGTH)) AS CONTENTLENG "
					+ "    ,MAX(DECODE(COLUMN_NAME,'BOARD_NAME',DATA_LENGTH)) AS WRITERLENG "
					+ "FROM  USER_TAB_COLUMNS where TABLE_NAME='BOARD'";
			
			System.out.println("###### sql(byteCheck) : " + sql);
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				HashMap<String, String> data = new HashMap<String, String>();
				data.put("titleLeng", rs.getString("TITLELENG"));
				data.put("contentLeng", rs.getString("CONTENTLENG"));
				data.put("writerLeng", rs.getString("WRITERLENG"));
				list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1
		return list;
	}

	public HashMap setBoardFileUpload( ArrayList<BoardFileEntity> flist ) {

		String sql = "";
		int rsMaxNum = 0;
		int rsNum = 0;
		BoardFileEntity boardFileEntity = null;
		HashMap fileHm = new HashMap();
		try {
			getConnection();
			
			sql = "SELECT NVL(MAX(FILE_NUM),0) AS MAXCOUNT FROM BOARD_FILE";
			System.out.println(sql);

			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				rsMaxNum = rs.getInt("maxCount") + 1;
			}

			for( int i=0;i<flist.size();i++ ) {
				
				boardFileEntity = flist.get(i);
				
				sql = "INSERT INTO BOARD_FILE(file_num, board_num, sys_nm, org_nm, create_date)" + " VALUES( "
						+ (rsMaxNum+i) + ",'" + boardFileEntity.getBoardNum() + "','" + boardFileEntity.getSysNm() + "','"
						+ boardFileEntity.getOrgNm() + "', to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') )";
				System.out.println(sql);
				
				rsNum = stmt.executeUpdate(sql);
				if( rsNum != 1 ) {	// 실패시 등록 안된 파일 헤시맵에 입력
					fileHm.put(i, boardFileEntity.getSysNm());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1

		return fileHm;
	}

	public ArrayList<BoardFileEntity> getUpdateFileNames( String selNum ) {

		ArrayList<BoardFileEntity> flist = new ArrayList<BoardFileEntity>();

		sql = " SELECT FILE_NUM, BOARD_NUM, SYS_NM, ORG_NM, CREATE_DATE FROM BOARD_FILE WHERE DEL_YN = 'Y' and BOARD_NUM = "+ selNum +"  ";
		try {
			getConnection();
			System.out.println(sql);
			System.out.println("selNum:"+selNum );

			rs = stmt.executeQuery(sql);

			while( rs.next() ) {

				System.out.println( rs.getInt("FILE_NUM") );

				BoardFileEntity boardFileEntity = new BoardFileEntity();
				boardFileEntity.setFileNum(rs.getInt("FILE_NUM"));
				boardFileEntity.setBoardNum(rs.getInt("BOARD_NUM"));
				boardFileEntity.setSysNm(rs.getString("SYS_NM"));
				boardFileEntity.setOrgNm(rs.getString("ORG_NM"));
				boardFileEntity.setCreateDate(rs.getString("CREATE_DATE"));
				flist.add(boardFileEntity);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			ConnectionClose();
		}

		return flist;
	}
	
	public HashMap getFileName( String selNum ) {

		HashMap fileDownName = new HashMap();

		sql = " SELECT FILE_NUM, BOARD_NUM, SYS_NM, ORG_NM, CREATE_DATE FROM BOARD_FILE WHERE DEL_YN = 'Y' and FILE_NUM = "+ selNum +"  ";
		try {
			getConnection();
			System.out.println(sql);
			System.out.println("selNum:"+selNum );

			rs = stmt.executeQuery(sql);

			while( rs.next() ) {
				System.out.println( rs.getInt("FILE_NUM") );

				fileDownName.put( "SYS_NM", rs.getString("SYS_NM") );
				fileDownName.put( "ORG_NM", rs.getString("ORG_NM") );
				//fileDownName.put( "", rs.getString("SYS_NM") );
				//fileDownName.put( "", rs.getString("SYS_NM") );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			ConnectionClose();
		}
		return fileDownName;
	}
	
	public int delFileBoardListData(String selNum) {

		int rsNum = 0;
		try {
			getConnection();

			String sql = "UPDATE BOARD_FILE SET DEL_YN = 'N' WHERE FILE_NUM = " + selNum;
			System.out.println(sql);
			rsNum = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionClose();
		} // try 1
		return rsNum;
	}
	
}

