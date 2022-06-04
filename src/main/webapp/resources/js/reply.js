const replyService = (function(){


    const addReply = async function(replyObj,size, callback){

        console.log("addReply.......")

        const res = await axios.post("/replies/", replyObj)

        const replyCount = parseInt(res.data.result)
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

    return {addReply, getList} //js파일을 가져다 사용할때 replyService.addReply  이런식으로 실행할수 있음

})() //모듈패턴, 즉시실행


const qs = function (str){
    return document.querySelector(str)
}//document.querySelector() 간소화

const qsAddEvent = function (selector, type, callback){
    const target = document.querySelector(selector)
    target.addEventListener(type, callback, false)
}//document.querySelector().addEventListener 간소화
