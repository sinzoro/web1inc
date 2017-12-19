<%@ page import="com.board.logic.BoardLogic" %>
<%@ page import="com.board.data.BoardData" %>



<%
	
	String selNum = request.getParameter("selNum");

	System.out.print( "selNum : "+ selNum );

	BoardData boardData = new BoardData();
	boardData.setBoard_num( Integer.parseInt(selNum) );
	
	BoardLogic boardLogic = new BoardLogic();
	boardData = boardLogic.dataUpdateBoardCnt( boardData );	//성공여부
	
	String getNum = boardData.getBoard_num()+"";
	
	
	
	if( getNum.equals( selNum ) ){
		System.out.println("sucess");
		response.sendRedirect("./postPage.jsp?getNum="+getNum);	// 넘기는 거 안되네; 어케 넘기지?
		//RequestDispatcher dis = request.getRequestDispatcher("./postPage.jsp");
		//dis.forward(request, response);
	}else{
		System.out.println("fail");
		response.sendRedirect("./table.jsp");
	}
	

%>

