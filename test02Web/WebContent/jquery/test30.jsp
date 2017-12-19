<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style> 
  div { width:60px; height:60px; margin:10px; float:left; 
        border:2px solid blue; } 
  .blue { background:blue; } 
  </style>

  
<script 
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
	
</head>
<body>

	<div>0</div> 
  	<div>1</div> 
 	<div>2</div> 
 
  	<div>3</div> 
  	<div>4</div> 
 	<div>5</div> 
  
  	<p>
  	
  	<input type="button" id="but" value="확인" >
  
  <script language="javascript">
  	
  	///div
  	//$("body").find("div").eq(2).addClass("blue");
  	//$("body").find("div").first().addClass("blue");
  	//$("body").find("div").last().addClass("blue");
  	
  	///input
  	$("#but").click(function(){
  		//var arr = ["첫번째","두번째","세번째","네번째","다섯번째"];
  		/* var arr = {
  			"one":"1"
  			,"two":"2"
  			,"three":"3"
  			,"four":"4"
  			,"five":"5"
  		} */
  		/* var arr = {
  			{"one":"1"}
  			,{"two":"2"}
  			,{"three":"3"}
  			,{"four":"4"}
  			,{"five":"5"}
  		} */
  		
  		var arr = [
  	  			{"one":"1"}
  	  			,{"two":"2"}
  	  			,{"three":"3"}
  	  			,{"four":"4"}
  	  			,{"five":"5"}
  	  		]
  		
  		$.each(arr,function(key, value){
  			if(key == 'three'){
  				alert(value);
  			}
  		});
  		
  		/* $.each(arr,function(){
  			
  			$.each(this,function(key, value){
  				console.log(key+"::"+value);
  				//alert(key+":"+value);
  			});
  		}); */
  		
  		$.each(arr,function(){
			
			$.each(this,function(key, value){
				console.log(key+"::"+value);
				//alert(key+":"+value);
			});
		});
  		
  	});
  	
  	
  	
  	
  </script>


</body>
</html>
