<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>


<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">의뢰 작성</h3></div>
                            <div class="card-body">
                                <form class="reqForm" action="/modify/${reqDTO.conNo}" method="post" >

                                    <div class="mb-3">
                                        <label>의뢰명</label>
                                        <input class="form-control" name="conName" type="text" value="${reqDTO.conName}" />

                                    </div>
                                    <div class="mb-3">
                                        <label>의뢰내용</label>
                                        <textarea class="form-control" name="conContent" rows="3" required>${reqDTO.conContent}</textarea>
                                    </div>

                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="btn btn-primary btn-block">작성 완료</button></div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </main>
    <%@ include file="/WEB-INF/includes/listfooter.jsp" %>



    <form class="actionForm" action="/list" method="get">
        <input type="hidden" name="page" value="${listDTO.page}">
        <%--    검색을 하면 일단 page는 1--%>
        <input type="hidden" name="size" value="${listDTO.size}">
        <input type="hidden" name="type" value="${listDTO.type}">
        <input type="hidden" name="keyword" value="${listDTO.keyword}">
        <%--    type, keyword는 검색한 값으로 대입함--%>
    </form>


    <script>



        //=========================================================


    </script>

</div>
</html>
