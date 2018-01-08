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
    
   앵귤러 03 작업
    
   <!-- <div ng-app="" ng-init="a=1;b=2;c=3">
   		<p>{{a+b+c}}
   </div> --> 
   -- 아래랑 충돌남 --
   
   <div ng-app="" data-ng-init="myData={first:'첫번째',second:'두번째',third:'세번째'}">
   		<p>{{myData.first}}
   		<p>{{myData.second}}
   		<p>{{myData.third}}
   </div>
   
   HTML5에서는 사용자정의 속성을 위해서 DATA속성(커스텀속성)을 만들었음
   
   HTML내에서는 data- 시작되며, HTML5 가 적용된 브라우저에서는 이를 해석하지않고 거너뜀(즉 이는 화면에 영향을 주지 않음)
   
   data- 속성(커스텀속성)은 생성갯수는 제한이 없음
   
   <iput type="text" style="" aaa="xxxx" >
   

  </body>
</html>