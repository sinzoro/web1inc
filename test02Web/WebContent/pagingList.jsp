<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Paging</title>
</head>
<body>

	<form action=PagingListRst3 method="post">
	<!-- <form action=PagingListRst2 method="post"> -->
	<!-- <form action=PagingListRst method="post"> -->
		<table  border="0">
			<tr>
				<td colspan="2" align="center">�Խù� ���� ������</td>
			</tr>
			<tr>
				<td>��ü�Խù� ����</td>
				<td><input type="text" name="allCount" value="152"></td>
			</tr>
			<tr>
				<td>�������� �Խù� ����</td>
				<td><input type="text" name="pageContentCount" value="6"></td>
			</tr>
			<tr>
				<td>�������� ���̴� ������ ��</td>
				<td><input type="text" name="pageViewMaxCount" value="6"></td>
			</tr>
			<tr>
				<td>���� ������</td>
				<td><input type="text" name="selectPageNum" value="1"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="���"></td>
			</tr>
		</table>

	</form>

</body>
</html>