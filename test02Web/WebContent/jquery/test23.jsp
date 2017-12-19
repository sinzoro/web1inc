<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
span {
	color: #008;
}

span.sogreen {
	color: green;
	font-weight: bolder;
}
</style>

<script 
	src="<%=request.getContextPath()%>/common/js/jquery-3.2.1.js"></script>

</head>
<body>


	<div>
		<label> <input type="radio" name="1newsletterX" value="Hot Fuzz" />
			<span>name?</span>
		</label>
	</div>
	<div>
		<label> <input type="radio" name="2newsletterY2"
			value="Cold Fusion" /> <span>value?</span>
		</label>
	</div>
	<div>
		<label> <input type="radio" name="3newsletterZ"
			value="Evil Plans" /> <span>value?</span>
		</label>
	</div>


	<script>

		$("input[value='Hot Fuzz']").next().text(" Hot Fuzz");	//같은거
		//$("input[name^='2']").next().text("2");	// 시작하는거
		///$("input[name$='2']").next().text("3");	//끝나는거
		
		//$("input[name!='3newsletterZ']").next().text("not 3newsletterZ");	//아닌거
		
		//$("input[name*='news']").next().text("new name exist!");	//포함
		
		

	</script>


</body>
</html>
