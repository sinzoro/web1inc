<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paging</title>
</head>
<body>

	<form action=PagingListRst3 method="post">
	<!-- <form action=PagingListRst2 method="post"> -->
	<!-- <form action=PagingListRst method="post"> -->
		<table  border="0">
			<tr>
				<td colspan="2" align="center">게시물 생성 데이터</td>
			</tr>
			<tr>
				<td>전체게시물 갯수</td>
				<td><input type="text" name="allCount" value="152"></td>
			</tr>
			<tr>
				<td>페이지당 게시물 갯수</td>
				<td><input type="text" name="pageContentCount" value="6"></td>
			</tr>
			<tr>
				<td>페이지당 보이는 페이지 수</td>
				<td><input type="text" name="pageViewMaxCount" value="6"></td>
			</tr>
			<tr>
				<td>선택 페이지</td>
				<td><input type="text" name="selectPageNum" value="1"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="출력"></td>
			</tr>
		</table>

	</form>

</body>
</html>