<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style> 
  div { color:red; text-align:center; cursor:pointer;  
        font-weight:bolder; width:300px; } 
  </style> 
  
<script 
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
	
</head>
<body>


  	<button>Enable</button> 
	<input type="text" title="current" /> 
	<div id="log"></div> 
  
  
  <script language="javascript">
  	
  	(function(){
  		var inputTitle = $("input").attr("title");
  		$("button").click(function(){
  			var input = $(this).next();
  			if( input.attr("title") == inputTitle ){
  				input.removeAttr("title");
  			}else{
  				input.attr("title",inputTitle);
  			}
  			
  			$("#log").html("현제 title attribute 값은" + input.attr("title") + " 입니다. " );
  			//$("#log").attr("logvalue","log값");
  		});
  	})();
  	
  
  </script>


</body>
</html>
