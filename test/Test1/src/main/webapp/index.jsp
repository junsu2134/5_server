<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<body>
    <h1>회원 정보 조회</h1>
    <form action="selectUser" method="GET">
        회원 번호: <input type="number" name="userNo" required>
        <button type="submit">조회하기</button>
    </form>
</body>
</html>