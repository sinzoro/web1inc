<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileIframe</title>
<style>
	#uploadFormArea{
		margin : auto;
		width : 350px;
		border : 1px solid black;
	}
	.td_title{
		font-size: xx-large;
		text-align: center;
	}
</style>
<script language='javascript' src="${pageContext.request.contextPath}/common/js/boardFileController.js" ></script>

</head>
<body>
<section id = "uploadFormArea">

<form action="" method="post" id="UpdateFileInsertPro" name="UpdateFileInsertPro" enctype="multipart/form-data">

<input type="hidden" id="selFileCKCount" name="selFileCKCount" value="">
<input type="hidden" id="cmd" name='cmd' value="UpdateFileInsertPro">
<input type="hidden" id="parentSelNum" name="parentSelNum" value="">

<table>
	<tr>
		<td colspan="2" class = "td_title" >파일 업로드 폼</td>
	</tr>
	<tr>
		<td>
			<div>
				<input type="button" onclick='filePlus()' value="추가" >
				<input type="button" onclick='fileMinus()' value="삭제" >
			</div>
			<div id='fileGroup'>
				<div class="divFile">
					<input type="checkbox" class="fileNameCk">
					
					<label for="fileName1">
					<span class="inerSpan">파일명1 : </span>
					</label>
					
					<input type="file" name="fileName1" id="fileName1" class="fileName">
				</div>
				<!-- 추가 파일 리스트 위치 -->
			</div>
			
		</td>
	</tr>
</table>



</form>
</section>
</body>
</html>