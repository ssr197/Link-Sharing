 var MatchPassword=function()  {


    var password = document.getElementById("passWord").value;
    var confirmPassword = document.getElementById("passwordConfirm").value;
    if (password != confirmPassword) {
        alert("Enter Same Passwords")
        document.getElementById('passwordConfirm').value=""
        document.getElementById("passWord").value=""
    } else{
        document.getElementById("checkPass").innerHTML = "Match"
    }
}