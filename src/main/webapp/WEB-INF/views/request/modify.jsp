<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2022-05-24
  Time: 오후 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>계약전 수정</title>
</head>
<>
<table
        border="1"
        width="50%"
        height="200"
        cellspacing="5">
    <thead>
    <tr align="center" bgcolor="white">
        <td></td>
        <th>입찰 상세내용</th>
    </tr>
    </thead>

    <tbody>
    <tr align="center" bgcolor="white">
        <th>No</th>
        <th>${reqDtoOne.conNo}</th>
    </tr>
    <tr align="center" bgcolor="white">
        <td>계약명</td>
        <td>${reqDtoOne.conName}</td>
    </tr>
    <tr align="center" bgcolor="white">
        <td>공사분야</td>
        <td>${reqDtoOne.conCategory}</td>


    </tr>
    <tr align="center" bgcolor="white">
        <td>공사위치</td>
        <td>${reqDtoOne.conLocation}</td>


    </tr>

    <tr align="center" bgcolor="white">
        <td>공사범위</td>
        <td>${reqDtoOne.conSpace}</td>

    </tr>

    <tr align="center" bgcolor="white">
        <td>공사내용</td>
        <td>${reqDtoOne.conContent}</td>


    </tr>

    <tr align="center" bgcolor="white">
        <td>요청사항</td>
        <td>${reqDtoOne.conRequest}</td>

    </tr>

    </tbody>
</table>

<form action="/request/modify" method="post">
<%--   todo 뭐가 문제냐고!!!!--%>
<span>계약번호</span>
<input type="text" name="conNo" value="${reqDtoOne.conNo}" readonly>
<span>계약명</span>
<input type="text" name="conName" value="${reqDtoOne.conName}">
<span>공사분야</span>
<input type="text" name="conCategory" value="${reqDtoOne.conCategory}">
<span>공사위치</span>
<input type="text" name="conLocation" value="${reqDtoOne.conLocation}">
<span>공사범위</span>
<input type="text" name="conSpace" value="${reqDtoOne.conSpace}">
<span>공사내용</span>
<input type="text" name="conContent" value="${reqDtoOne.conContent}">
<span>요청사항</span>
<input type="text" name="conRequest" value="${reqDtoOne.conRequest}">

<button>수정완료</button>
</form>





</body>
</html>
