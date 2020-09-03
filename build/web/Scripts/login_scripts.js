$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});

function login_function(username, password){
    $.ajax({
        type: "GET",
        url: "./login_controller",
        data: "username="+username+"&password="+password,
        success: function(result){
            console.log(result);
            localStorage.setItem("BHDJWT", result);
            window.location.href = "./index.jsp";
        }
    });
}

$(document).ready(()=>{
    document.getElementById("login_btn").addEventListener("click", ()=>{
        let username = document.getElementById("lgn_user_name_fld").value;
        let password = document.getElementById("lgn_password_fld").value;
        login_function(username, password);
    });
});

