<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<% String value = request.getParameter("value"); 
	
		if( value == null ){
			throw new NullPointerException("value값이 넘어오지 않았습니다.");
		}
	
	
	%>

	<form action="/test02Web/01/forwardTrue.jsp" method="post">
		<input type="text" name="chkValue"></input>
		<input type=submit value="발사"></input>
	</form>

</body>
</html>