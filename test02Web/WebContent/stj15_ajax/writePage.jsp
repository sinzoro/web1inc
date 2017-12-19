<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*" %>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/stj07/css/style.css"
	type="text/css" />
<title>write page sample</title>

<%
	ArrayList list = (ArrayList)request.getAttribute("list");
	HashMap<String, String> ckMap = (HashMap<String, String>)(list.get(0));
%>


<script language='javascript' src="<%=request.getContextPath()%>/common/js/byteCheck.js" ></script>
<script language='javascript' src="<%=request.getContextPath()%>/common/js/boardFileController.js" ></script>
<script language='javascript'>

	function listGo() {
		//alert('a');
		//location.href='./table.jsp';
		//location.submit;
		document.getElementById('cmd').value = "select";
		//window.history.back();
		document.getElementById("writePageForm").method="get";
		document.getElementById("writePageForm").submit();
	}

	function insertProSubmit() {
		var name = document.getElementById('name').value;
		var title = document.getElementById('title').value;

		//empty ck
		if( name == "" || title == "" ){
			var txtNode = document.createTextNode("no name or no title");
			var inerSpan = document.createElement("span");
			var errMsg = document.getElementById('errMsg');

			while( errMsg.hasChildNodes() ){
				errMsg.removeChild(errMsg.firstChild);
			}

			inerSpan.appendChild(txtNode);
			errMsg.appendChild( inerSpan );
			return 0;
		}
		
		//ck value get
		var fileNameCk = document.getElementsByClassName('fileNameCk');
		var divFile = document.getElementsByClassName("divFile");
		var fileGroup = document.getElementById("fileGroup");

		for( var i=0;i<fileNameCk.length;i++ ){
			if( !fileNameCk[i].checked ){
				fileGroup.removeChild(divFile[i]);
				i--;
			}
		}
		
		var selFileCKCount = document.getElementById("selFileCKCount");
		selFileCKCount.value = fileNameCk.length;
		//alert( selFileCK.value );
		document.getElementById("writePageForm").submit();
	}
	
	
</script>

</head>
<body>
	<div class="wrap">
		<form action="<%=request.getContextPath()%>/BoardAction" name='writePageForm' id='writePageForm' method='post'  enctype="multipart/form-data">
			<input type="hidden" id="cmd" name='cmd' value="insertPro">
			<input type="hidden" id="selFileCKCount" name='selFileCKCount' value="">
			<div class="input_wrapper">
				<div class="title_wrap">
					<label for="title">제목</lable>
				</div>
				<div class="input_wrap">
					<input type="text" id="title" name=title class="input_title" onkeyup="on_key_up(this,'<%=ckMap.get("titleLeng")%>')" value='' autofocus>
					<input type="text" id="title_byteCheck" class="" name="title_byteCheck" value="(0/<%=ckMap.get("titleLeng")%>)" readonly>
				</div>
			</div>
			<div class="input_wrapper">
				<div class="title_wrap">
					<label for="name">작성자</lable>
				</div>
				<div class="input_wrap">
					<input type="text" id="name" name=name onkeyup="on_key_up(this,'<%=ckMap.get("writerLeng")%>')" value='' autofocus>
					&nbsp;<input type="text" id="name_byteCheck" class="name_byteCheck" name="name_byteCheck" value="(0/<%=ckMap.get("titleLeng")%>)" readonly>
					&nbsp;<span id='errMsg' ><%=request.getAttribute("errMsg").toString()%></span>
				</div>
			</div>
			<div class="cont_wrapper">
				<div class="title_wrap">
					<label for="content">내용</lable>
				</div>
				<textarea name="content" rows="10" cols="100" placeholder="내용입력"
					title="내용입력" id="content" name="content" onkeyup="on_key_up(this,'<%=ckMap.get("contentLeng")%>')" ></textarea>
				<input type="text" id="content_byteCheck" class="content_byteCheck" name="content_byteCheck" value="(0/<%=ckMap.get("titleLeng")%>)" readonly>
			</div>
			<div class="cont_wrapper">
				<div class="title_wrap">
					<label for="content">파일</lable>
				</div>
				<div>
					<input type="button" onclick='filePlus()' value="추가" >
					<input type="button" onclick='fileMinus()' value="삭제" >
				</div>
				<div id='fileGroup'>
					<!-- 추가 파일 리스트 위치 -->
				</div>
				<div class="submit_wrapper">
					<input type="button" onclick='insertProSubmit()' value="확인" class='unrole_btn'>
					<input type="button" onclick='listGo()'	value="list" class='unrole_btn1'>
				</div>
			</div>
			
		</form>
	</div>
</body>
</html>