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
                <th><a href="/request/detail/${con.conNo}">${con.conNo}</a></th>

                <td><a href="/request/detail/${con.conNo}">${con.conName}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conCategory}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conLocation}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conSpace}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conContent}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conRequest}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conCondition}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conStartDay}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conEndDay}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conPrice}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conDocument}</a></td>
                <td><a href="/request/detail/${con.conNo}">${con.conImg}</a></td>

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
<%--/----------------------------------------------------%>
<script>



//    ========================================================================================

</script>

</body>
</html>
