<%@page import="com.servlet.GetParameterMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.*" %>

<%@ page import="com.board09.entity.BoardEntity09" %>
<%@ page import="com.board09.entity.BoardFileEntity09" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${pageContext.request.contextPath}/stj09_jstl1/css/style.css	" type="text/css" />
<title>post page sample</title>
<%
	BoardEntity09 boardEntity = (BoardEntity09)request.getAttribute("boardEntity");
	String selNum = request.getParameter("selNum");

	ArrayList list = (ArrayList)request.getAttribute("list");
	HashMap<String, String> ckMap = (HashMap<String, String>)(list.get(0));
	
	ArrayList flist = (ArrayList)request.getAttribute("flist");
%>

<c:set var="boardEntity" value="${requestScope.boardEntity }" />
${ empty boardEntity }

<script language='javascript' src="${pageContext.request.contextPath}/common/js/byteCheck.js"></script>
<script language='javascript' src="${pageContext.request.contextPath}/common/js/showModalDialog.js"></script>
<script language='javascript'>


	function boardListSubmit(){

		document.getElementById('cmd').value = 'select';
		document.getElementById('postForm').submit();
	}

	function boardUpdateSubmit(){

		document.getElementById('cmd').value = 'update';
		document.getElementById('postForm').action = '${pageContext.request.contextPath}/BoardAction09';
		document.getElementById('postForm').submit();
	}
	
	function boardDeleteSubmit(){
		
		document.getElementById('cmd').value = 'delete';
		document.getElementById('postForm').action = '${pageContext.request.contextPath}/BoardAction09';
		document.getElementById('postForm').submit();
	}
	
	function fileDown( fileNum ){
		
		document.getElementById('fileNum').value = fileNum;
		document.getElementById('cmd').value = 'fileDown';
		document.getElementById('postForm').submit();
	}
	
	function fileUploadPage(){

		var url = '${pageContext.request.contextPath}/stj09_jstl1/postFileUpload.jsp';
		
		var obj = new Object();
        obj.selNum = document.getElementById('selNum').value;
        obj.mom = this;

        var rtnValue = window.showModalDialog(url, obj, "dialogWidth:980px;dialogHeight:600px;status:no;help:no;location:no");


	}
	
	function fileDel( fileNum ){

		document.getElementById('fileNum').value = fileNum;
		document.getElementById('cmd').value = 'fileDel';
		document.getElementById('postForm').submit();
	}

</script>



</head>
<body>
	<form id='postForm' action="${pageContext.request.contextPath}/BoardAction09" method="post">
	<input type="hidden" id="cmd" name='cmd' value="select">
	<input type="hidden" id="selNum" name='selNum' value="<%=selNum %>">
	<input type="hidden" id="fileNum" name='fileNum' value="">
		<div class="wrap">
			<div class="board_view">
				<ul>
					<li><span class="post_title">제목<%=selNum %></span> <span><%=boardEntity.getBoardTitle()%></span>
					</li>
					<li><span class="post_title">작성자<%=request.getContextPath()%><br>
								</span> <span><%=boardEntity.getBoardName()%></span>
					</li>
					<li><span class="post_title">작성일</span> <span><%=boardEntity.getCreateDate()%></span>
					</li>
				</ul>
			</div>
			<div class="board_content" id="board_content">
				<textarea name="board_content" rows="10" cols="100" placeholder="내용입력" title="내용입력" id="board_content" name="board_content" onkeyup="on_key_up(this,'<%=ckMap.get("contentLeng")%>')"><%=boardEntity.getBoardContent() %></textarea>
				<input type="text" id="board_content_byteCheck" class="board_content_byteCheck" name="board_content_byteCheck" value="(<%=boardEntity.getBoardContent().length() %>/<%=ckMap.get("titleLeng")%>)" readonly>
				<div>
					<div>
						<input type="button" id="updateFileInsert" class="updateFileInsert" name="updateFileInsert" value="파일추가" onclick="fileUploadPage()">
					</div>
					<div>
						<%for(int i=0;i<flist.size();i++){%>
							<span>
								<a href="javascript:fileDel('<%=((BoardFileEntity09)flist.get(i)).getFileNum() %>')" >X </a>
							</span>
							<a href="javascript:fileDown('<%=((BoardFileEntity09)flist.get(i)).getFileNum() %>')"><%=((BoardFileEntity09)flist.get(i)).getOrgNm() %></a><br>
						<%}%>
					</div>
				</div>
			</div>
			<div class="unrole">
				<a href="javascript:boardListSubmit()" title="글목록" class="unrole_btn"><span>목록</span></a>
				<a href="javascript:boardUpdateSubmit()" title="글수정" class="unrole_btn"><span>수정</span></a>
				<a href="javascript:boardDeleteSubmit()" title="글삭제" class="unrole_btn"><span>삭제</span></a>
			</div>
		</div>
	</form>
</body>
</html>