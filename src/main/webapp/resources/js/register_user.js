async function registerUser() {

    const name = document.getElementsByClassName(".memName")
    const email = document.getElementsByClassName(".memEmail")
    const radioArray = document.getElementsByName("flexRadioDefault")

    let isCompanyChecked = radioArray[0].checked;
    let requestBody = {
        name: name.value,
        email: email.value,
    };
    let restUrl = '';
    if (isCompanyChecked) {
        restUrl = '/companySignUp';
    } else {
        restUrl = '/memberSignUp';
    }
    const response = await axios({
        method: 'post',
        url: restUrl,
        data: requestBody,
        headers: {
            'Content-Type': 'application/json',
        },
    });
    console.log(response);
}

//---------------------------------------

async function radioCheck (formObj) {

    console.log("radio check......")
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

