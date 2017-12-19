<%@ page import="com.board.logic.BoardLogic"%>
<%@ page import="com.board.data.BoardData"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>

<%
	String selNum = request.getParameter("selNum");
	String board_content = request.getParameter("board_content");
	board_content = URLDecoder.decode(board_content, "UTF-8");

	System.out.println("selNum:"+selNum);
	
	BoardData boardData = new BoardData();
	boardData.setBoard_num( Integer.parseInt(selNum) );
	boardData.setBoard_content( board_content );
	
	
	BoardLogic boardLogic = new BoardLogic();
	int rsNum = boardLogic.setUpdateData( boardData ); //성공여부
	
	
	if( rsNum == 1 ){
		System.out.println("sucess");
		response.sendRedirect("./postPage.jsp");
	}else{
		System.out.println("fail");
		response.sendRedirect("./table.jsp");
	}
	
	
%>


