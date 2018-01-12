<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.board09.entity.BoardEntity09" %>
<%@ page import="java.util.ArrayList" %>

<%
	ArrayList bList = (ArrayList)request.getAttribute("bList");
	String getPaging = request.getAttribute("getPaging").toString();
	String search_word = request.getAttribute("search_word").toString();
	String field = request.getAttribute("field").toString();
	
	String viewPage = request.getAttribute("viewPage").toString();
	

%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stj09_jstl1/css/style.css" type="text/css" />
    <title>table sample</title>
    
<script language='javascript'>

	function boardInsertSubmit(){
		
		document.getElementById('cmd').value = 'insertPage';
		document.getElementById('form3').action = '${pageContext.request.contextPath}/BoardAction09';
		document.getElementById('form3').submit();
		
	}

	function boardDetailSubmit( selNum ){
		
		//alert( '' );
		
		document.getElementById('cmd').value = 'detail';
		document.getElementById('selNum').value = selNum;
		document.getElementById('form3').action = '${pageContext.request.contextPath}/BoardAction09';
		//document.getElementById('form3').submit();
		document.forms[0].submit();
		
	}
	

</script>
    
    
    
</head>
<body>

	<form id="form3" name="form3" action="${pageContext.request.contextPath}/BoardAction09" method='post'>
	<input type="hidden" id="cmd" name='cmd' value="select">
	<input type="hidden" id="selNum" name='selNum' value="">
		<div class="wrap">
		    <h2>게시판<%=viewPage %></h2>
		    <fieldset>
		        <div class="search_form">
		            <legend class="a11y_hidden">게시판 목록 검색</legend>
		            <select name="field" title="분류선택">
		                <option value=board_title <%=(field.equals("board_title")?"selected":"") %> >제목</option>
		                <option value="board_name" <%=(field.equals("board_name")?"selected":"") %> >작성자</option>
		                <option value="board_content" <%=(field.equals("board_content")?"selected":"") %> >내용</option>
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
		            	<td><%=((BoardEntity09)bList.get(i)).getBoardNum() %></td>
		                <td><%=((BoardEntity09)bList.get(i)).getBoardTitle() %></td>
		                <th scope="row">
		                	<a href="javascript:boardDetailSubmit('<%=((BoardEntity09)bList.get(i)).getBoardNum() %>')"><%=((BoardEntity09)bList.get(i)).getBoardContent() %></a>
		                </th>
		                <td><%=((BoardEntity09)bList.get(i)).getCreateDate() %></td>
		                <td><%=((BoardEntity09)bList.get(i)).getBoardClickCnt() %></td>
		            </tr>
		            <% } %>
		            
		            
		        </tbody>
		    </table>
		    <div class="unrole">
		        <a href="javascript:boardInsertSubmit()" title="글등록" class="unrole_btn" ><span>등록</span></a>
		    </div>
		    ${getPaging }
		</div>
	</form>
</body>
</html>


