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


  <div>Zero <span></span></div> 
  <div>First <span></span></div> 
  <div>Second <span></span></div> 
  
  <p id="divtext"></p>
  
  
  <script language="javascript">
  	
  	$("div").attr("id",function(arr){
  		return "div-id-order"+arr;
  	}).each(function(){
  		//$("span",this).text("id값은 <b>",+this.id+"<b>");
  		$("span",this).text("id값은 <b>",+parent.id+"<b>");
  	});
  	
  	$("#divtext").text($("div").attr("id"));
  	
  
  </script>


</body>
</html>
