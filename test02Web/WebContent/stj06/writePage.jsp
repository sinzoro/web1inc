<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/style.css" type="text/css" />
  <title>write page sample</title>
  
  <script language='javascript' >
  	  function sendList(){
		 //alert('a');
		 //location.href='./table.jsp';
		 //location.submit;
  		 window.history.back();
	  }
  </script>
  
</head>
<body>
  <div class="wrap">
    <form action="./writePagePro.jsp">
      <div class="input_wrapper">
        <div class="title_wrap">
          <label for="title">제목</lable>
        </div>
        <div class="input_wrap">
          <input type="text" id="title" name=title class="input_title">
        </div>
      </div>
      <div class="input_wrapper">
        <div class="title_wrap">
            <label for="name">작성자</lable>
        </div>
        <div class="input_wrap">
          <input type="text" id="name" name=name>
        </div>
      </div>
      <div class="cont_wrapper">
        <div class="title_wrap">
          <label for="content">내용</lable>
        </div>
        <textarea name="content" rows="10" cols="100" placeholder="내용입력" title="내용입력" id="content"></textarea>
      </div>
      <div class="submit_wrapper">
      	<input type="submit" value="확인" class="unrole_btn">
      </div>
      <div style='text-align:right'>
   		<input type="button" onclick='sendList()' value="list" style='text-align:right;background-color:green'>
      </div>
    </form>
  </div>
</body>
</html>