
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>


<div id="layoutSidenav_content">
  <main>
    <div class="container-fluid px-4">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
              <div class="card-header"><h3 class="text-center font-weight-light my-4">질문 작성</h3></div>
              <div class="card-body">
                <form class="reqForm" action="/qa/register" method="post" >

                  <div class="mb-3">
                    <label>제목</label>
                    <input class="form-control" name="qaTitle" type="text" />

                  </div>
                  <div class="mb-3">
                    <label>내용</label>
                    <textarea class="form-control" name="qaContent" rows="3" required></textarea>
                  </div>

                  <div class="mb-3">
                    <label>글쓴이</label>
                    <input class="form-control" name="qaWriter" type="text" />


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

  <h1>Register Page</h1>
  <form class="actionForm" action="/qa/register" method="post">
    <input type="text" name="qaTitle" value="파일업로드 테스트 ">
    <input type="text" name="qaContent" value="파일업로드 작성내용 ">
    <input type="text" name="qaWriter" value="파일업로드 작성자00 ">


    <button class="formBtn">CLICK</button>
  </form>

  <h2>파일 업로드</h2>
  <form action="/upload1" method="post" enctype="multipart/form-data" >
    <input type="file"  name="files" multiple>
    <button>업로드</button>
  </form>

  <div>
    <h2>ajax 업로드</h2>
    <div class="uploadInputDiv">
      <input type="file" name="upload" multiple class="uploadFile">
    </div>
    <button class="uploadBtn">Upload</button>
  </div>

  <div class="uploadResult">
  </div>

  <style>
    .uploadResult {
      display: flex;

    }
    .uploadResult > div {
      margin: 3em;
      border: 1px solid red;
    }
  </style>



  <%@ include file="/WEB-INF/includes/listfooter.jsp" %>



<%--  <form class="actionForm" action="/list" method="get">--%>
<%--    <input type="hidden" name="page" value="${listDTO.page}">--%>
<%--    &lt;%&ndash;    검색을 하면 일단 page는 1&ndash;%&gt;--%>
<%--    <input type="hidden" name="size" value="${listDTO.size}">--%>
<%--    <input type="hidden" name="type" value="${listDTO.type}">--%>
<%--    <input type="hidden" name="keyword" value="${listDTO.keyword}">--%>
<%--    &lt;%&ndash;    type, keyword는 검색한 값으로 대입함&ndash;%&gt;--%>
  </form>


  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

  <script>
    const actionForm = document.querySelector(".actionForm")
    const formBtn = document.querySelector(".formBtn")
    const uploadBtn = document.querySelector(".uploadBtn")
    const uploadResult = document.querySelector(".uploadResult")

    const cloneInput = document.querySelector(".uploadFile").cloneNode()

    //========================================================
    formBtn.addEventListener("click", (e) =>{
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

      actionForm.innerHTML += str
      actionForm.submit()

    },false)

    uploadResult.addEventListener("click", (e) => {

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


    uploadBtn.addEventListener("click", (e)=> {

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

        fileInput.remove() //input 타입중 file 은 유일하게 값 수정이 안되서 통으로 삭제 후 클론 생성
        document.querySelector(".uploadInputDiv").appendChild(cloneInput.cloneNode())
        //todo 이거 정확히 어떤 차이인지 모르겟네요


      },false)


    },false)





    //=========================================================
    function register(){
      const reqForm = document.getElementsByClassName(".reqForm")
      reqForm.submit()
    }
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
    //여기까지는 보냈고 이제 파일 중복을 걱정함

  </script>








  </body>
  </html>
