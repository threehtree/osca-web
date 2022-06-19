<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">

    </div>
    <div id="layoutSidenav_content" class="vw-100">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">읽기</h1>
                <ol class="breadcrumb mb-4">

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
                                        Board Modify
                                    </div>
                                    <div class="card-body">

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">번호</span>
                                            <input type="text" class="form-control" name="qaNo" value="${qaDTO.qaNo}"
                                                   readonly>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">제목</span>
                                            <input type="text" class="form-control" name="qaTitle"
                                                   value="${qaDTO.qaTitle}" readonly>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">내용</span>
                                            <textarea class="form-control col-sm-5" rows="5" name="qaContent"
                                                      readonly>${qaDTO.qaContent}</textarea>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">작성자</span>
                                            <input type="text" class="form-control" name="qaWriter"
                                                   value="${qaDTO.qaWriter}" readonly>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">작성일자</span>
                                            <input type="text" class="form-control" value="${qaDTO.regDate}" readonly>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">수정일자</span>
                                            <input type="text" class="form-control" value="" readonly>
                                        </div>

                                            <div class="pictures">
                                                <%--                            <c:if test="${qaDTO.mainImage != null}">--%>
                                                <%--                                <img src="${qaDTO.getMain()}">--%>
                                                <%--                            </c:if>--%>
                                            </div>

                                        </div>
                                        <div class="my-4">
                                            <div class="qaBoardMoveBtn float-end">
                                                <button data-qaNo="/qa/modify/${qaDTO.qaNo}" type="button"
                                                        class="qa-link btn btn-primary listBtn">List
                                                </button>

                                                <button data-qaNo="/qa/modify/${qaDTO.qaNo}" type="button"
                                                        class="qa-link btn btn-secondary">modify
                                                </button>


                                            </div>
                                        </div>


                                    </div><!--end card body-->
                                </div><!--end card-->

                            </div><!-- end col-->
                        </div><!-- end row-->

                        <div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                댓글 추가
                            </button>

                        </div>


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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">댓글 입력</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <input type="text" class="form-control" name="replyText" value="샘플댓글">
                </div>
                <div>
                    <input type="text" class="form-control" name="replyer" value="testUser00">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary addReplyBtn">Save changes</button>
            </div>
        </div>
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
                    <input type="text" class="form-control modifyText">
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
<script>
    const qaNO = ${qaDTO.qaNo}
        document.addEventListener('DOMContentLoaded', (e) => {
            axios.get("/qa/files/${qaDTO.qaNo}").then(
                res => {
                    const arr = res.data
                    let str = ''
                    for (let i = 0; i < arr.length; i++) {
                        str += `<img src='/view?fileName=\${arr[i].link}'>`
                    }

                    document.querySelector(".pictures").innerHTML = str
                }
            )
        }, false)

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
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


    const qaBoardMoveBtn = document.querySelector(".qaBoardMoveBtn")

    const actionForm = document.querySelector(".actionForm")
    const pageUL = qs(".pageUL")

    const qaNo =
    ${qaDTO.qaNo}
    const replyUL = qs(".replyUL")
    let replyCount = ${qaDTO.replyCount} //댓글의 갯수가 잇다면 댓글페이징 + 마지막페이지 가능

        replyService.setReplyCount(function (num) {
            console.log("set---------------- " + num)
            replyCount = num
            qs(".replyCountShow").innerHTML = replyCount
            printPage()//replycount 바뀌면 또 뿌려줘야지
        })
    console.log(replyService)

    const pageNum = 1
    const pageSize = 10
    //=======================================================
    qaBoardMoveBtn.addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()


        if (e.target.getAttribute("class").indexOf('qa-link') < 0) {
            return
        }
        const qNo = e.target.getAttribute("data-qaNo")
        actionForm.setAttribute("action", qNo)
        actionForm.submit() //
    }, false)


    //========================================================
    function printPage(targetPage) {

        const lastPageNum = Math.ceil(replyCount / pageSize)

        let endPageNum = Math.ceil((targetPage || replyCount) / pageSize) * 10 //타겟, reply우선 비교


        //강사님은 10으로 나누심
        const startPageNum = endPageNum - 9

        endPageNum = lastPageNum < endPageNum ? lastPageNum : endPageNum //? ture:false


        const current = targetPage ? parseInt(targetPage) : lastPageNum// 페이지를 클릭햇으면 그페이지 , 아니면 기본 마지막페이지
        //숫자인데 뭔가 오류가 생긴다? 일단 받은값이 문자열이 아닌지 확인하자
        console.log("current", current, "lastPage", lastPageNum)

        console.log("pageParama" + pageParam)

        let str = ''


        if (startPageNum > 1) {
            str += `<li data-num=\${startPageNum -1} >\${startPageNum -1} 이전</li>`
        }

        for (let i = startPageNum; i <= endPageNum; i++) {
            str += `<li data-num = \${i} class="\${i === current?'current':''}">\${i}</li>`
        }

        if (lastPageNum > endPageNum) {
            str += `<li data-num=\${endPageNum + 1} >\${endPageNum + 1} 다음</li>`
        }


        pageUL.innerHTML = str
    }

    //================================================================================================


    function getServerList(param) {
        replyService.getList(param, (replyArr) => {
            //\${reply.rno}.
            const liArr = replyArr.map(reply => `<li style="list-style: none;
" data-rno =\${reply.rno} > \${reply.replyText}</li>`)
            replyUL.innerHTML = liArr.join(" ")
            printPage(param.page)//페이지 시작하면 자동으로 필요하니
        })
    }

    function addServerReply() {
        replyService.addReply(
            {
                qaNo: qaNo,
                replyText: qs("input[name='replyText']").value,
                replyer: qs("input[name='replyer']").value
            },
            pageSize,
            (param) => {
                getServerList(param)//추가하면 댓글리스트를 다시 뽑아와야지
            })
    }

    qsAddEvent(".replyUL", "click", (e) => {
        const target = e.target

        const rno = parseInt(target.getAttribute("data-rno"))

        if (!rno) {
            return
        }
        getReply(rno).then(reply => {
            console.log(reply)
            replyHeader.innerHTML = reply.rno
            modifyText.value = reply.replyText

            modifyModal.show()
        })

    }, "li")
    qsAddEvent(".modifyBtn", "click", () => {
        const replyObj = {
            qaNo: qaNo,
            rno: replyHeader.innerHTML,
            replyText: modifyText.value
        }

        modifyReply(replyObj).then(result => {
            alert(result.rno + ' 댓글이 수정되었습니다.')
            // replyText.value = '' //이건 용도가 어떻게 되는거지???? todo
            modifyModal.hide()
            getServerList({qaNo: qaNo, page: pageNum, size: pageSize})

        }).catch(e => {
            console.log(e)
        })
    }, "button")

    closeModifyBtn.addEventListener("click", function (e) {

        modifyModal.hide()

    }, false)


    qsAddEvent(".addReplyBtn", "click", addServerReply)
    qsAddEvent(".pageUL", "click", (evt, realtarget) => {
        const num = realtarget.getAttribute("data-num")
        getServerList({qaNo: qaNo, page: num, size: pageSize})
    }, "li")


    const pageParam = Math.ceil(replyCount / pageSize)// 총 페이지 수

    console.log("===============================================")
    console.log(pageParam)
    if (pageParam > 0) {
        //after loading
        // qs(".replyCountShow").innerHTML = replyCount //댓글열자마자 보이게
        getServerList({qaNo: qaNo, page: pageParam, size: pageSize}) // 페이지 호출되자마자 틀게
    }


    //    ========================================================================================


</script>

</body>
</html>
