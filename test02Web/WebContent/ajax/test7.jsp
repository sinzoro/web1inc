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
		
		/* var jsonData = {"name":"my Company","employees":[
			{"name":"brawon","age":"30","sex":"M"}
			,{"name":"kelli","age":"29","sex":"M"}
			,{"name":"John","sex":"M"}
			,{"name":"Jane","age":"20"}
			]
		}; */
		
		var params = [{
	        "age": 44,
	        "name": "James Martin",
	        "daughters": [{
	            "age": 24,
	            "name": "Michelle",
	            "husband": {
	                "age": 30,
	                "name": "Matthew"
	            }
	        }, {
	            "age": 30,
	            "name": "Angela",
	            "husband": {
	                "age": 23,
	                "name": "William"
	            }
	        }]
		}]
		
		//console.log("params Data:",JSON.stringify(params));
		//return;

		jQuery.ajax({
			type : "POST",
			url : "./ajax7.jsp",
			//data : {"sendData":params},
			//data : {"jey":params},
			data : {"params":JSON.stringify(params)},
			dataType: "json",
			success : function(data) {
				//alert("s");
				console.log("성공 data:"+data);
				//var retVal = JSON.parse(data);
				$("#disp").html("서버에서 받은값:<B>"+data.name+"</B>");
				
			},
			error : function(xhr, status, error) {
				//alert("e");
				console.log("실패");
				console.log("xhr:"+JSON.stringify(xhr));
				console.log("status:"+status);
				console.log("error:"+error);
			},
			complete : function( event, request, settings ) {
				//alert("c");
				console.log("완료");
				console.log("event:"+event);
				console.log("event:"+JSON.stringify(event));
				console.log("request:"+request);
				console.log("settings:"+settings);
				
				//0: 정보를 전달할 request객체는 생성이 되었지만 시작할 open()이전상태
				//1: request 객체도 생성, open()되어있지만 아직 값을 전달할 send()
				//2: send() 했지만 서버에서 데이타를 전달 받지 못한 상태
				//3: 데이터를 일부 받았음
				//4: 데이타 전체 수신
				
			}

		});
	}
	
</script>

</head>
<body>


	<form>
	
		<input type="text" name="num" >
		<input type="text" name="name" >
		<input type="button" name="button" value="ajax"
			onclick="javascript:loadAjax()">
			
		<p>
		<div id="disp">111</div>

	</form>


</body>
</html>

