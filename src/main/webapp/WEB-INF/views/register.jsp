<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2022-05-25
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>의뢰자 회원가입</title>
</head>
<body>
<form action="/register" method="post">
    <%--    TODO 나중에 시큐리티의 쿠키에서 memId값을 가져와야함 --%>
        <p>이름</p>
    <input type="text" name="memName" placeholder="이름">
        <p>ID</p>
    <input type="text" name="memID" placeholder="ID">
        <p>PW</p>
    <input type="text" name="memPW" placeholder="PW">
        <p>전화번호</p>
    <input type="text" name="memPhone" placeholder="전화번호">
        <p>E-mail</p>
    <input type="text" name="memEmail" placeholder="E-mail">
        <p>프로필</p>
    <input type="text" name="memProfile" placeholder="프로필">
        <p>생일</p>
    <input type="text" name="memBirth" placeholder="생일">
        <p>주소</p>
    <input type="text" name="memAddress" placeholder="주소">

        <button>회원가입 등록</button>
</form>
</body>
</html>
