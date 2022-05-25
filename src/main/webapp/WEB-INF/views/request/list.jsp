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
                <th scope="col">NO</th>
                <th scope="col">계약명</th>

                <th scope="col">카테고리</th>
                <th scope="col">계약상태</th>
                <th scope="col">시공사</th>

            </tr>
            </thead>
            <tbody class="tableValue">
            <c:forEach items="${reqDto}" var="con" varStatus="modIdx">
            <tr>
                <td>${con.conNo}</td>
                <td><a href="/request/detail/${con.conNo}">${con.conName}</a></td>
                <td>${con.conCategory}</td>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conLocation}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conSpace}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conContent}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conRequest}</a></td>--%>
               <c:choose>
                <c:when test="${con.conCondition == 0}"> <td>입찰전</td></c:when>
                <c:when test="${con.conCondition == 1}"> <td>입찰중</td></c:when>
                <c:when test="${con.conCondition == 2}"> <td>계약전</td></c:when>
                <c:when test="${con.conCondition == 3}"> <td>계약 진행중</td></c:when>
                <c:when test="${con.conCondition == 4}"> <td>입금요청</td></c:when>
                <c:when test="${con.conCondition == 5}"> <td>계약완료</td></c:when>
                <c:otherwise><td>${con.conCondition}</td></c:otherwise>
                </c:choose>
<%--                todo 계약상태는 시공사 입찰 등록때 insert할때 같이 하면 될듯, 다른상태들도 이벤트리스너로 처리해서
                    그때마다 insert를 보내야할듯 --%>
                <td>${con.comId}</td>

<%--                                    <c:if test="${con.conCondition == '1'} ">--%>
<%--<h1>끄아아아아ㅏㅏ</h1>--%>
<%--                            </c:if>--%>
<%--                todo jstl if문으로 처리하면 될 것 같은데 아니면 처음부터 상태로 받아버려도 되고 --%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conStartDay}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conEndDay}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conPrice}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conDocument}</a></td>--%>
<%--                <td><a href="/request/detail/${con.conNo}">${con.conImg}</a></td>--%>
<%--todo 현재 오류나는 이유는 계약에 해당하는의뢰자가 없어서 그렇다 그럼 없을때를 생각해서 controller에서 미리 값을 확인하고 보내야하나?--%>
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

<ul class="pagination">
    <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
        </a>
    </li>

    <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
        <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
    </c:forEach>


    <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
        </a>
    </li>
</ul>

<%--${pageMaker}--%>
<%--<br/>--%>
<%--<br/>--%>
<%--${listDTO}--%>

<form class="actionForm" action="/request/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null?'':listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null? '':listDTO.keyword}">
</form>


${pageMaker}}
<%--/----------------------------------------------------%>
<script>
    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")


    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if(target.getAttribute("class") !== 'page-link'){
            return
        }

        const pageNum = target.getAttribute("href")
        actionForm.querySelector("input[name='page']").value = pageNum
        actionForm.setAttribute("action","/request/list")
        actionForm.submit()
    //todo 현재 진짜 end 값이 안되는데 size를 넘기는 부분이
        //reply보면 post로 되어있네 넘겨주는 부분이 필요해
    },false)


    //    ========================================================================================

</script>

</body>
</html>
