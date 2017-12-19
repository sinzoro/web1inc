<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>FileUpload Form</title>
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

<script language='javascript' src="<%=request.getContextPath()%>/common/js/boardFileController.js" ></script>

<script language='javascript'>

        function UpdateFileInsertProSubmit() {
        	
        	//alert( 'UpdateFileInsertProSubmit' );
        	//document.getElementById('ddd').value = obj.selNum;
        	//alert( document.getElementById('ddd').value );
        	
        	//alert( 'UpdateFileInsertProSubmit' );
        	//alert( document.getElementById('selNum').value );
        	
        	///
        	var obj = window.dialogArguments;
        	
    		//ck value get
    		var fileNameCk = document.getElementsByClassName('fileNameCk');
    		//alert( fileNameCk.length );
    		
    		document.getElementById('parentSelNum').value = obj.selNum;
    		//alert( document.getElementById('parentSelNum').value );
    		
    		
    		var divFile = document.getElementsByClassName("divFile");
    		var fileGroup = document.getElementById("fileGroup");

    		for( var i=0;i<fileNameCk.length;i++ ){
    			if( !fileNameCk[i].checked ){
    				fileGroup.removeChild(divFile[i]);
    				i--;
    			}
    		}
    		
    		// file input count
    		document.getElementById("selFileCKCount").value = fileNameCk.length;
    		document.getElementById("UpdateFileInsertPro").submit();
    		window.close();
    		
    	}

</script>


</head>
<body>
<section id = "uploadFormArea">
<form action="<%=request.getContextPath()%>/BoardAction" method="post" id="UpdateFileInsertPro" name="UpdateFileInsertPro" enctype="multipart/form-data">

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
					<label for="fileName1">파일명1 : </label>
					<span class="inerSpan"></span>
					<input type="file" name="fileName1" id="fileName1" class="fileName">
				</div>
				<!-- 추가 파일 리스트 위치 -->
			</div>
			<div class="submit_wrapper">
				<input type="button" onclick='UpdateFileInsertProSubmit()' value="확인" class='unrole_btn'>
			</div>
		</td>
	</tr>
</table>

</form>
</section>
</body>
</html>

