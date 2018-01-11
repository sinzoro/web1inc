<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>document</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<script>

	
	
	

</script>

  </head>
  <body>
        
        앵귤러 작업 04
 
        
        <!-- <div ng-app="" ng-init="menu=['menu01','menu02','menu03','menu04']">
            <li>{{menu[0]}}</li>
            <li>{{menu[1]}}</li>
            <li>{{menu[2]}}</li>
            <li>{{menu[3]}}</li>
        </div> -->
       
        
        
        <!-- <div ng-app="" ng-init="menu=['menu01','menu02','menu03','menu04']">
            <ul>
                <li ng-repeat="temp in menu">{{temp}}</li>
            </ul>
        </div> -->
        
        
        <div ng-app="" ng-init="myArr=[{firstName:'홍',secondName:'길동'},{firstName:'이',secondName:'순신'},{firstName:'강',secondName:'감찬'}]">
            <ul>
                <li ng-repeat="temp in myArr">{{temp.firstName + '' + temp.secondName}}</li>
            </ul>
        </div>
        
    </body>

</html>