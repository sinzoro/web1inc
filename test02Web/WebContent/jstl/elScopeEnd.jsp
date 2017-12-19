<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


1.pageObject Scope에 저장된 name의 value 접근 </br>
	- ${ pageScope.name } </br>
	- ${ pageScope["name"] } </br></br>

2.requestObject Scope에 저장된 name의 value 접근 </br>
	- ${ requestScope.name } </br>
	- ${ requestScope["name"] } </br></br>

3.sessionObject Scope에 저장된 name의 value(Vector)의 empty 유무 </br>
	- ${ empty sessionScope.name } </br>
	- ${ empty sessionScope["name"] } </br></br>

4.1.sessionObject Scope에 저장된 name1의 value(Vector)은 empty 유무 </br>
	- ${ empty sessionScope.name1 } </br>
	- ${ empty sessionScope["name1"] } </br></br>
	
4.2.sessionObject Scope에 저장된 name1의 value(HashMap)은 empty 유무 </br>
	- ${ sessionScope.name1[0] } </br>
	- ${ sessionScope["name1"][0] } </br></br>
	
5.1.applicationObject Scope에 저장된 name의 value(HashMap)은 empty 유무 </br>
	- ${ empty applicationScope.name } </br>
	- ${ empty applicationScope["name"] } </br></br>

5.1.2.applicationObject Scope에 저장된 name의 value(HashMap)은 empty 유무 </br>
	- ${ empty applicationScope.name.a } </br>
	- ${ empty applicationScope["name"].a } </br></br>
	
5.2.applicationObject Scope에 저장된 name의 value(HashMap)의 내용 a의 value 접근 </br>
	- ${ applicationScope.name.a } </br>
	- ${ applicationScope["name"].a } </br></br></br></br>
	
<h3>
	Object Scope의 영역을 지정하지 않고 EL을 사용 name에 접근시 <br/>
	어떤 값이 추출되는 지 확인하자.<br/>
	
	어떤 Object Scope의 내용인가 : ${name}
</h3>

</body>
</html>