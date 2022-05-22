<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2022-05-21
  Time: 오후 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<%--    너무 잦은 복붙의 폐해--%>
<%--    <h1>${comDtoList[0]}</h1>--%>

    <table>
        <thead>
        <tr>
            <th scope="col">계약번호</th>
            <th scope="col">계약명</th>

            <th scope="col">카테고리</th>
            <th scope="col">공사주소</th>

        </tr>
        </thead>
        <tbody class="tableValue">
        <c:forEach items="${comDtoList.dtoList}" var="com" varStatus="modIdx">
        <tr>
            <th><a href="/request/detail/${com.conNo}">${com.conNo}</a></th>
            <td><a href="/request/detail/${com.conNo}">${com.comID}</a></td>
            <td><a href="/request/detail/${com.conNo}">${com.comName}</a></td>
            <td><a href="/request/detail/${com.conNo}">${com.comPhone}</a></td>
            <td><a href="/request/detail/${com.conNo}">${com.comEmail}</a></td>
<%--            <td><a href="/request/detail/${com.conNo}">${com.comAddress}</a></td>--%>
<%--            todo 이건 왜 오류가 뜨지 --%>
            <td><a href="/request/detail/${com.conNo}">${com.businessNum}</a></td>
            <td><a href="/request/detail/${com.conNo}">${com.comIntro}</a></td>
            <td><a href="/request/detail/${com.conNo}">${com.comCategory}</a></td>
<%--            <td><a href="/request/detail/${com.conNo}">${com.conNo}</a></td>--%>
            <td><a href="/request/detail/${com.conNo}">${com.conProfile}</a></td>

            </c:forEach>
        </tbody>
    </table>
<br/>
<br/>
${listDTO}
    <br/>
    <br/>
${pageMaker}
</body>
</html>
