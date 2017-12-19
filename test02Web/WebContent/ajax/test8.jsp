<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 

<script language="javascript">
	
	function loadAjax() {
		
		
		
		//console.log("params Data:",JSON.stringify(params));
		//return;
		console.log("before start");
		$("#frm").ajaxForm({
			async : false,
			cache:false,
			type:"POST", //전송방식을 정하는 메쏘드
			url	:"./ajax8.jsp", //보낼페이지
			
			dataType:"JSON", 
			beforeSend:function(){
				//alert("1");
				console.log("beforeSend");
			},
			
			success: function(data){
				console.log("성공 data : " + JSON.stringify(data));
				$("#disp").html("서버에서 받은 값 :<B>" + data.name+"</B>");
			},
			error: function(xhr, status, error){
				console.log("실패");
				console.log("xhr:"+JSON.stringify(xhr));
				console.log("status:"+status);
				console.log("error:"+error);
			},
			complete: function(event, request, settings){ //마지막에 무조건 실행
				console.log("완료");
				console.log("event : " + JSON.stringify(event));
				console.log("request : " + request);
				console.log("settings : " + settings);
			}

		}).submit();
		
		console.log("End line");
		
	};
	
</script>

</head>
<body>


	<h1>ajax 예제(xml 데이타)</h1>
	
	<div id="report">
	
	</div>
	
	
	<p>
	
	<input type="button" value="ajax10 확인" onclick="javascript:loadAjax()">
	<form id="frm">
	<p>
		num : <input type="text" name="num">
	<p>
		name : <input type="text" name="name">
	</form>

</body>
</html>

