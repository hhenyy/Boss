<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 폼</title>
</head>
<body class="is-preload">
<div class="container" align="center">
		<h2>공지사항</h2>
		<div class="inner">
		<form action="masterNoticeUpdate.do" method="post" enctype="multipart/form-data" target="repacatFrame">
			<table class="table table-hover">
				<tr>
					<td>제목</td>
					<td><input type="text" size="52" maxlength="50" name="mnTitle"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type = "file" name="mnOriFile1"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="50" rows="10" name="mnContent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" style="margin-left:325px" value="확인">
					<input type="reset" style="margin-left:5px" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>