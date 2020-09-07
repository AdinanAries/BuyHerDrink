///jquery function for toggling in between login and signup pages
$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});

//this function logs the user in
function login_function(username, password){
    $.ajax({
        type: "GET",
        url: "./login_controller",
        data: "username="+username+"&password="+password,
        success: function(result){
            console.log(result);
            localStorage.setItem("BHDJWT", result);
            window.location.href = "./index.jsp";
            //document.getElementById("loadingPage").style.display = "none";
        }
    });
}

//this onclick event gets the username and password inputs and try to log in
$(document).ready(()=>{
    document.getElementById("login_btn").addEventListener("click", ()=>{
        document.getElementById("loadingPage").style.display = "flex";
        let username = document.getElementById("lgn_user_name_fld").value;
        let password = document.getElementById("lgn_password_fld").value;
        login_function(username, password);
    });
});

//loadingPage is display: block; by default, so set it to display none when page finishes loading
$(document).ready(()=>{
    document.getElementById("loadingPage").style.display = "none";
});
