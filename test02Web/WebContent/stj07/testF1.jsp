<%@page import="com.servlet.GetParameterMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<%=request.getContextPath() %>/stj07/css/style.css	" type="text/css" />
<title>post page sample</title>



<script language='javascript' src="<%=request.getContextPath()%>/common/js/showModalDialog.js"></script>
<script language='javascript'>


	//alert("sss");
	
	
	
	function fileUploadPage(){
		
		//alert( "fileUploadPage" );
		
		//window.open("./fileUploadForm.jsp", "", "width=400, height=300, left=500, top=400", scrollbars="1");
		
		//popup = window.open("<%=request.getContextPath()%>/stj07/postFileUpload.jsp", "updateFileInsert", "width=600, height=500, left=500, top=200, scrollbars=1, resizable=no");
		//updateFileInsert = window.top;
		//popup.focus();

		var url = "./testF2.jsp";
		
		var obj = new Object();
        obj.selNum = document.getElementById('selNum').value;
        
        //alert( obj.selNum );

        var rtnValue = window.showModalDialog(url, obj, "dialogWidth:980px;dialogHeight:600px;status:no;help:no;location:no");
         


		//window.showModelessDialog("<%=request.getContextPath()%>/stj07/postFileUpload.jsp", "updateFileInsert", "dialogWidth:600px; dialogHeight:500px;dialogleft=500, dialogtop=200");
		//window.showModalDialog("<%=request.getContextPath()%>/stj07/postFileUpload.jsp", "updateFileInsert", "dialogWidth:600px; dialogHeight:500px;dialogleft=500, dialogtop=200");
		
		//document.getElementById('fileNum').value = fileNum;
		//document.getElementById('cmd').value = 'fileUploadPage';
		//document.getElementById('postForm').submit();
	}
	
	

</script>



</head>
<body>
	<form id='postForm' action="./testF2.jsp" method="post">
	<input type="hidden" id="cmd" name='cmd' value="select">
	<input type="hidden" id="selNum" name='selNum' value="77">
	<input type="hidden" id="fileNum" name='fileNum' value="">
		<div class="wrap">
			
			<div class="board_content">
				<div>
					<div>
						<input type="button" id="updateFileInsert" class="updateFileInsert" name="updateFileInsert" value="파일추가" onclick="fileUploadPage()">
					</div>
					
				</div>
			</div>
			
		</div>
	</form>
</body>
</html>

