<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>O.S.C.A</title>
    <link href="../../resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed sb-sidenav-toggled">

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">O.S.C.A</a>

    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="/register">의뢰 작성하기</a></li>
                <li><a class="dropdown-item" href="/mypage">마이 페이지</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#!">로그아웃</a></li>
            </ul>
        </li>
    </ul>
</nav>

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
                <h1 class="mt-4">수정</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Tables</li>
                </ol>

                ${pageMaker}
                <div class="card mb-4">
                    <div class="card-body">


                            <%--====================--%>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="card">
                                        <div class="card-header">
                                            Board Modify
                                        </div>
                                        <div class="card-body">
                                            <form action="/qa/modify/"+${qaDTO.qaNo} method="post" id="f1">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">번호</span>
                                                    <input type="text" class="form-control" name="qaNo" value="${qaDTO.qaNo}"  readonly>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">제목</span>
                                                    <input type="text" class="form-control" name="qaTitle" value="${qaDTO.qaTitle}">
                                                </div>

                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">내용</span>
                                                    <textarea class="form-control col-sm-5" rows="5" name="qaContent">${qaDTO.qaContent}</textarea>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">작성자</span>
                                                    <input type="text" class="form-control" name="qaWriter" value="${qaDTO.qaWriter}"  readonly>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">첨부파일</span>
                                                    <div class="float-end uploadHidden">
                                                        <button type="button" class="btn btn-primary uploadFileBtn">ADD Files</button>
                                                    </div>
                                                </div>


                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">작성일자</span>
                                                    <input type="text" class="form-control" value="${qaDTO.regDate}" readonly>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">수정일자</span>
                                                    <input type="text" class="form-control" value="" readonly>
                                                </div>

                                                <div class="my-4">
                                                    <div class="float-end">
                                                        <button type="button" class="btn btn-primary listBtn">List</button>

                                                        <button type="submit" class="btn btn-secondary modBtn">작성완료</button>

                                                    </div>
                                                </div>
                                            </form>


                                        </div><!--end card body-->
                                    </div><!--end card-->
                                </div><!-- end col-->
                            </div><!-- end row-->




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


<%--<form class="actionForm" action="/list" method="get">--%>
<%--    <input type="hidden" name="page" value="${listDTO.page}">--%>
<%--    &lt;%&ndash;    검색을 하면 일단 page는 1&ndash;%&gt;--%>
<%--    <input type="hidden" name="size" value="${listDTO.size}">--%>
<%--    <input type="hidden" name="type" value="${listDTO.type}">--%>
<%--    <input type="hidden" name="keyword" value="${listDTO.keyword}">--%>
<%--    &lt;%&ndash;    type, keyword는 검색한 값으로 대입함&ndash;%&gt;--%>
<%--</form>--%>


<%--<script>--%>


<%--    const linkDiv = document.querySelector(".pagination")--%>
<%--    const actionForm = document.querySelector(".actionForm")--%>


<%--    //=========================================================--%>

<%--    //================================================================--%>





<%--    linkDiv.addEventListener("click", (e) => {--%>
<%--        e.stopPropagation()--%>
<%--        e.preventDefault()--%>

<%--        const target = e.target--%>

<%--        if(target.getAttribute("class") !== 'page-link'){--%>
<%--            return--%>
<%--        }--%>

<%--        const pageNum = target.getAttribute("href")--%>
<%--        actionForm.querySelector("input[name='page']").value = pageNum--%>
<%--        actionForm.setAttribute("action","/qa/list")--%>
<%--        actionForm.submit()--%>
<%--        //todo 현재 진짜 end 값이 안되는데 size를 넘기는 부분이--%>
<%--        //reply보면 post로 되어있네 넘겨주는 부분이 필요해--%>
<%--    },false)--%>





</script>

</body>
</html>