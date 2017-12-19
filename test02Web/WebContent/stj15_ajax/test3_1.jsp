<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script language="javascript">
	
	function loadAjax() {
		
		var jsonData={};
		jsonData.cmd='ajaxListData';
		jsonData.viewPage = '2';
		jsonData.test333 = '333ttt';
		alert( jsonData.cmd );
		
		jQuery.ajax({
			type : "POST",
			//url : "test02Web/BoardAction",
			url	:"./ajax3_1.jsp", //보낼페이지
			//data : {"sendData":params},
			//data : {"jey":params},
			//data : {"params":JSON.stringify(params)},
			
			data:jsonData,
			dataType:"JSON",
			success: function(data){
				//alert("s");
				alert( data );
				//console.log("성공 data:"+data);
				//var retVal = JSON.parse(data);
				$("#disp").html("서버에서 받은값:<B>"+data.name+"</B>");
				//alert("sc");
			},
			error: function(xhr, status, error){
				console.log("실패");
				console.log("xhr:"+JSON.stringify(xhr));
				console.log("status:"+status);
				console.log("error:"+error);
			},
			complete: function(event, request, settings){ //마지막에 무조건 실행
				console.log("완료");
				console.log("event : " + JSON.stringify(event));//json객체의 정보를 담아봐서 보여준다 readyState이 들어오는데... 
																//0:정보를 전달할 request 객체는 형성이 되었지만 시직할open()이전상태
																//1:request객체도생성, open()되었지만 아직 값을 전달할 send()가 시작되이 않음
																//2:send()후 아직 서버에서 데이터를 받지 못한 상태
																//3:데이터를 일부 받은 상태
																//4:데이터 전체 수신 완료
																//responseText : 서버에서 보낸 텍스트
																//status : 200이면 성공이라 본다 
				console.log("request : " + request);
				console.log("settings : " + settings);
			}

		});
	}
	
</script>

</head>
<body>


	<form>
	
		<input type="text" name="num" >
		<input type="text" name="name" >
		<input type="button" name="button" value="ajax"	onclick="javascript:loadAjax()">
			
		<p>
		<div id="disp">111</div>

	</form>


</body>
</html>

