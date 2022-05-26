<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>수정하기 </title>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
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
                <li><a class="dropdown-item" href="#!">Settings</a></li>
                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#!">Logout</a></li>
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
                <h1 class="mt-4">Tables</h1>
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
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable Example
                    </div>
                    <div class="card-body">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">계약 내용 수정</h3></div>
                            <div class="card-body">
                                <form class="modForm" action="/modify" method="post">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="conName" type="text" placeholder="name@example.com"/>
                                        <label>계약명</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="memId" type="text" placeholder="name@example.com" />
                                        <label>의뢰자 </label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="comId" type="text" placeholder="name@example.com" />
                                        <label>시공사</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="conStartDay" type="text" placeholder="name@example.com" />
                                        <label>시작일</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="conEndDay" placeholder="name@example.com" />
                                        <label>마감일</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="conCondition" placeholder="name@example.com" />
                                        <label>계약상태</label>
                                    </div>
<%--                                    <div class="row mb-3">--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <div class="form-floating mb-3 mb-md-0">--%>
<%--                                                <input class="form-control" id="inputPassword" type="password" placeholder="Create a password" />--%>
<%--                                                <label for="inputPassword">Password</label>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><a  data-reqNo = "/modify/${reqDTO.conNo}" class="modBtn btn btn-primary btn-block">Create Account</a></div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>계약명</th>
                                <th>의뢰자</th>
                                <th>시공사</th>
                                <th>시작일</th>
                                <th>마감일</th>
                                <th>계약상태</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>계약명</th>
                                <th>의뢰자</th>
                                <th>시공사</th>
                                <th>시작일</th>
                                <th>마감일</th>
                                <th>계약상태</th>
                            </tr>
                            </tfoot>
                            <tbody class="reqList">

                            <tr>
                                <td data-reqNo = "/read/${reqDTO.conNo}" class="req-link">
                                <input type="text" placeholder="${reqDTO.conName}"></td>

                                <td data-reqNo = "${reqDTO.conNo}" class="req-link">
                                <input type="text" placeholder="${reqDTO.memId}">
                                </td>
                                <td data-reqNo = "${reqDTO.conNo}" class="req-link">${reqDTO.comId}</td>
                                <td data-reqNo = "${reqDTO.conNo}" class="req-link">${reqDTO.conStartDay}</td>
                                <td data-reqNo = "${reqDTO.conNo}" class="req-link">${reqDTO.conEndDay}</td>
                                <td data-reqNo = "${reqDTO.conNo}" class="req-link">${reqDTO.conCondition}</td>


                            </tr>

                            </tbody>
                        </table>
                        <button type="submit" onclick="location.href='/modify/${reqDTO.conNo}'" class="btn btn-primary btn-sm">수정하기</button>
                        <button type="submit" class="btn btn-secondary btn-sm">삭제하기</button>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2022</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/js/datatables-simple-demo.js"></script>




<script>

    const modForm = document.querySelector(".modForm")
    const modBtn = document.querySelector(".modBtn")

    //=========================================================
    modBtn.addEventListener("click", (e)=>{
        e.preventDefault()
        e.stopPropagation()

       const modNo = e.target.getAttribute("data-reqNo")
        // alert(modNo)
        modForm.setAttribute("action", modNo)
        modForm.submit()




    }, false)
</script>

</body>
</html>
