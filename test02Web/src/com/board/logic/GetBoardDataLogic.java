package com.board.logic;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.board.data.BoardData;

public class GetBoardDataLogic {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String userid = "scott";
	private String userpw = "tiger";

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	ArrayList<BoardData> boardList = new ArrayList<BoardData>();
	BoardData boardData = null;

	public void dbCon() {
		try {
			Class.forName(driver); // driver load
			con = DriverManager.getConnection(url, userid, userpw);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

	public void dbClose() {
		try {
			if (rs != null)
				rs.close();
			rs = null;
			if (stmt != null)
				stmt.close();
			stmt = null;
			if (con != null)
				con.close();
			con = null;
		} catch (SQLException e) {
			e.printStackTrace();
		} // try 2
	}

	public ArrayList<BoardData> getList(int startNum, int endNum, String field, String search_word ) {
		try {
			dbCon();
			
//			search_word = URLEncoder.encode(search_word, "UTF-8");
//			System.out.println( "search_word:"+search_word );
			
			search_word = URLDecoder.decode(search_word, "UTF-8");
			System.out.println( "search_word:"+search_word );
			
			stmt = con.createStatement();
			String sql = " SELECT X.NUM, BOARD_NUM, BOARD_TITLE, BOARD_CONTENT, BOARD_CLICK_CNT, CREATE_DATE FROM "
					+ " ( SELECT ROWNUM AS NUM,BOARD_NUM,BOARD_TITLE,BOARD_CONTENT,BOARD_CLICK_CNT,CREATE_DATE FROM BOARD "
					+ " WHERE DEL_YN = 'Y'  and "+field+ " like '%"+search_word+"%'  ) X  WHERE NUM > " + startNum + " AND NUM <= " + endNum+"";

			
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

				boardData = new BoardData();
				boardData.setNum(num);
				boardData.setBoard_num(board_num);
				boardData.setBoard_title(board_title);
				boardData.setBoard_content(board_content);
				boardData.setBoard_click_cnt(board_click_cnt);
				boardData.setCreate_date(create_date);

				boardList.add(boardData);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return boardList;
	}

	public int getAllcountNum(  String field, String search_word ) {

		int allCont = 0;

		try {
			dbCon();
			stmt = con.createStatement();
			
			System.out.println( "field:"+field );
			
			if( search_word == null ) {
				search_word = "";
			}
			
			String sql = "SELECT nvl(sum(count(board_num)),0) as count FROM BOARD  WHERE DEL_YN = 'Y'  and "+field+" like '%"+search_word+"%'   GROUP BY board_num";
			
			rs = stmt.executeQuery(sql);

			System.out.println(sql);

			if (rs.next()) {
				allCont = Integer.parseInt(rs.getString("COUNT"));
			}
			System.out.println(allCont);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return allCont;
	}

	public int setDataInsert(BoardData boardData) {

		int rsNum = 0; // 반환값
		int rsMaxNum = 0; // 최고값

		try {
			dbCon();
			stmt = con.createStatement();

			String sql = "select max(board_num) as maxCount from board";

			System.out.println(sql);

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				rsMaxNum = rs.getInt("maxCount") + 1;
			}
			System.out.println(rsMaxNum);

			sql = "INSERT INTO BOARD(board_num, board_title, board_name, board_content, create_date)" + " VALUES( "
					+ rsMaxNum + ",'" + boardData.getBoard_title() + "','" + boardData.getBoard_name() + "','"
					+ boardData.getBoard_content() + "', to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') )";

			System.out.println(sql);

			rsNum = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return rsNum;
	}

	public BoardData setBoardContentUp(BoardData boardData) {

		try {
			dbCon();
			stmt = con.createStatement();

			String sql = "update board set BOARD_CLICK_CNT = BOARD_CLICK_CNT+1 " + " where board_num = "
					+ boardData.getBoard_num();

			System.out.println(sql);

			stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return boardData;
	}

	public BoardData getBoardPostPage( int selNum ) {

		try {
			dbCon();
			stmt = con.createStatement();

			String sql = "select board_title, board_name, board_content, create_date " + "from board where board_num = "
					+ selNum;

			System.out.println(sql);

			rs = stmt.executeQuery(sql);

			String board_title = null;
			String board_name = null;
			String board_content = null;
			String create_date = null;

			while (rs.next()) {
				board_title = rs.getString("board_title");
				board_name = rs.getString("board_name");
				board_content = rs.getString("board_content");
				create_date = rs.getString("create_date");

				boardData = new BoardData();
				boardData.setBoard_title(board_title);
				boardData.setBoard_name(board_name);
				boardData.setBoard_content(board_content);
				boardData.setCreate_date(create_date);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return boardData;
	}

	
	public int setBoardUpdateData( BoardData boardData ) {
		
		int rsNum = 0;
		try {
			dbCon();
			stmt = con.createStatement();
			
			String sql = "UPDATE BOARD SET BOARD_CONTENT =  '" +boardData.getBoard_content().trim() 
			+ "' where board_num = "+ boardData.getBoard_num();

			System.out.println(sql);

			rsNum = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return rsNum;
	}

	public int setBoardDelData( int selNum ) {
		
		int rsNum = 0;
		try {
			dbCon();
			stmt = con.createStatement();
			
			String sql = "UPDATE BOARD SET DEL_YN = 'N' WHERE BOARD_NUM = "+ selNum;

			System.out.println(sql);

			rsNum = stmt.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} // try 1

		return rsNum;
	}

}


