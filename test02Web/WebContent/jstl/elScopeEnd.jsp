<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


1.pageObject Scope�� ����� name�� value ���� </br>
	- ${ pageScope.name } </br>
	- ${ pageScope["name"] } </br></br>

2.requestObject Scope�� ����� name�� value ���� </br>
	- ${ requestScope.name } </br>
	- ${ requestScope["name"] } </br></br>

3.sessionObject Scope�� ����� name�� value(Vector)�� empty ���� </br>
	- ${ empty sessionScope.name } </br>
	- ${ empty sessionScope["name"] } </br></br>

4.1.sessionObject Scope�� ����� name1�� value(Vector)�� empty ���� </br>
	- ${ empty sessionScope.name1 } </br>
	- ${ empty sessionScope["name1"] } </br></br>
	
4.2.sessionObject Scope�� ����� name1�� value(HashMap)�� empty ���� </br>
	- ${ sessionScope.name1[0] } </br>
	- ${ sessionScope["name1"][0] } </br></br>
	
5.1.applicationObject Scope�� ����� name�� value(HashMap)�� empty ���� </br>
	- ${ empty applicationScope.name } </br>
	- ${ empty applicationScope["name"] } </br></br>

5.1.2.applicationObject Scope�� ����� name�� value(HashMap)�� empty ���� </br>
	- ${ empty applicationScope.name.a } </br>
	- ${ empty applicationScope["name"].a } </br></br>
	
5.2.applicationObject Scope�� ����� name�� value(HashMap)�� ���� a�� value ���� </br>
	- ${ applicationScope.name.a } </br>
	- ${ applicationScope["name"].a } </br></br></br></br>
	
<h3>
	Object Scope�� ������ �������� �ʰ� EL�� ��� name�� ���ٽ� <br/>
	� ���� ����Ǵ� �� Ȯ������.<br/>
	
	� Object Scope�� �����ΰ� : ${name}
</h3>

</body>
</html>