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


	<input name="email" disabled="disabled" /> 
    <input name="id" /> 
    
    <input type="checkbox" name="newsletter" checked="checked" value="Hourly" /> 
 
    <input type="checkbox" name="newsletter" value="Daily" /> 
    <input type="checkbox" name="newsletter" value="Weekly" /> 
 
    <input type="checkbox" name="newsletter" checked="checked" value="Monthly" /> 
    <input type="checkbox" name="newsletter" value="Yearly" /> 

		<select name="garden" multiful size=5> 
 
	    <option value="F">Flowers</option> 
	    <option >Shrubs</option> 
	    <option>Trees</option> 
	    <option >Bushes</option> 
	    <option>Grass</option> 
	    <option>Dirt</option> 
	  </select>
	  <!-- <select>
	  <option>Dirt</option>
	  <option>Grass</option>
	  </select> -->

  </form> 
  <br> 체크(check)된 값
  <div id="checkvalue"></div>
  <br> 선택(Select)된 값
  <div id="select1"></div>
  
  
  <script>
  
  	$("input:enabled").val("enabled");
  	$("input:disabled").val("disabled");
  	
  	$("#checkvalue").text("checkbox가 선택된 갯수 :"+ $("input:checked").length);
  	//$("#checkvalue").text("선택되지 않는 체크박스 갯수:" + $("input:not(:checked)").length);
	
  	$("select").change(function(){
  		$("select option:selected").each(function(){
  			//str = "선택된 index:"+$("select option").index(this);
  			str = "선택된 index:"+$("select option").index($("select option:selected"));
  			//str = "선택된 value:"+$(this).val();
  			//str =  "선택된 text:"+$(this).text();
  			
  			$("#select1").text(str);
  		});
  	});
  	
  	
  
  </script>


</body>
</html>
