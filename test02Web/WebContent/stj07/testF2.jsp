<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>

<base target="_self"/>

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
<script language='javascript' src="<%=request.getContextPath()%>/common/js/showModalDialogCallee.js" ></script>

<script language='javascript'>

        function UpdateFileInsertProSubmit() {
        	
        	//alert( 'UpdateFileInsertProSubmit' );
        	//document.getElementById('ddd').value = obj.selNum;
        	//alert( document.getElementById('ddd').value );
        	
        	//alert( 'UpdateFileInsertProSubmit' );
        	//alert( document.getElementById('selNum').value );
        	
        	///dialogArguments
        	getDialogArguments();
        	
        	var obj = window.dialogArguments;
        	var mom = obj.mom;
        	
    		//ck value get
    		var fileNameCk = document.getElementsByClassName('fileNameCk');
    		//alert( fileNameCk.length );
    		
    		document.getElementById('parentSelNum').value = obj.selNum;
    		//document.getElementById("selFileCKCount").value = fileNameCk.length;
    		
    		
    		document.getElementById("UpdateFileInsertPro").action = "./testF3.jsp";
    		document.getElementById("UpdateFileInsertPro").submit();
    		mom.document.location.reload();
    		window.close();
    		
    	}

</script>


</head>
<body>
<section id = "uploadFormArea">
<!-- <form action="" method="post" id="UpdateFileInsertPro" name="UpdateFileInsertPro" enctype="multipart/form-data"> -->
<form action="" method="post" id="UpdateFileInsertPro" name="UpdateFileInsertPro" enctype="multipart/form-data">


<input type="hidden" id="selFileCKCount" name="selFileCKCount" value="">
<input type="hidden" id="cmd" name='cmd' value="UpdateFileInsertPro">
<input type="hidden" id="parentSelNum" name="parentSelNum" value="">

<input type="button" onclick='UpdateFileInsertProSubmit()' value="확인" class='unrole_btn'>


</form>

</section>
</body>
</html>

