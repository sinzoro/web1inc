<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>

	var app = angular.module("myapp",[]);
	app.directive("myappData",function(){
		return{
			//restrict:"EAC",
			restrict:"E",
			transclude: true,
			template:"<div>앵귤러 directive 적용내용<div>"
			
		}
	});
	
	//app.directive("sorInt")

</script>
</head>
<body ng-app="myapp">

	앵귤러 05 작업
	
	
	<myapp-data>234</myapp-data>
	<p>
	<div myapp-data></div>
	
	<div class="myapp-data"></div>
	
	<span ng-transclude></span>
	
	<sor-Int></sor-Int>
	
	<sss-data></sss-data>
	
	
	html에서 dom 관리하는 기능
	

</body>
</html>