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
	app.controller("personCtrl",personData);
	app.directive("myappData",myDataPrint);
	
	
	function personData($scope){
		var personData = [
			{name:"홍길동",place:"서울"},
			{name:"이순신",place:"여수"},
			{name:"노무현",place:"진도"}
		];
		$scope.persons = personData;
	}

	function myDataPrint(){
		return{
			restrict:"E",
			template:"<div>{{person.name +' /'}}  {{person.place}} </div>",
			link: function(scope,elements,attributes){
				elements.css('color','red');
				elements.css('font-size','30px');
				
			}
		}
	}
	
	
	
	

</script>
</head>
<body ng-app="myapp" ng-controller="personCtrl">

	앵귤러 06 작업
	
	<div ng-repeat="person in persons">
		<myapp-Data></myapp-Data>
	</div>
	
	
	

</body>
</html>