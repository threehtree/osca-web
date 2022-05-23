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

    <br/>
    <br/>
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

<%--    너무 잦은 복붙의 폐해--%>
<%--    <h1>${comDtoList[0]}</h1>--%>
<br/>
    <br/>
    <c:if test="${comDtoOne != null}">
<%--        입찰한 시공사가 있을때 는 보여주고 없으면 안보여준다 --%>
<%--    todo sql구문 자체가 없을때는 틀어주지를 말아야하나  아닌데...--%>
    <table
            border="1"
            width="50%"
            height="200"
            cellspacing="5">

        <thead>
        <tr align="center" bgcolor="white">
            <td></td>
            <th>입찰 시공사</th>
        </tr>
        </thead>


<%--        --%>
<%--        --%>
<%--        --%>
        <tbody>

        <tr align="center" bgcolor="white">
        <td>시공사</td>
        <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comName}</a> </td>
        </tr>
        <tr align="center" bgcolor="white">
        <td>전화번호</td>
        <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comPhone}</a> </td>
        </tr>
        <tr align="center" bgcolor="white">
        <td>E-mail</td>
        <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comEmail}</a> </td>
        </tr>
        <tr align="center" bgcolor="white">
        <td>사업자번호</td>
        <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.businessNum}</a> </td>
        </tr>
        <tr align="center" bgcolor="white">
        <td>소개글</td>
        <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.conProfile}</a> </td>
        </tr>


<%--            <tr>--%>
<%--                <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comName}</a> </td>--%>

<%--                <td>${comDtoOne.comName}</td>--%>
<%--                <td>${comDtoOne.comPhone}</td>--%>
<%--                <td>${comDtoOne.comEmail}</td>--%>
<%--                <td>${comDtoOne.businessNum}</td>--%>
<%--                <td>${comDtoOne.conProfile}</td>--%>
<%--&lt;%&ndash;                todo 이거 con이아니라 com맞을까요?&ndash;%&gt;--%>
<%--            </tr>--%>

        </tbody>
            </table>
            <button>계약하기</button>
        <%--    이 버튼이 눌러지면 시공사와 계약의 상태가 바뀌는 update문이 필요 --%>
            <button>거부하기</button>
        <%--    이 버튼이 눌러지면 시공사와 계약의 상태가 바뀌는 update문이 필요 --%>

        <%--    입찰금액은 입찰을 참여햇을때 --%>
        <%--    시공사의 현재상태?? --%>
    </c:if>
<br/>
<br/>
<%--    <h1><c:if test="${comDtoOne}">hi</c:if></h1>--%>
    <br/>
    <br/>
${pageMaker}
    <h1>${checkDto}</h1>
</body>
</html>
