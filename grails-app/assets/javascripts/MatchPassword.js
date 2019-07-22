 var MatchPassword=function()  {


    var password = document.getElementById("passWord").value;
    var confirmPassword = document.getElementById("passwordConfirm").value;
    if (password != confirmPassword) {

        document.getElementById("checkPass").innerHTML = "Not Match"
        //return false;
    } else{
        document.getElementById("checkPass").innerHTML = "Match"
        //return true;
    }
}