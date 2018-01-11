<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>FileUpload Form</title>



<script language='javascript' src="<%=request.getContextPath()%>/common/js/showModalDialogCallee.js" ></script>

<script language='javascript'>

        function UpdateFileInsertProSubmit() {

        	///
        	getDialogArguments();
        	
        	var obj = window.dialogArguments;
        	var mom = obj.mom;
        	
        	//
        	var iframe = document.getElementById("fileIframe").contentWindow.document;
        	//alert(iframe);
        	
    		//ck value get
    		var fileNameCk = iframe.getElementsByClassName('fileNameCk');
    		//alert( fileNameCk.length );
    		
    		iframe.getElementById('parentSelNum').value = obj.selNum;
    		//alert( document.getElementById('parentSelNum').value );
    		
    		var divFile = iframe.getElementsByClassName("divFile");
    		var fileGroup = iframe.getElementById("fileGroup");

    		for( var i=0;i<fileNameCk.length;i++ ){
    			if( !fileNameCk[i].checked ){
    				fileGroup.removeChild(divFile[i]);
    				i--;
    			}
    		}
    		
    		// file input count
    		iframe.getElementById("selFileCKCount").value = fileNameCk.length;

    		iframe.getElementById("UpdateFileInsertPro").action = "<%=request.getContextPath()%>/BoardAction";
    		iframe.getElementById("UpdateFileInsertPro").submit();

    		setTimeout(function() {
    			mom.document.getElementById('cmd').value = 'detail';
        		mom.document.getElementById("postForm").submit();
    		}, 100);

    		setTimeout(function() {
    	  		window.close();
    		}, 100);
    		
    	}

        
</script>


</head>
<body>
	
	
	<div>
		<iframe width="600" height="300" src="./fileIframe.jsp" name="fileIframe" id="fileIframe"
		frameborder="1" scrolling="yes" align="center">이 브라우저는 iframe을 지원하지 않습니다</iframe>
	</div>
	<div class="submit_wrapper">
		<input type="button" onclick='UpdateFileInsertProSubmit()' value="확인" class='unrole_btn'>
	</div>


</body>
</html>

