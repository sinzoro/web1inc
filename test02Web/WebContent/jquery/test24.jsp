<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script 
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>
	
</head>
<body>


	<form> 
    <input type="button" value="Input Button"/> 
    <input type="checkbox" /> 
 
    <input type="file" /> 
    <input type="hidden" /> 
    <input type="image" /> 
 
    <input type="password" /> 
    <input type="radio" /> 
    <input type="reset" value="초기화"/> 
 
    <input type="submit" value="전송"/> 
    <input type="text" /> 
    <select><option>Option</option></select> 
 
    <textarea></textarea> 
    <button>Button</button>
    
  </form>
  
  <div id="messages0">111</div> 
  <div id="messages1">222</div>
  <div id="messages2">333</div>
  
  
  <script>
  
  	var allInputs = $(":input");
  	
  	var formChild = $("form > * ");
  	
  	var inputText = $("input[type='text']");
  	
  	$("#messages0").text("총"+allInputs.length + " 개의 input ");
  	$("#messages1").text("총"+formChild.length + " 개의 input ");
  	$("#messages2").text("총"+inputText.length + " 개의 input ");
  
  
  </script>


</body>
</html>