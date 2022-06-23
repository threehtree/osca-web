<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>


<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                            <div class="card-body">
                                <form action="/memberSignUp" method="post">

                                    <div class="mb-3">
                                        <label>이름</label>
                                        <input class="memName form-control" name="memName" placeholder="홍길동" type="text"/>
                                    </div>

                                    <div class="mb-3">
                                        <label>ID</label>
                                        <input class="memName form-control" name="memID" placeholder="myID" type="text"/>
                                    </div>

                                    <div class="mb-3">
                                        <label>PW</label>
                                        <input class="memPW form-control" name="memPW" placeholder="myPW" type="password"/>
                                    </div>


                                    <div class="mb-3">
                                        <label>E-mail</label>
                                        <input class="memEmail form-control" name="memEmail" placeholder="name@example.com" type="email"/>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="file" name="upload" class="uploadFile form-control" multiple>
                                        <button type="button" class="uploadBtn btn btn-success">Upload</button>
                                    </div>
<%--                                    todo 이렇게 되면 나중에 값이 이상한 것을 넣을때 체크가 안됨 axios를 통해 보낼방법--%>
<%--                                    <div class="form-check">--%>
<%--                                        <input class="isCompanyChecked form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">--%>
<%--                                        <label class="form-check-label" for="flexRadioDefault1">--%>
<%--                                            시공사--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-check">--%>
<%--                                        <input class="isMemberChecked form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>--%>
<%--                                        <label class="form-check-label" for="flexRadioDefault2">--%>
<%--                                            의뢰자--%>
<%--                                        </label>--%>
<%--                                    </div>--%>

                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" >작성 완료</button></div>
<%--                                        onclick="registerUser()"--%>

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



</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<%--<script src ="../../resources/js/register_user.js"></script>--%>



</html>
