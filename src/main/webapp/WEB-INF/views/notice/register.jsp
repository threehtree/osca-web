
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>


<div id="layoutSidenav_content">
  <main>
    <div class="container-fluid px-4">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
              <div class="card-header"><h3 class="text-center font-weight-light my-4">공지사항 작성</h3></div>
              <div class="card-body">
                <form class="reqForm" action="/notice/register" method="post" >

                  <div class="mb-3">
                    <label>제목</label>
                    <input class="form-control" name="noTitle" type="text" />

                  </div>
                  <div class="mb-3">
                    <label>내용</label>
                    <textarea class="form-control" name="noContent" rows="3" required></textarea>
                  </div>

                  <div class="mb-3">
                    <label>글쓴이</label>
                    <input class="form-control" name="noWriter" type="text" value="관리자A"/>


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




  </form>


  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>







  </body>
  </html>
