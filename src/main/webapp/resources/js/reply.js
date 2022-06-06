const replyService = (function(){

    let replyCountFn;

    const setReplyCount = function (fn){
        replyCountFn = fn
    }

    const addReply = async function(replyObj,size, callback){

        console.log("addReply.......")

        const res = await axios.post("/replies/", replyObj)

        const replyCount = parseInt(res.data.result)

        console.log("reply.js")
        console.log(replyCount)
        replyCountFn(replyCount)

        //json은 문자열입니다
        const qaNo = replyObj.qaNo
        const page = Math.ceil(replyCount/size)


        callback({qaNo,page,size})
    }

    const getList = async function({qaNo,page,size}, callback){
        console.log("getList.......",qaNo, page, size)


        const parameter = { page:page||1, size:size||10 } //Js 에서 or 연산자임, null일때 생각

        const res = await axios.get(`/replies/list/${qaNo}`,{params:parameter}) //axios 로 쿼리스트링 넘길때는 이렇게
        // console.log(res.data)

        callback(res.data)

    }



    return {addReply, getList, setReplyCount} //js파일을 가져다 사용할때 replyService.addReply  이런식으로 실행할수 있음

})() //모듈패턴, 즉시실행


const qs = function (str){
    return document.querySelector(str)
}//document.querySelector() 간소화

const qsAddEvent = function (selector, type, callback, tagName){//js는 파라미터 상관없이 작동은 된다
    const target = document.querySelector(selector)
    if(!tagName){
    target.addEventListener(type, callback, false)
    }else {
        target.addEventListener(type, (e)=> {
            e.preventDefault()
            e.stopPropagation()//todo 내가 넣음 오류시 이거겟지

            const realTarget = e.target
            if(realTarget.tagName !== tagName.toUpperCase()){//tagName은 대문자로 반환된다
                return
            }
            callback(e,realTarget)

        },false )
    }
}//document.querySelector().addEventListener 간소화

async function getReply(rno) {
    const response = await axios.get(`/replies/${rno}`)
    return response.data
}
async function modifyReply(replyObj) {

    const response = await axios.put(`/replies/${replyObj.rno}`, replyObj)
    console.log(response.data)
    return response.data
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

