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
		$scope.imsiName = "홍길동";
		$scope.realName = "아버지";
		$scope.showAlert = function(str){
			alert(str);
		}
	});
	
	
	
	
	

</script>
</head>
<body ng-app="myapp" ng-controller="appController">

	앵귤러 08 작업
	
	<form name="alform">
		<input type="email" name="emailName" ng-model="emailValue" required>
		<div ng-show="alform.emailName.$error.email">정상적인 이메일 주소를 입력해주세요.</div>
		
		<p>
		<input type="text" name="textName" ng-model="textValue" required>
		<div ng-show="alform.textName.$touched && alform.textName.$error.required">내용을 입력해주세요.</div>
		<div ng-show="alform.textName.$touched && alform.textName.$invalid">invalid를 이용한 내용을 입력해주세요</div>
		<div ng-show="alform.textName.$touched && alform.textName.$valid">내용이 정상적으로 입력이 되었습니다</div>
		<div ng-show="alform.textName.$dirty">내용이 변경되었습니다</div>
		
		<p>
		<!-- 
			ng-click,ng-mousedonwn, ng-mouseup, ng-mouseenter, ng-mouseleave, ng-keydown, ng-keyup, ng-dblclick
		 -->
		<input type="text" ng-mousedown="cnt=cnt+1">{{cnt}}
		
		<p>
		
		<input name="name2" ng-model="imsiName" ng-dblclick="showAlert('ng-dblclick 이벤트에서 발생')">
		
		<p>
		
		<input name="name3" ng-model="realName" ng-change="showAlert('내용이 변경되었습님다.')">
		
		
		
	</form>
		
		
		
	

</body>
</html>