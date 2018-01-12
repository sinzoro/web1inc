<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.basic.Job"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		int[] num = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		request.setAttribute("myArray", num);

		
		ArrayList<String> list = new ArrayList<String>();
		list.add("홍길동");
		list.add("이순신");
		list.add("유관순");
		request.setAttribute("name", list);
	
		
		ArrayList<Job> jobList = new ArrayList<Job>();
		
		Job job01 = new Job();
		Job job02 = new Job();
		Job job03 = new Job();
		
		job01.setJobCode(1);
		job01.setJobName("비서");
		
		job02.setJobCode(2);
		job02.setJobName("총무");
		
		
		job03.setJobCode(3);
		job03.setJobName("영업5");
		
		jobList.add(job01);
		jobList.add(job02);
		jobList.add(job03);
		request.setAttribute("job", jobList);
		
		
		
		String str = "A,B,C,D";
		request.setAttribute("data", str);
	%>
	
	
</body>
</html>

<jsp:forward page="forEachJstlEnd.jsp"></jsp:forward>