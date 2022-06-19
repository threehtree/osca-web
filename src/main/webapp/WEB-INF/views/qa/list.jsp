<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="layoutSidenav">

<div id="layoutSidenav_content" class="vw-100">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Q&A</h1>
                <ol class="breadcrumb mb-4">
<%--                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>--%>
<%--                    <li class="breadcrumb-item active">Tables</li>--%>
                </ol>

                <div class="card mb-4">
                    <div class="card-body">
<%--                        <table id="datatablesSimple">--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th>번호</th>--%>
<%--                                <th>제목</th>--%>
<%--                                <th>글쓴이</th>--%>
<%--                                <th>등록일자</th>--%>
<%--                                <th>답변유무</th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tfoot>--%>

<%--                            </tfoot>--%>
<%--                            <tbody class="reqMemList">--%>
<%--                            ${qaDTO}--%>
<%--                            <tr>--%>
<%--                                <td class="req-link">${qaDTO.qaNo}</td>--%>
<%--                                <td class="req-link">${qaDTO.qaTitle}</td>--%>
<%--                                <td class="req-link">${qaDTO.qaWriter}</td>--%>
<%--                                <td class="req-link">${qaDTO.regDate}</td>--%>
<%--                                <td class="req-link">${qaDTO.qaDelFlag}</td>--%>


<%--                            </tr>--%>

<%--                            </tbody>--%>
<%--                        </table>--%>


<%--    =======================================================================--%>
    <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">

        <div class="dataTable-container">

            <table id="datatablesSimple" class="dataTable-table">

                <thead>

                <tr>
                    <th><div class="dataTable-sorter">번호</div></th>
                    <th><div class="dataTable-sorter">제목</div></th>
                    <th><div class="dataTable-sorter">글쓴이</div></th>
                    <th><div class="dataTable-sorter">등록일자</div></th>
                    <th><div class="dataTable-sorter">댓글수</div></th>
                    <th><div class="dataTable-sorter">답변유무</div></th>
                </tr>
                </thead>


                <tbody class="qaBoardList">
                <c:forEach items="${qaDTO}" var="qaDTO">
                    <tr>


                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaNo}</td>
                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaTitle}</td>
                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaWriter}</td>
                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.regDate}</td>
                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.replyCount}</td>
                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaDelFlag}</td>

                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>

    <sec:authorize access="hasRole('ROLE_MEMBER')">
        <button type="submit" onclick="location.href='/notice/register'"
                class="btn btn-primary btn-sm">작성하기
        </button>
    </sec:authorize>




















    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="${pageMaker.start -1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
            <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
        </c:forEach>

<%--jstl이용안하고 css안에서 조건 만족하면 display none처리 하는게 어떤거엿죠? todo check--%>
        <li class="page-item">
            <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>


                    </div>
                </div>
            </div>
        </main>




    </div>
</div>






<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/js/datatables-simple-demo.js"></script>


<form class="actionForm" action="/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <%--    검색을 하면 일단 page는 1--%>
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <%--    type, keyword는 검색한 값으로 대입함--%>
</form>


<script>

    const qaBoardList = document.querySelector(".qaBoardList")
    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")


    //=========================================================

    qaBoardList.addEventListener("click", (e)=> {
        e.preventDefault()
        e.stopPropagation()


        if (e.target.getAttribute("class").indexOf('qa-link') < 0) {
            return
        }
        const qNo = e.target.getAttribute("data-qaNo")
        actionForm.setAttribute("action", qNo)
        actionForm.submit() //
    },false)
        //================================================================





    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if(target.getAttribute("class") !== 'page-link'){
            return
        }

        const pageNum = target.getAttribute("href")
        actionForm.querySelector("input[name='page']").value = pageNum
        actionForm.setAttribute("action","/qa/list")
        actionForm.submit()
        //todo 현재 진짜 end 값이 안되는데 size를 넘기는 부분이
        //reply보면 post로 되어있네 넘겨주는 부분이 필요해
    },false)


    //    ========================================================================================



</script>

</body>
</html>
