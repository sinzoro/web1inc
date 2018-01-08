<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>document</title>
<script src="<%=request.getContextPath()%>/common/js/angular.min.js"></script>

  </head>
  <body>
    Angular 작업!<p>

    <div ng-app="">
        You write here => <input type="text" ng-model="myVal">
        <br>
        Values input  ===> {{myVal}}
    </div>
    <!--
    <div ng-app="" data-ng-init="firstName='John'">

    <p>The name is <span data-ng-bind="firstName"></span></p>

    </div>  -->
      <!-- <div ng-app="">
        <p>
          {{15+25}}
      </div> -->
    <div ng-app="" ng-init="initVall='2018'; secondVal='2019'">
    	<p ng-bind="initVal"></p>
    	<p ng-bind="secondVal"></p>
    </div>
    
    <!-- <p>Hello me</br>
    <p>
      Before you get start with AngularJS, version 1.x.x and version 4.x.x are not that differenct from eachother.<p> -->

  </body>
</html>