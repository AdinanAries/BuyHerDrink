document.querySelector(".MainMenu").style.display = "none";

function ToggleMenuDisplay() {
    var MenuDisplay = document.querySelector(".MainMenu").style.display;
    
    if(MenuDisplay === "none"){
        
        $(".MainMenu").fadeIn("fast");
    }else{
        $(".MainMenu").fadeOut("fast");
    }
}

$(".MenuIcon").click(function(event){
    
    ToggleMenuDisplay();
});