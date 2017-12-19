<%@ page import="com.board.logic.BoardLogic" %>
<%@ page import="com.board.data.BoardData" %>
<%@ page import="java.util.ArrayList" %>



<%
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");	
	
	BoardData boardData = new BoardData();
	boardData.setBoard_title( title );
	boardData.setBoard_name( name );
	boardData.setBoard_content( content );
	
	BoardLogic boardLogic = new BoardLogic();
	int rsNum = boardLogic.dataInsert( boardData );	//성공여부
	
	if( rsNum == 1 ){
		System.out.println("sucess");
		response.sendRedirect("./table.jsp");
	}else{
		System.out.println("fail");
		response.sendRedirect("./writePage.jsp");
	}
	

%>





