<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="layoutSidenav">
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">수정</h1>
                <ol class="breadcrumb mb-4">

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

                                                    <div class="imgList mb-3">

                                                    </div>

<%--                                                    <div class="uploadResult">--%>
<%--                                                    </div>--%>

                                                    <div class="my-4">
                                                        <div class="float-end">
                                                            <button type="button" class="btn btn-primary listBtn">List</button>

                                                            <button type="button" class="modBtn btn btn-secondary ">작성완료</button>

                                                        </div>
                                                    </div>
    <%--                                            </form>--%>
                                                <div class="uploadResult flex-column w-25 h-100">
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
    const imgList = document.querySelector(".imgList")



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

        imgList.innerHTML += str
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
