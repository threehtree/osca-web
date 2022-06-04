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
                <h1 class="mt-4">읽기</h1>
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

                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">번호</span>
                                                    <input type="text" class="form-control" name="qaNo" value="${qaDTO.qaNo}"  readonly>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">제목</span>
                                                    <input type="text" class="form-control" name="qaTitle" value="${qaDTO.qaTitle}"  readonly>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">내용</span>
                                                    <textarea class="form-control col-sm-5" rows="5" name="qaContent"  readonly>${qaDTO.qaContent}</textarea>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <span class="input-group-text">작성자</span>
                                                    <input type="text" class="form-control" name="qaWriter" value="${qaDTO.qaWriter}"  readonly>
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
                                                        <form action="/qa/modify" method="get">
                                                            <input type="hidden" name="qaNo" value="${qaDTO.qaNo}">
                                                        <button type="submit" class="btn btn-secondary">modify</button>
                                                        </form>

                                                    </div>
                                                </div>



                                        </div><!--end card body-->
                                    </div><!--end card-->
                                </div><!-- end col-->
                            </div><!-- end row-->

                                <di>
                                    <div>
                                        <input type="text" name="replyText" value="샘플댓글">
                                    </div>
                                    <div>
                                        <input type="text" name="replyer" value="testUser00">
                                    </div>
                                    <div>
                                        <button class="addReplyBtn">댓글 추가</button>
                                    </div>
                                </di>



                                <div>
                                    <h2 class="replyCountShow"></h2>
                                    <ul class="replyUL">

                                    </ul>
                                    <style>
                                        .pageUL {
                                            display: flex;

                                        }
                                        .pageUL li {
                                            list-style: none;
                                            margin: 0.1em;
                                            border: 1px solid blue;
                                        }
                                        .pageUL .current {
                                            background-color: blue;
                                        }
                                    </style>
                                    <ul class="pageUL">

                                    </ul>
                                </div>

                        <%--                        <c:if test=""> todo 나중에 작성자만 보이게 해줘야ㅈ --%>



                    </div>
                </div>
            </div>
        </main>




    </div>
</div>


<div class="modal modifyModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title replyHeader"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <span class="input-group-text">Reply Text</span>
                    <input type="text" class="form-control modifyText" >
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info modifyBtn">Modify</button>
                <button type="button" class="btn btn-danger removeBtn">Remove</button>
                <button type="button" class="btn btn-outline-dark closeModifyBtn">Close</button>
            </div>
        </div>
    </div>
</div> <!--modifyModal -->






<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/js/datatables-simple-demo.js"></script>

<script src="/resources/js/reply.js"></script>


<form class="actionForm" action="/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <%--    검색을 하면 일단 page는 1--%>
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <%--    type, keyword는 검색한 값으로 대입함--%>
</form>


<script>
    //modifyModal
    const modifyModal = new bootstrap.Modal(document.querySelector(".modifyModal"))

    const replyHeader = document.querySelector(".replyHeader")
    const modifyText = document.querySelector(".modifyText")
    const modifyBtn = document.querySelector(".modifyBtn")
    const removeBtn = document.querySelector(".removeBtn")
    const closeModifyBtn = document.querySelector(".closeModifyBtn")







    const actionForm = document.querySelector(".actionForm")
    const pageUL = qs(".pageUL")

    const qaNo = ${qaDTO.qaNo}
    const replyUL = qs(".replyUL")
    let replyCount =  ${qaDTO.replyCount} //댓글의 갯수가 잇다면 댓글페이징 + 마지막페이지 가능

    replyService.setReplyCount (function  (num){
        console.log("set---------------- "+num)
        replyCount =num
        qs(".replyCountShow").innerHTML = replyCount
        printPage()//replycount 바뀌면 또 뿌려줘야지
    })
    console.log(replyService)

    const pageNum = 1
    const pageSize = 10



    //========================================================
    function printPage(targetPage){

        const lastPageNum = Math.ceil(replyCount/pageSize)

        let endPageNum = Math.ceil((targetPage||replyCount)/pageSize)*10 //타겟, reply우선 비교


        //강사님은 10으로 나누심
        const startPageNum = endPageNum-9

        endPageNum = lastPageNum < endPageNum ? lastPageNum: endPageNum //? ture:false



        const current = targetPage? parseInt(targetPage):lastPageNum// 페이지를 클릭햇으면 그페이지 , 아니면 기본 마지막페이지
        //숫자인데 뭔가 오류가 생긴다? 일단 받은값이 문자열이 아닌지 확인하자
        console.log("current", current, "lastPage" ,lastPageNum)

        console.log("pageParama"+ pageParam)

        let str = ''


        if(startPageNum > 1){
            str  += `<li data-num=\${startPageNum -1} >\${startPageNum -1} 이전</li>`
        }

        for(let i = startPageNum; i<=endPageNum; i++){
            str += `<li data-num = \${i} class="\${i === current?'current':''}">\${i}</li>`
        }

        if(lastPageNum > endPageNum){
            str  += `<li data-num=\${endPageNum + 1} >\${endPageNum + 1} 다음</li>`
        }


        pageUL.innerHTML = str
    }
    //================================================================================================


    function getServerList(param) {
        replyService.getList(param, (replyArr) => {
            const liArr = replyArr.map(reply => `<li data-rno =\${reply.rno} >\${reply.rno}.  \${reply.replyText}</li>`)
            replyUL.innerHTML = liArr.join(" ")
            printPage(param.page)//페이지 시작하면 자동으로 필요하니
        })
    }

    function addServerReply(){
        replyService.addReply(
            {   qaNo:qaNo,
                replyText: qs("input[name='replyText']").value,
                replyer:qs("input[name='replyer']").value},
            pageSize,
            (param)=>{
                getServerList(param)//추가하면 댓글리스트를 다시 뽑아와야지
            })
    }
    qsAddEvent(".replyUL","click",(e)=>{
        const target = e.target

        const rno = parseInt(target.getAttribute("data-rno"))

        if(!rno){
            return
        }
        getReply(rno).then(reply => {
            console.log(reply)
            replyHeader.innerHTML = reply.rno
            modifyText.value = reply.replyText

            modifyModal.show()
        })

    },"li")
    qsAddEvent(".modifyBtn","click",()=>{
        const replyObj = {
            qaNo:qaNo,
            rno:replyHeader.innerHTML,
            replyText:modifyText.value}

        modifyReply(replyObj).then(result => {
            alert(result.rno+' 댓글이 수정되었습니다.')
            // replyText.value = '' //이건 용도가 어떻게 되는거지???? todo
            modifyModal.hide()
            getServerList({qaNo:qaNo, page:pageNum, size:pageSize})

        }).catch(e => {
            console.log(e)
        })
    },"button")

    closeModifyBtn.addEventListener("click", function(e){

        modifyModal.hide()

    }, false)


    qsAddEvent(".addReplyBtn","click",addServerReply)
    qsAddEvent(".pageUL","click",(evt, realtarget) =>{
        const num = realtarget.getAttribute("data-num")
        getServerList({qaNo:qaNo, page:num, size:pageSize})
    }, "li")


    const pageParam = Math.ceil(replyCount/pageSize)// 총 페이지 수

    console.log("===============================================")
    console.log(pageParam)


    //after loading
    qs(".replyCountShow").innerHTML = replyCount //댓글열자마자 보이게
    getServerList({qaNo:qaNo, page:pageParam, size:pageSize}) // 페이지 호출되자마자 틀게




    //    ========================================================================================




</script>

</body>
</html>
