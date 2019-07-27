/*
function checksignupForm(signupForm)
{
    if(signupForm.username.value === "") {
        alert("Error: Username cannot be blank!");
        signupForm.username.focus();
        return false;
    }
    re = /^\w+$/;
    if(!re.test(signupForm.username.value)) {
        alert("Error: Username must contain only letters, numbers and underscores!");
        signupForm.username.focus();
        return false;
    }



    if(signupForm.passWord.value !== "" && signupForm.passWord.value === signupForm.confirmPassword.value) {
        if(signupForm.passWord.value.length < 6) {
            alert("Error: Password must contain at least six characters!");
            signupForm.passWord.focus();
            return false;
        }
        if(signupForm.passWord.value === signupForm.username.value) {
            alert("Error: Password must be different from Username!");
            signupForm.passWord.focus();
            return false;
        }
        re = /[0-9]/;
        if(!re.test(signupForm.passWord.value)) {
            alert("Error: password must contain at least one number (0-9)!");
            signupForm.passWord.focus();
            return false;
        }
        re = /[a-z]/;
        if(!re.test(signupForm.passWord.value)) {
            alert("Error: password must contain at least one lowercase letter (a-z)!");
            signupForm.passWord.focus();
            return false;
        }
        re = /[A-Z]/;
        if(!re.test(signupForm.passWord.value)) {
            alert("Error: password must contain at least one uppercase letter (A-Z)!");
            signupForm.passWord.focus();
            return false;
        }
    }
    else {
        alert("Error: Please check that you've entered and confirmed your password!");
        signupForm.passWord.focus();
        return false;
    }

    alert("You entered a valid password: " + signupForm.passWord.value);
    return true;
}*/
