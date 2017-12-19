<%@ page import="com.board.logic.BoardLogic"%>
<%@ page import="com.board.data.BoardData"%>


<%
	String selNum = request.getParameter("selNum");

	System.out.println("selNum:"+selNum);
	
	BoardData boardData = new BoardData();
	BoardLogic boardLogic = new BoardLogic();
	int rsNum = boardLogic.setDelData( Integer.parseInt(selNum) ); //성공여부
	
	System.out.println("rsNum:"+rsNum);
	
	if( rsNum == 1 ){
		System.out.println("sucess");
		response.sendRedirect("./table.jsp");
	}else{
		System.out.println("fail");
		response.sendRedirect("./table.jsp");
	}
	
	
%>


