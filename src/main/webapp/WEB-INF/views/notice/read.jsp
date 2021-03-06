<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="layoutSidenav">

    <div id="layoutSidenav_content" class="vw-100 vertical-center-row" >
        <main class>
            <div class="container-fluid px-4 flex-column ">
                <h1 class="mt-4"></h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a style="text-decoration-line: none " href="/notice/list">공지사항</a></li>

                </ol>


                <style>
                    .pictures img {
                        max-width: 80vw;
                    }
                </style>
                <%--                <button class="moreBtn">더보기</button>--%>
                <div class="card mb-4">
                    <div class="card-body">
                        <%--                            <c:if test="${qaDTO.mainImage != null}">--%>
                        <%--                                <img src="${qaDTO.mainImage}">--%>
                        <%--                            </c:if>--%>
                        <%--    todo check 이것도 대표이미지 이용인데 나에게는 필요없을 것 같다 --%>


                        <%--====================--%>
                        <div class="row mt-3">
                            <div class="col">
                                <div class="card">
                                    <div class="card-header">
                                       1---1

                                    </div>
                                    <div class="card-body">

<%--                                        <div class="input-group mb-3">--%>
<%--                                            <span class="input-group-text">번호</span>--%>
<%--                                            <input type="text" class="form-control" name="noNo" value="${noDTO.noNo}"--%>
<%--                                                   readonly>--%>
<%--                                        </div>--%>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">제목</span>
                                            <input type="text" class="form-control" name="noTitle"
                                                   value="${noDTO.noTitle}" readonly>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">내용</span>
                                            <textarea class="form-control col-sm-5" rows="5" name="noContent"
                                                      readonly>${noDTO.noContent}</textarea>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">작성자</span>
                                            <input type="text" class="form-control" name="noWriter"
                                                   value="${noDTO.noWriter}" readonly>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">작성일자</span>
                                            <input type="text" class="form-control" value="${noDTO.regDate}" readonly>
                                        </div>
<%--    =============================================================================================================--%>

<%--    =============================================================================================================--%>



                                        <div class="pictures">
                                            <%--                            <c:if test="${qaDTO.mainImage != null}">--%>
                                            <%--                                <img src="${qaDTO.getMain()}">--%>
                                            <%--                            </c:if>--%>
                                        </div>

                                    </div>
                                    <div class="my-4">
                                        <div class="noBoardMoveBtn float-end">
                                            <button onclick="location.href='/notice/list';"
                                                    type="button"
                                                    class="btn btn-secondary listBtn">List
                                            </button>
                                            <sec:authentication property="principal" var="pinfo"/>
                                            <sec:authorize access="isAuthenticated()">
                                                <c:if test="${pinfo.username == noDTO.noWriter}">
                                            <button data-noNo="/notice/modify/${noDTO.noNo}" type="button"
                                                    class="no-link btn btn-primary">수정하기
                                            </button>
                                            <button data-noNo="/notice/delete/${noDTO.noNo}" type="button"
                                                    class="removeBtn btn btn-danger">삭제하기</button>
                                                </c:if>
                                            </sec:authorize>

                                        </div>
                                    </div>


                                </div><!--end card body-->
                            </div><!--end card-->

                        </div><!-- end col-->
                    </div><!-- end row-->


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



<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/js/datatables-simple-demo.js"></script>

<script src="/resources/js/reply.js"></script>


<form class="actionForm" action="/list" method="get">
    <input type="hidden" name="noWriter" value="${noDTO.noWriter}">

    <input type="hidden" name="page" value="${listDTO.page}">
    <%--    검색을 하면 일단 page는 1--%>
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <%--    type, keyword는 검색한 값으로 대입함--%>
</form>


<script>


    const noNO = ${noDTO.noNo}
    const noBoardMoveBtn = document.querySelector(".noBoardMoveBtn")
    const removeBtn = document.querySelector(".removeBtn")

    const actionForm = document.querySelector(".actionForm")

    //=======================================================


    document.addEventListener('DOMContentLoaded', (e) => {
        axios.get("/notice/files/${noDTO.noNo}").then(
            res => {

                const arr = res.data
                console.log(res)
                let str = ''
                for (let i = 0; i < arr.length; i++) {
                    str += `<img src='/view?fileName=\${arr[i].link}'>`
                }
                console.log(res)
                document.querySelector(".pictures").innerHTML = str


            }
        )
    }, false)

    noBoardMoveBtn.addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()


        if (e.target.getAttribute("class").indexOf('no-link') > 0) {
            return
        }
        const noNo = e.target.getAttribute("data-noNo")
        actionForm.setAttribute("action", noNo)
        actionForm.submit() //
    }, false)

    removeBtn.addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        const noNo = e.target.getAttribute("data-noNo")
        actionForm.setAttribute("action", noNo)
        actionForm.setAttribute("method", "post")
        actionForm.submit() //
    }, false)

    //========================================================

    //================================================================================================


    //    ========================================================================================


</script>

</body>
</html>
