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
    <title>Title</title>

</head>
<body>
${reqDto}
<h3>list</h3>
<h3>-----------------------------------------------</h3>
<%--<h3>${isEmpty}</h3>--%>

<c:choose>
    <c:when test="${!isEmpty}">
        <form action="/request/write" method="get">
            <button>의뢰하기</button>
        </form>
        <table>
            <thead>
            <tr>
                <th scope="col">No.</th>
                <th scope="col">계약명</th>

                <th scope="col">카테고리</th>
                <th scope="col">공사주소</th>

            </tr>
            </thead>
            <tbody class="tableValue">
            <c:forEach items="${reqDto}" var="con" varStatus="modIdx">
            <tr>
                <th>${con.conNo}</th>

                <td>${con.conName}</td>
                <td>${con.conCategory}</td>
                <td>${con.conLocation}</td>
                <td>${con.conSpace}</td>
                <td>${con.conContent}</td>
                <td>${con.conRequest}</td>
                <td>${con.conCondition}</td>
                <td>${con.conStartDay}</td>
                <td>${con.conEndDay}</td>
                <td>${con.conPrice}</td>
                <td>${con.conDocument}</td>
                <td>${con.conImg}</td>

            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <h3>인테리어 시공을 의뢰하세요</h3>
        <form action="/request/write" method="get">
            <button>의뢰하기</button>
        </form>
    </c:otherwise>
</c:choose>

</body>
</html>
