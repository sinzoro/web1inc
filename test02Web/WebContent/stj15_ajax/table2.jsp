<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="com.board15.entity.BoardEntity15"%>
<%@ page import="java.util.ArrayList"%>

<%
	ArrayList bList = (ArrayList) request.getAttribute("bList");
	String getPaging = request.getAttribute("getPaging").toString();
	String search_word = request.getAttribute("search_word").toString();
	String field = request.getAttribute("field").toString();

	String viewPage = request.getAttribute("viewPage").toString();

	//String listAjax = request.getAttribute("listAjax").toString();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>table sample</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/stj15_ajax/css/style.css"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script language="javascript" charset="UTF-8">

	function loadAjax( selNum ) {
		
		//alert( selNum );
		
		var jsonData={};
		jsonData.cmd='ajaxListData';
		jsonData.viewPage = selNum;
		jsonData.field = document.getElementById("field").value;
		jsonData.search_word = document.getElementById("search_word").value;
		
		
		//alert( jsonData.search_word );
		//alert( jsonData.cmd );
		
		
		jQuery.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/BoardAction15",
			//url	:"/test02Web/stj15_ajax/ajax3_1.jsp", //보낼페이지
			//data : {"sendData":params},
			//data : {"jey":params},
			//data : {"params":JSON.stringify(params)},
			
			data:jsonData,
			dataType:"JSON",
			success: function(data){
				
				//alert(data);
				//alert( JSON.stringify(  data.getPaging ) );
				
				//document.write( str );
				//document.write( data.boardList[0]+"<br>" );
				//document.write( JSON.stringify(  data.boardList[0] )+"<br>" );
				//document.write( JSON.stringify(  data.boardList[1] )+"<br>" );
				//document.write( data.getPaging.toString()+"<br>" );
				//document.write( JSON.stringify(  data.getPaging )+"<br>" );
				
				pagingSet = document.getElementById("pagingSet");
				pagingSet.innerHTML = "";
				pagingSet.innerHTML = data.getPaging;//JSON.stringify(   );
				
				
				///
				var ajaxListTbody = document.getElementById("ajaxListTbody");
				ajaxListTbody.innerHTML = "";
				
				for( var i=0; i<data.boardList.length;i++ ){
					
					var jsontext = JSON.stringify( data.boardList[i] );
					var contact = JSON.parse(jsontext);
					
					var InsertRowIndex = ajaxListTbody.rows.length;
					var row = ajaxListTbody.insertRow(InsertRowIndex);
					
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
					cell1.innerHTML = contact.num;
					cell2.innerHTML = contact.boardTitle;
					cell3.innerHTML = contact.boardContent;
					cell4.innerHTML = contact.createDate;
					cell5.innerHTML = contact.boardClickCnt;
					
				}
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

<script language='javascript' charset="UTF-8">

	function boardInsertSubmit(){
		
		document.getElementById('cmd').value = 'insertPage';
		document.getElementById('form3').action = '<%=request.getContextPath()%>/BoardAction15';
		//document.getElementById('form3').submit();
		
	}

	function boardDetailSubmit( selNum ){
		
		//alert( '' );
		
		document.getElementById('cmd').value = 'detail';
		document.getElementById('selNum').value = selNum;
		document.getElementById('form3').action = '<%=request.getContextPath()%>/BoardAction15';
		//document.getElementById('form3').submit();
		//document.forms[0].submit();

	}

</script>



</head>
<body>

	<form id="form3" name="form3"
		action="<%=request.getContextPath()%>/BoardAction15" method='post'>
		<input type="hidden" id="cmd" name='cmd' value="select"> <input
			type="hidden" id="selNum" name='selNum' value="">
		<div class="wrap">
			<h2>
				게시판<%=viewPage%></h2>
			<fieldset>
				<div class="search_form">
					<legend class="a11y_hidden">게시판 목록 검색</legend>
					<select name="field" id="field" title="분류선택">
						<option value=board_title
							<%=(field.equals("board_title") ? "selected" : "")%>>제목</option>
						<option value="board_name"
							<%=(field.equals("board_name") ? "selected" : "")%>>작성자</option>
						<option value="board_content"
							<%=(field.equals("board_content") ? "selected" : "")%>>내용</option>
					</select> <input id="search_word" name="search_word" id="search_word" class="inp_type"
						title="검색어 입력" value="<%=search_word%>" type="text"> <a
						href="javascript:{}"
						onclick="document.getElementById('form3').submit();"
						class="inp_btn"><span>검색하기</span></a>
				</div>
			</fieldset>
			<table>
				<caption class="a11y_hidden">게시판으로 번호 제목 작성자 작성일 조회수를 나타내는
					표</caption>
				<colgroup>
					<col style="width: 10%">
					<col>
					<col style="width: 15%">
					<col style="width: 12%">
					<col style="width: 9%">
					<col style="width: 9%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody id="ajaxListTbody">
					<%
						for (int i = 0; i < bList.size(); i++) {
					%>
					<tr>
						<td><%=((BoardEntity15) bList.get(i)).getBoardNum()%></td>
						<td><%=((BoardEntity15) bList.get(i)).getBoardTitle()%></td>
						<th scope="row"><a
							href="javascript:boardDetailSubmit('<%=((BoardEntity15) bList.get(i)).getBoardNum()%>')"><%=((BoardEntity15) bList.get(i)).getBoardContent()%></a>
						</th>
						<td><%=((BoardEntity15) bList.get(i)).getCreateDate()%></td>
						<td><%=((BoardEntity15) bList.get(i)).getBoardClickCnt()%></td>
					</tr>
					<%
						}
					%>


				</tbody>
			</table>
			<div class="unrole">
				<input type="button" name="button" value="ajax"
					onclick="javascript:loadAjax()"> <a
					href="javascript:boardInsertSubmit()" title="글등록"
					class="unrole_btn"><span>등록</span></a>
			</div>
			<div id="pagingSet">
				<!-- paging insert -->
				<%=getPaging %>
			</div>
		</div>
	</form>
</body>
</html>


