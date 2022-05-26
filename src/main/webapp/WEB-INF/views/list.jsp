
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>



    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">의뢰목록</h1>

                <div class="card mb-4">

                    <div class="card-body">
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

                            </tfoot>
                            <tbody class="reqMemList">
                            <c:forEach items="${reqDTO}" var="reqDTO">
                            <tr>
                                <td data-reqNo ="/read/${reqDTO.conNo}" class="req-link">${reqDTO.conName}</td>
                                <td data-reqNo ="/read/${reqDTO.conNo}" class="req-link">${reqDTO.memId}</td>
                                <td data-reqNo ="/read/${reqDTO.conNo}" class="req-link">${reqDTO.comId}</td>
                                <td data-reqNo ="/read/${reqDTO.conNo}" class="req-link">${reqDTO.conStartDay}</td>
                                <td data-reqNo ="/read/${reqDTO.conNo}" class="req-link">${reqDTO.conEndDay}</td>
                                <td data-reqNo ="/read/${reqDTO.conNo}" class="req-link">${reqDTO.conCondition}</td>

                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                </div>

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
            ${pageMaker}

        </main>
        <%@ include file="/WEB-INF/includes/listfooter.jsp" %>

    </div>


<form class="actionForm" action="/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <%--    검색을 하면 일단 page는 1--%>
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <%--    type, keyword는 검색한 값으로 대입함--%>
</form>


<script>
    const reqMemList = document.querySelector(".reqMemList")
    const actionForm = document.querySelector(".actionForm")
    const linkDiv = document.querySelector(".pagination")

    //=========================================================

    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if(target.getAttribute("class") !== 'page-link'){
            return
        }

        const pageNum = target.getAttribute("href")
        actionForm.querySelector("input[name='page']").value = pageNum
        actionForm.setAttribute("action","/list")
        actionForm.submit()
        //todo 현재 진짜 end 값이 안되는데 size를 넘기는 부분이
        //reply보면 post로 되어있네 넘겨주는 부분이 필요해

    },false)


    reqMemList.addEventListener("click", (e)=>{
        e.preventDefault()
        e.stopPropagation()


        if(e.target.getAttribute("class").indexOf('req-link') < 0){
            return
        }
        const rNo = e.target.getAttribute("data-reqNo")
        actionForm.setAttribute("action", rNo)
        actionForm.submit() //




    }, false)

</script>

</body>
</html>
