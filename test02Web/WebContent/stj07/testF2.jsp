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
        	
        	///
        	getDialogArguments();
        	
        	var obj = window.dialogArguments;

        					//dialogArguments
    		//ck value get
    		var fileNameCk = document.getElementsByClassName('fileNameCk');
    		//alert( fileNameCk.length );
    		
    		document.getElementById('parentSelNum').value = obj.selNum;
    		var mom = obj.mom;
    		//alert( document.getElementById('parentSelNum').value );
    		//alert( obj.selNum );
    		//alert( obj.frm );
    		
    		
    		// file input count
    		document.getElementById("selFileCKCount").value = fileNameCk.length;
    		//document.getElementById("UpdateFileInsertPro").action = "./testF1.jsp";
    		
    		//alert( mom.document.location );
    		//mom.document.location.reload();
    		mom.document.location.href = './testF2.jsp';
    		
    		
    		//document.getElementById("UpdateFileInsertPro").submit();
    		
    		//document.onload = dialogArguments.location.reload();
    		//top.opener.document.location.reload();
    		//parent.document.location.reload();
    		//opener.location.reload();
    		//opener.document.location.reload();
    		//opener.parent.location.reload();
    		//opener.location.reload(true);
    		//opener.parent.location.href = reload
    		//opener.location.href = reload
    		 //opener.parent.location.replace("./testF1.jsp");
    		//alert(window.opener.postForm.cmd.value);
    		//window.opener.parent.location.reload();
    		//window.opener.location.reload();
    		
    		//var parentWindow = window.opener;
    		//var parentWindow = document.getElementById('postForm');
    		//alert( parentWindow );
    		//parentWindow.location.href = 'http://blog.saltfactory.net'


    		//self.colse();
    		//window.close();
    		
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

