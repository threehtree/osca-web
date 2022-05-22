<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2022-05-21
  Time: 오후 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Write</title>
</head>
<body>
<h3>Write</h3>

<form action="/request/write" method="post">
<%--    TODO 나중에 시큐리티의 쿠키에서 memId값을 가져와야함 --%>
    <input type="hidden" name="memId" value="123">
    <input type="text" name="conName" value="계약명">
    <input type="text" name="conCategory" value="공사분야">
    <input type="text" name="conLocation" value="공사 위치">
    <input type="text" name="conSpace" value="공사 범위">
    <input type="text" name="conContent" value="공사 내용">
    <input type="text" name="conRequest" value="요청 사항">
    <input type="hidden" name="conCondition" value="계약 전">
    <input type="text" name="conStartDay" value="공사 시작">
    <input type="text" name="conEndDay" value="공사 종료">
    <input type="text" name="conPrice" value="계약 가격">
    <input type="text" name="conDocument" value="계약 문서">
    <input type="text" name="conImg" value="계약 사진">
<%--    <input type="text" name="comState" value="공사 위치">--%>
<%--    TODO 이거 comState 맞나요?--%>



<%--    <input type="text" name="conSpace" value="공사영역">--%>
    <button>계약서 등록</button>
</form>
</body>
</html>
