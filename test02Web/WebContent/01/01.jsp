<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	01.jsp 입니다.<br>
	
	<%
		request.setAttribute("id","hong");
		
	out.print( (String)request.getAttribute("id")+"<br>" );
	
	request.removeAttribute("id");
	
	out.print( (String)request.getAttribute("id")+"<br>" );
	
	session.setAttribute("id", request.getParameter("usrid"));
	session.removeAttribute("id");
	
	if( session.getAttribute("id") != null ){
		// 홈페이지 마이페이지 이동
	}else{
		// 로그인 페이지 이동
	}
	
	%>
	
	

</body>
</html>