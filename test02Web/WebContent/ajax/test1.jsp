<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script language="javascript">
	
	function syncFun(){//동기화 : 작업의 순서가 순차적으로 정해져있음
		alert(1);//
		alert(2);//
		alert(3);//
	}
		
	function aSyncFun(){//비동기 : 순서와 관계없이 작업이 먼저 실행되는것
		alert(1);//
		setTimeout(function(){
			alert(2);
		},2000);
		alert(3);//
	}
	
</script>

</head>
<body>
ajax
	
  <input type="button" name="button" value="동기처리" onclick="javascript:syncFun()">
  <input type="button" name="button" value="비동기처리" onclick="javascript:aSyncFun()">
  	
  	
  	
  	
  	
  	
  


</body>
</html>
