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


  <div>Click here</div> 
  <div>to iterate through</div> 
  <div>these divs.</div>
  
  <p id="divlen">1</p> 
  <p id="clickindex">2</p>
  
  
  <script language="javascript">
  	
  	var str = "";
  	str = "총 div갯수:" + $("div").length;
  	$("#divlen").text(str);
  	
  	$("div").click(function(){
  		var index = " 선택된 div index: " + $("div").index(this);
  		$("#clickindex").text(index);
  	});
  	
	//$(document.body).click(function(){  		
  	//	alert(1);
  	//});

	$(document.body).click(function(){  		
  		$("div").each(function(i,ele){
  			//alert('aaa');
  			//if(this.style.color != "blue"){
  			//	this.style.color = "blue";
  			//}else{
  			//	this.style.color = "";
  			//}
  			
  			if(i==0){
  				//this.style.color = "red";
  				$(ele).css('color = "red"');
  			}else if(i==1){
  				this.style.color = "lime";
  			}else if(i==2){
  				this.style.color = "blue";
  			}


  		});
  	});

	
  </script>


</body>
</html>
