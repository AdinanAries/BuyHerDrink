document.querySelector(".MainMenu").style.display = "none";

function ToggleMenuDisplay() {
    document.querySelector( "#nav-toggle" ).classList.toggle( "active" );
    var MenuDisplay = document.querySelector(".MainMenu").style.display;
    
    if(MenuDisplay === "none"){
        
        $(".MainMenu").show("slide", { direction: "left" }, 100);
        
        /*$("#secondMenuIconBar").fadeOut("fast");
        
        $("#firstMenuIconBar").css({'transition' : '0.5s'});
        document.getElementById("firstMenuIconBar").style.cssText += 'top: 10px;';
        $("#firstMenuIconBar").css({'transform' : 'translateY(12px)'});
        $("#firstMenuIconBar").css({'transform' : 'rotate('+ 45 +'deg)'}, 100);
        
        $("#thirdMenuIconBar").css({'transition' : '0.5s'});
        document.getElementById("thirdMenuIconBar").style.cssText += 'top: 10px;';
        $("#thirdMenuIconBar").css({'transform' : 'translateY(-12px)'});
        $("#thirdMenuIconBar").css({'transform' : 'rotate('+ -45 +'deg)'}, 100);*/
        
        //$(".MainMenu").fadeIn("fast");
    }else{
        $(".MainMenu").hide("slide", { direction: "left" }, 100);
        
        /*$("#secondMenuIconBar").fadeIn("fast");
        $("#firstMenuIconBar").css({'transition' : '0.5s'});
        $("#firstMenuIconBar").css({'transform' : 'rotate('+ 0 +'deg)'}, 100);
        $("#thirdMenuIconBar").css({'transition' : '0.5s'});
        $("#thirdMenuIconBar").css({'transform' : 'rotate('+ 0 +'deg)'}, 100);*/
        
        //$(".MainMenu").fadeOut("fast");
    }
}

$(".MenuIcon").click(function(event){
    
    ToggleMenuDisplay();
});