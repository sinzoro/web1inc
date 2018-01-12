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
		app.controller("appController",function($scope){
		
		$scope.tempData = [
			{first:"2017",second:"korea"},
			{first:"2018",second:"america"},
			{first:"2019",second:"japan"},
			{first:"2020",second:"china"}
			
		];
		$scope.moneyValue=60;
		$scope.today = new Date();
		$scope.tempArray = ['korea','america','japan','china'];
		
		$scope.checkKorea = function(data){
			
			return data.second == "korea";
		};
		$scope.keyValue=[
			{key:'first',value:'2017'},
			{key:'second',value:'2018'},
			{key:'third',value:'2019'}
		]
		
	});
	
	
	
	

</script>
</head>
<body ng-app="myapp" ng-controller="appController">

	앵귤러 09 작업
	
	<ul>
		<li>test1</li>
	</ul>
	
	<ul>
		<li ng-repeat="item in tempData | orderBy:'second'">{{item.first + ":" + item.second}}</li>
	</ul>
	<ul>
		<li ng-repeat="item in tempData | filter:'korea'">{{item.first + ":" + item.second}}</li>
	</ul>	
	
	<ul>
		<li ng-repeat="item in tempData | filter:checkKorea">{{item.irst + ":" + item.second}}</li>
	</ul>	
		
	<input type="text" ng-model="inputChar">
	<ul>
		<li ng-repeat="item in tempArray | filter:inputChar">{{item}}</li>
	</ul>
	
	<p>	
	{{moneyValue | currency:'$'}}

	<p>
	{{today | date:'yyyy-MM-dd HH:mm:ss'}}

	<p>
	{{'hong gil dong' | uppercase}}
	
	<p>
	{{'HONG GI DONG' | lowercase}}
	
	<p>
	{{123.4455 | number:2}}

	<p>
	{{1234567890 | limitTo:5}}
	
	<p>
	{{1234567890 | limitTo:-5}}
	
	<p>
	<select>
		<option ng-repeat="item in keyValue" value="{{item.key}}">{{item.value}}</option>
	</select>


</body>
</html>




