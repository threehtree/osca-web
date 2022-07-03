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
                                <form class="regForm" action="/memberSignUp" method="post">

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
<%--                                    <div class="input-group mb-3">--%>
<%--                                        <input type="file" name="upload" class="uploadFile form-control" multiple>--%>
<%--                                        <button type="button" class="uploadBtn btn btn-success">Upload</button>--%>
<%--                                    </div>--%>
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

                                    <div class="uploadResult">
                                    </div>

                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="regBtn btn btn-primary btn-block" >작성 완료</button></div>
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



</html>
