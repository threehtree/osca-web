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
<%--<c:if test="${reqDtoOne.comId != null}">--%>
<h1>${reqDtoOne.comId}</h1>
<%--</c:if>--%>
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
            <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comName}</a></td>
        </tr>
        <tr align="center" bgcolor="white">
            <td>전화번호</td>
            <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comPhone}</a></td>
        </tr>
        <tr align="center" bgcolor="white">
            <td>E-mail</td>
            <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.comEmail}</a></td>
        </tr>
        <tr align="center" bgcolor="white">
            <td>사업자번호</td>
            <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.businessNum}</a></td>
        </tr>
        <tr align="center" bgcolor="white">
            <td>소개글</td>
            <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.conProfile}</a></td>
        </tr>
<%--        <tr align="center" bgcolor="white">--%>
<%--            <td>입찰금액</td>--%>
<%--            <td><a href="/request/detail/${comDtoOne.conNo}">${comDtoOne.conProfile}</a></td>--%>
<%--        </tr>--%>
<%--        todo 입찰금액을 잠깐 담아둘 컬럼이 필요할듯--%>


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


    <c:if test="${reqDtoOne.comId != null}">
        <c:if test="${reqDtoOne.conCondition != '계약중' }">
            <form action="/request/contract" method="post">
                <input type="hidden" name="conNo" value="${reqDtoOne.conNo}">
                <input type="hidden" name="comId" value="${comDtoOne.comID}">
                <button>계약하기</button>
                    <%--    이 버튼이 눌러지면 시공사와 계약의 상태가 바뀌는 update문이 필요 --%>
            </form>
        </c:if>


            <c:if test="${reqDtoOne.conCondition == '계약중' }">
                <form action="" method="post">
                    <input type="hidden" name="conNo" value="${reqDtoOne.conNo}">
                    <input type="hidden" name="comId" value="${comDtoOne.comID}">
                    <button>승인하기</button>
            </c:if>

<%--        todo 계약단계가  계약전, 계약중, 시공완료, 계약완료  --%>
<%--        현재 varchar로 잡혀있는데 int로 바꾸던지 해야할듯 --%>


        <form action="/request/delContract" method="post">
            <input type="hidden" name="conNo" value="${reqDtoOne.conNo}">
            <button>거부하기</button>
                <%--            todo 현재 null 거부 버튼시 '' 를 보내고 있는데 null로 바꿔야 하나 기본값을''로 해야하나 --%>
                <%--    이 버튼이 눌러지면 시공사와 계약의 상태가 바뀌는 update문이 필요 --%>

                <%--    입찰금액은 입찰을 참여햇을때 --%>
                <%--    시공사의 현재상태?? --%>
        </form>
    </c:if>

</c:if>

<%--<c:if test="${reqDtoOne.comId == null}">--%>
<%--<form action="/request/modify" method="get">--%>
<%--    <input type="hidden" name="conNo" value="${reqDtoOne.conNo}">--%>
<%--    <button>수정하기</button>--%>
<%--    </c:if>--%>

    <c:if test="${reqDtoOne.comId == null}">
    <form action="/request/comid" method="post">
        <input type="hidden" name="conNo" value="${reqDtoOne.conNo}">
        <input type="text" name="comId" placeholder="시공사의 ID를 입력해주세요">
        <button type="submit">입찰하기</button>
<%--//todo 5.25 지금 처리 안된게 위의 버튼 누르면 post로 전달되는게 get까지 되는것과, 입찰페이지에 임의로 시공사 id넣게 되어있는데 그거 서로 안맞아서 안보이는 문제 --%>
    </c:if>
<%--    계약전이면 수정가능해야겟지..--%>

<br/>
<br/>
<%--    <h1><c:if test="${comDtoOne}">hi</c:if></h1>--%>
<br/>
<br/>
${pageMaker}
<h1>${checkDto}</h1>
</body>
</html>
