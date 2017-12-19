<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="com.board.logic.BoardLogic" %>
<%@ page import="com.board.data.BoardData" %>
<%@ page import="java.util.ArrayList" %>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>

<%
	String search_word = request.getParameter("search_word");
	String field = request.getParameter("field");
	
	if( search_word == null ){
		search_word = "";
	}
	if( field == null ){
		field = "board_title";
	}
	
	//search_word = URLDecoder.decode(search_word, "UTF-8");

	
%>
<%

	String viewPage = request.getParameter("viewPage");
	viewPage = ( viewPage == null?"1":viewPage );
	
	String pagingPath = "./table.jsp";
	String styleTag = "class=a11y_hidden";

	BoardLogic boardLogic = new BoardLogic( viewPage, pagingPath, field, search_word );
	ArrayList<BoardData> bList = new ArrayList<BoardData>();
	bList = boardLogic.getList();
	
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <title>table sample</title>
</head>
<body>

	<form id="form3" name="form3" action="./table.jsp">
		<div class="wrap">
		    <h2>게시판</h2>
		    <fieldset>
		        <div class="search_form">
		            <legend class="a11y_hidden">게시판 목록 검색</legend>
		            <select name="field" title="분류선택">
		                <option value=board_title selected>제목</option>
		                <option value="board_name">작성자</option>
		                <option value="board_content">내용</option>
		            </select>
		            <input id="search_word" name="search_word" class="inp_type" title="검색어 입력" value="<%=search_word %>" type="text">
		            <a href="javascript:{}" onclick="document.getElementById('form3').submit();" class="inp_btn" ><span>검색하기</span></a>
		        </div>
		    </fieldset>
		    <table>
		        <caption class="a11y_hidden">게시판으로 번호 제목 작성자 작성일 조회수를 나타내는 표</caption>
		        <colgroup>
		                <col style="width:10%">
		                <col>
		                <col style="width:15%">
		                <col style="width:12%">
		                <col style="width:9%">
		                <col style="width:9%">
		        </colgroup>
		        <thead>
		            <tr>
		                <th scope="col">번호</th>
		                <th scope="col">제목</th>
		                <th scope="col">내용</th>
		                <th scope="col">작성일</th>
		                <th scope="col">조회수</th>
		            </tr>
		        </thead>
		        <tbody>
		            <% for( int i=0; i<bList.size(); i++ ){ %>
		            <tr>
		            	<td><%=bList.get(i).getBoard_num() %></td>
		                <td><%=bList.get(i).getBoard_title() %></td>
		                <th scope="row">
		                    <a href="./postPagePro.jsp?selNum=<%=bList.get(i).getBoard_num()%>"><%=bList.get(i).getBoard_content() %></a>
		                </th>
		                <td><%=bList.get(i).getCreate_date() %></td>
		                <td><%=bList.get(i).getBoard_click_cnt() %></td>
		            </tr>
		            <% } %>
		            
		            
		        </tbody>
		    </table>
		    <div class="unrole">
		        <a href="./writePage.jsp" title="글등록" class="unrole_btn"><span>등록</span></a>
		    </div>
		    <%=boardLogic.getPaging() %>
		</div>
	</form>
</body>
</html>