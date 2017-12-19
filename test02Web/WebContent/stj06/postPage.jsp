<%@page import="com.servlet.GetParameterMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.board.logic.BoardLogic"%>
<%@ page import="com.board.data.BoardData"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>post page sample</title>
<%
	String selNum = request.getParameter("getNum");
	if( selNum == null ){
		selNum = "0";
	}
	BoardData boardData = new BoardData();
	BoardLogic boardLogic = new BoardLogic();
	boardData = boardLogic.getDataPostPage(Integer.parseInt(selNum)); //성공여부
%>
</head>
<body>
	<form id='postForm' action="./postUpdatePro.jsp">
		<div class="wrap">
			<div class="board_view">
				<ul>
					<li><span class="post_title">제목<%=selNum %></span> <span><%=boardData.getBoard_title()%></span>
					</li>
					<li><span class="post_title">작성자</span> <span><%=boardData.getBoard_name()%></span>
					</li>
					<li><span class="post_title">작성일</span> <span><%=boardData.getCreate_date()%></span>
					</li>
				</ul>
			</div>
			<div class="board_content">
				<textarea name="board_content" rows="10" cols="100" placeholder="내용입력" title="내용입력" id="board_content"><%=boardData.getBoard_content().trim() %></textarea>
			</div>
			<div class="unrole">
				<input type="hidden" name=board_title value=<%=boardData.getBoard_title() %> >
				<input type="hidden" name=selNum value=<%=selNum %> >
				<a href="./table.jsp" title="글목록" class="unrole_btn"><span>목록</span></a>
				<a href="javascript:{}" onclick="document.getElementById('postForm').submit();" title="글수정" class="unrole_btn"><span>수정</span></a>
				<a href="./postDelPro.jsp?selNum=<%=selNum %>" title="글삭제" class="unrole_btn"><span>삭제</span></a>
			</div>
		</div>
	</form>
</body>
</html>