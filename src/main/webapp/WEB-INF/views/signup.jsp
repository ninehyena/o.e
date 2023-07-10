<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<form>
	<table>
		<tr>
			<td>아이디</td>
			<td><input name="id" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pw" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input name="pwchk" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input name="nickname" placeholder="닉네임을 입력하세요"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input name="email" placeholder="이메일을 입력하세요"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input name="add1"></td>
			<td><input name="add2"></td>
			<td><input name="add3" placeholder="나머지 주소를 입력하세요"></td>
		</tr>
	</table>
</form>
</body>
</html>