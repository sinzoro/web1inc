<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>document</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<script>

	var thisApp = angular.module('thisAppModule',[]);
	thisApp.controller('thisAppController',function($scope){
		$scope.firstVal = '첫번째값';
		$scope.secondVal = '두번째값';
		
	});
	
	

</script>

  </head>
  <body>
    
   앵귤러 02 작업
    - 익스 안됨 크롬 에서 됨
    <div ng-app="thisAppModule" ng-controller="thisAppController" ng-init="color='red'">
    	<p><input type="text" ng-model="firstVal">
    	<p><input type="text" ng-model="secondVal">
    	<p><input type="text" style="background-Color:{{color}}" value="{{color}}">
    	<p>{{firstVal + ":" + secondVal }}
    </div>
    

  </body>
</html>