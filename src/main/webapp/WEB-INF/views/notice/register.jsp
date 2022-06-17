<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">게시글 작성</h3></div>
                            <div class="card-body">
                                <form class="regForm" action="/notice/register" method="post">

                                    <div class="mb-3">
                                        <label>공지사항</label>
                                       <input type="checkbox"  name="noticeRead" value=1>
                                    </div>


                                    <div class="imgList">

                                    </div>

                                    <div class="mb-3">
                                        <label>제목</label>
                                        <input class="form-control" name="noTitle" type="text"/>
                                    </div>

                                    <div class="mb-3">
                                        <label>내용</label>
                                        <textarea class="form-control" name="noContent" rows="3" required></textarea>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input type="file" name="upload" class="uploadFile form-control" multiple>
                                        <button type="button" class="uploadBtn btn btn-success">Upload</button>
                                    </div>


                                    <div class="mb-3">
                                        <label>글쓴이</label>
                                        <input class="form-control" name="noWriter" type="text" value='<sec:authentication property="principal.username"/>'>

                                        <div class="uploadResult">
                                        </div>

                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <button class="regBtn btn btn-primary btn-block">작성 완료</button>
                                            </div>
                                        </div>
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


    <script>


        const regBtn = document.querySelector(".regBtn")
        const regForm = document.querySelector(".regForm")
        const formBtn = document.querySelector(".formBtn")
        const uploadBtn = document.querySelector(".uploadBtn")
        const uploadResult = document.querySelector(".uploadResult")
        //==================================================================
        document.querySelector(".uploadBtn").addEventListener("click", (e) => {
            e.stopPropagation()
            e.preventDefault()
//register에서 긇기

            const formObj = new FormData;
            const fileInput = document.querySelector(".uploadFile")

            const files = fileInput.files
            console.log(files)
            //multiple 은 여러게를 의미하고 그럼 배열로 들어오겟지

            for (let i = 0; i < files.length; i++) {
                console.log(files[i])
                formObj.append("files", files[i])
                //    formObj 라는 형식에 키|값을 추가하고 잇다
            }
            uploadToServer(formObj).then(resultArr => {
                uploadResult.innerHTML += resultArr.map(({uuid, thumbnail, link, fileName, savePath, img}) => `
                                <div data-uuid = '\${uuid}' data-img ='\${img}' data-filename = '\${fileName}' data-savepath = '\${savePath}'>
                                <img src='/view?fileName=\${thumbnail}' >
                                <button data-link='\${link}' class="delBtn">x</button>
                                \${fileName}</div>`).join(" ")
                //끝에 join안넣어주면 배열이라 , 가 사이에 붙네
            })

        }, false)

        regBtn.addEventListener("click", (e) => {
            e.preventDefault()
            e.stopPropagation()
            console.log("register")
            const divArr = document.querySelectorAll(".uploadResult > div")

            let str = ""
            for (let i = 0; i < divArr.length; i++) {
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

            const imgList = document.querySelector(".imgList")

            imgList.innerHTML += str
            regForm.submit()
        }, false)

        uploadResult.addEventListener("click", (e) => {
            e.preventDefault()
            e.stopPropagation()

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




        //===================================================================
        async function uploadToServer(formObj) {

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
            console.log(response.data)
            return response.data
        }
        async function deleteToServer(fileName){
            const options = {headers: { "Content-Type": "application/x-www-form-urlencoded"}}

            const res = await axios.post("/delete", "fileName="+fileName, options )

            console.log(res.data)

            return res.data
        }
    </script>


    </body>
    </html>
