<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>

	
	angular.module("myapp",[])
	.controller("myappCtrl",function($scope){
		$scope.itemData=[
			{first:'a',second:'6'},
			{first:'b',second:'5'},
			{first:'c',second:'4'},
			{first:'d',second:'3'},
			{first:'e',second:'2'},
			{first:'f',second:'1'}
			
		];
		
		$scope.orderExec = function(ot){
			$scope.orderType = ot;
		}
		
	});
	
	
	
	

</script>
</head>
<body ng-app="myapp" ng-controller="myappCtrl">

	앵귤러 10 작업
	
	<table>
		<tr>
			<td ng-click="orderExec('first')">영문자정렬</td>
			<td ng-click="orderExec('second')">숫자정렬</td>
		</tr>
		<tr ng-repeat="item in itemData | orderBy:orderType">
			<td>{{item.first}}</td>
			<td>{{item.second}}</td>
		</tr>
	</table>
		
		
		
	

</body>
</html>