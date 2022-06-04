<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link" href="index.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>
                    <div class="sb-sidenav-menu-heading">Interface</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Layouts
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="layout-static.html">Static Navigation</a>
                            <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                        Pages
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                Authentication
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="login.html">Login</a>
                                    <a class="nav-link" href="register.html">Register</a>
                                    <a class="nav-link" href="password.html">Forgot Password</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                Error
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="401.html">401 Page</a>
                                    <a class="nav-link" href="404.html">404 Page</a>
                                    <a class="nav-link" href="500.html">500 Page</a>
                                </nav>
                            </div>
                        </nav>
                    </div>
                    <div class="sb-sidenav-menu-heading">Addons</div>
                    <a class="nav-link" href="charts.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        Charts
                    </a>
                    <a class="nav-link" href="tables.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Tables
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                Start Bootstrap
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Q&A</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Tables</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                        .
                    </div>
                </div>
                ${pageMaker}
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
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>등록일자</th>
                                <th>댓글수</th>
                                <th>답변유무</th>
                            </tr>
                            </thead>
                            <tfoot>

                            </tfoot>
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

                        <button type="submit" onclick="location.href='/qa/register'" class="btn btn-primary btn-sm">작성하기</button>
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