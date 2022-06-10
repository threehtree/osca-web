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

                                        <form class="modForm" action="/notice/modify/${noDTO.noNo}" method="post">
                                            <input type="hidden" name="page" value="${listDTO.page}">
                                            <input type="hidden" name="size" value="${listDTO.size}">
                                            <input type="hidden" name="type" value="${listDTO.type}">
                                            <input type="hidden" name="keyword" value="${listDTO.keyword}">
                                            <div>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">번호</span>
                                                        <input type="text" class="form-control" name="noNo" value="${noDTO.noNo}"  readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">제목</span>
                                                        <input type="text" class="form-control" name="noTitle" value="${noDTO.noTitle}">
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">내용</span>
                                                        <textarea class="form-control col-sm-5" rows="5" name="noContent">${noDTO.noContent}</textarea>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">작성자</span>
                                                        <input type="text" class="form-control" name="noWriter" value="${noDTO.noWriter}"  readonly>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <input type="file" name="upload" class="uploadFile form-control" multiple >
                                                        <button type="button" class="uploadBtn btn btn-success">Upload</button>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">작성일자</span>
                                                        <input type="text" class="form-control" value="${noDTO.regDate}" readonly>
                                                    </div>

                                                    <div class="uploadResult">
                                                    </div>

                                                    <div class="my-4">
                                                        <div class="float-end">
                                                            <button type="button" class="btn btn-primary listBtn">List</button>

                                                            <button type="button" class="btn btn-secondary modBtn">작성완료</button>

                                                        </div>
                                                    </div>
    <%--                                            </form>--%>
                                                <div class="uploadResult">
                                                </div>
                                            </div>
                                        </form>
<%--                                            modForm--%>

                                            <style>
                                                .uploadResult {
                                                    display: flex;

                                                }
                                                .uploadResult > div {
                                                    margin: 3em;
                                                    border: 1px solid red;
                                                }
                                            </style>

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


<script>
    const uploadResult = document.querySelector(".uploadResult")

    function loadImage(){
        axios.get("/notice/files/${noDTO.noNo}").then(
            res => {
                const resultArr = res.data
                    uploadResult.innerHTML += resultArr.map( ({uuid,thumbnail,link,fileName,savePath,img }) =>`
                            <div data-uuid = '\${uuid}' data-img ='\${img}' data-filename = '\${fileName}' data-savepath = '\${savePath}'>
                            <img src='/view?fileName=\${thumbnail}' >
                            <button data-link='\${link}' class="delBtn">x</button>
                            \${fileName}</div>`).join(" ")
                    //끝에 join안넣어주면 배열이라 , 가 사이에 붙네
            }

        )
    }
    loadImage()


    uploadResult.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        if(e.target.getAttribute("class").indexOf("delBtn") < 0){
            return
        }
        const btn = e.target
        const link = btn.getAttribute("data-link")

        deleteToServer(link).then(result => {
            btn.closest("div").remove()
            //현재 e.target의 위치 바로 위에 div값이 있다
            //이게 화면단 에서 삭제
        })

    }, false)
////===========================================================000000000000000000000000000000000
    document.querySelector(".uploadBtn").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()
//register에서 긇기

        const formObj = new FormData;
        const fileInput = document.querySelector(".uploadFile")

        const files = fileInput.files
        console.log(files)
        //multiple 은 여러게를 의미하고 그럼 배열로 들어오겟지

        for(let i = 0; i<files.length; i++){
            console.log(files[i])
            formObj.append("files", files[i])
            //    formObj 라는 형식에 키|값을 추가하고 잇다
        }
        uploadToServer(formObj).then(resultArr =>{
            uploadResult.innerHTML += resultArr.map( ({uuid,thumbnail,link,fileName,savePath,img }) =>`
                                <div data-uuid = '\${uuid}' data-img ='\${img}' data-filename = '\${fileName}' data-savepath = '\${savePath}'>
                                <img src='/view?fileName=\${thumbnail}' >
                                <button data-link='\${link}' class="delBtn">x</button>
                                \${fileName}</div>`).join(" ")
            //끝에 join안넣어주면 배열이라 , 가 사이에 붙네
        })

    },false)

    const modBtn = document.querySelector(".modBtn")
    const modForm = document.querySelector(".modForm")



    modBtn.addEventListener("click",(e)=>{
        e.preventDefault()
        e.stopPropagation()

        const divArr = document.querySelectorAll(".uploadResult > div")

        let str =""
        for (let i = 0; i <divArr.length ; i++) {
            const fileObj = divArr[i]

            const uuid = fileObj.getAttribute("data-uuid")
            const img = fileObj.getAttribute("data-img")
            const savePath = fileObj.getAttribute("data-savepath")
            const fileName = fileObj.getAttribute("data-filename")
            str += `<input type='hidden' name ='uploads[\${i}].uuid' value='\${uuid}' }>`
            str += `<input type='hidden' name ='uploads[\${i}].img' value='\${img}' }>`
            str += `<input type='hidden' name ='uploads[\${i}].savePath' value='\${savePath}' }>`
            str += `<input type='hidden' name ='uploads[\${i}].fileName' value='\${fileName}' }>`
        }//endfor

        modForm.innerHTML += str
        modForm.submit()



    },false)

    async function deleteToServer(fileName){
        const options = {headers: { "Content-Type": "application/x-www-form-urlencoded"}}

        const res = await axios.post("/delete", "fileName="+fileName, options )

        console.log(res.data)

        return res.data
    }



    async function uploadToServer (formObj) {

        console.log("upload to server......")
        console.log(formObj)

        const response = await axios({
            method: 'post',
            url: '/upload1',
            data: formObj, //우리가 받을 formData
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        return response.data
    }



</script>

</body>
</html>
