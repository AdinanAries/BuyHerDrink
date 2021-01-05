
function logout_function(userToken){
    window.location.href = "./login_and_signup.jsp";
    /*$.ajax({
        type: "GET",
        url: "./logout_controller",
        data: "user_token="+userToken,
        success: function(result){
            if(result === "success"){
                clean_mess();
                window.location.href = "./login_and_signup.jsp";
            }
        }
    });*/
}

function clean_mess(){
    localStorage.removeItem("BHDJWT");
}

$(document).ready(()=>{
    document.getElementById("logout_btn").addEventListener("click", ()=>{
        document.getElementById("loadingPage").style.display = "flex";
        let userData = JSON.parse(localStorage.getItem("BHDJWT"));
        let userToken = userData.token_id;
        logout_function(userToken);
    });
});


