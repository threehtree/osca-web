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
    <title>Request Detail</title>
</head>
<body>
    ${reqDtoOne}
    <br/>
    <br/>
    <table
            border="1"
            width="50%"
            height="200"
            cellspacing="5">
        <caption>표 제목</caption>
        <thead>
        <tr align="center" bgcolor="white">
            <td></td>
            <th>사용자 개인정보</th>
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
    ${comDtoList}
<br/>
<br/>
${listDTO}
</body>
</html>