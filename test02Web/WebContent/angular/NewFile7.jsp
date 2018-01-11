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
	app.controller('myappCtrl',function($scope){
		$scope.all="앵귤러";
		
		
	});
	
	
	
	
	
	

</script>
</head>
<body ng-app="myapp" ng-controller="myappCtrl">

	앵귤러 07 작업
	
	<input ng-model="all">  <strong> {{all}} </strong>
	
	<p>
		<input type="checkbox" ng-model="btnCheck">
		<input type="button" value="버튼1" ng-disabled="!btnCheck">
	
	<p>
		<input type="checkbox" ng-model="btnShow">
		<input type="button" value="버튼2" ng-show="btnShow">
		
	<p>
		<input type="button" value="버튼3" ng-click="cnt = cnt+1">	 {{cnt}}
		
		
		
	

</body>
</html>