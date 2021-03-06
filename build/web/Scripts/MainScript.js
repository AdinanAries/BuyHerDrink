var SearchResultDiv = document.getElementById("SearchResultDiv");
var search_page_start_page = document.getElementById("search_page_start_page");
var no_available_drink_offers_msg = document.getElementById("no_available_drink_offers_msg");
var no_available_drink_request_msg = document.getElementById("no_available_drink_request_msg");
var showMoreMenuOnUserProfilePageSettingsIcons = document.getElementById("showMoreMenuOnUserProfilePageSettingsIcons")
var UserProfilePageSettingsDropDown = document.getElementById("UserProfilePageSettingsDropDown");
var UserProfileIconsNoticationSpan = document.getElementById("UserProfileIconsNoticationSpan");
var dropdown_hidden_options = document.getElementsByClassName("dropdown_hidden");
var ViewOffererFullProfileAndMakeOfferBtns = document.getElementsByClassName("ViewOffererFullProfileAndMakeOfferBtns")[0];
var ViewRequesteeFullProfileAndMakeOfferBtns = document.getElementsByClassName("ViewRequesteeFullProfileAndMakeOfferBtns")[0];

document.querySelector(".MainMenu").style.display = "none";
document.cookie = "SameSite=None;";

var SetWindowTitle = function(title){
    document.querySelector(".PageTitle").innerText = title;
};

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


var showUserProfile = function(){
    
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   ToggleMenuDisplay();
   SetWindowTitle("Your Profile");
   
   UserProfileIframe.style.display = "block";
   DrinkRequestsIframe.style.display = "none";
   DrinkOffersIframe.style.display = "none";
   ExploreRestaurantsDiv.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
   
};

var showDrinkOffers = function(){
    
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   ToggleMenuDisplay();
   SetWindowTitle("Drink Offers");
   
   UserProfileIframe.style.display = "none";
   DrinkRequestsIframe.style.display = "none";
   DrinkOffersIframe.style.display = "block";
   ExploreRestaurantsDiv.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
   
};

var showDrinkOffersNotMenu = () => {
    
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   SetWindowTitle("Drink Offers");
   
   UserProfileIframe.style.display = "none";
   DrinkRequestsIframe.style.display = "none";
   DrinkOffersIframe.style.display = "block";
   ExploreRestaurantsDiv.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
    
};

var showDrinkRequests = function(){
    
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   ToggleMenuDisplay();
   SetWindowTitle("Drink Requests");
   
   DrinkRequestsIframe.style.display = "block";
   UserProfileIframe.style.display = "none";
   DrinkOffersIframe.style.display = "none";
   ExploreRestaurantsDiv.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
   
};

var showExploreRestaurantsDiv = () => {
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   ToggleMenuDisplay();
   SetWindowTitle("Search Places");
   
   ExploreRestaurantsDiv.style.display = "block";
   DrinkRequestsIframe.style.display = "none";
   UserProfileIframe.style.display = "none";
   DrinkOffersIframe.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
   
   SearchResultDiv.style.display = "none";
   search_page_start_page.style.display = "block";
};

var showFullProfileDiv = (name, age, gender, address, user_id, image) => {
    //alert(user_id);
    document.getElementById("SFP_profile").src = image;
    document.getElementById("SFP_name").innerText = name;
    document.getElementById("SFP_age_gender").innerText = `${age} years, ${gender}`;
    document.getElementById("SFP_address").innerText = address;
    document.getElementById("SFP_email").innerText = 'email_from_db';
    document.getElementById("SFP_tel").innerText = 'tel_from_db';
    
    $( '#viewFullProfileDiv' ).toggle( 'up');
    
};

var showSettingsDiv = () => {
    let UserProfileIframe = document.getElementById("UserProfileIframe");
    let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
    let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
    let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
    let fullProfileDiv = document.getElementById("viewFullProfileDiv");
    let settingsDiv = document.getElementById("settingsDiv");
    
    ToggleMenuDisplay();
    SetWindowTitle("Settings");
    
    settingsDiv.style.display = "block";
    UserProfileIframe.style.display = "none";
    DrinkRequestsIframe.style.display = "none";
    DrinkOffersIframe.style.display = "none";
    ExploreRestaurantsDiv.style.display = "none";
    fullProfileDiv.style.display = "none";
};
var showSettingsWithoutMenuToggle = ()=>{
    let UserProfileIframe = document.getElementById("UserProfileIframe");
    let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
    let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
    let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
    let fullProfileDiv = document.getElementById("viewFullProfileDiv");
    let settingsDiv = document.getElementById("settingsDiv");
    
    SetWindowTitle("Settings");
    document.getElementById("settingsDivUploadProfile").style.display = "none";
    document.getElementById("settingsDivMainSettings").style.display = "block";
    
    settingsDiv.style.display = "block";
    UserProfileIframe.style.display = "none";
    DrinkRequestsIframe.style.display = "none";
    DrinkOffersIframe.style.display = "none";
    ExploreRestaurantsDiv.style.display = "none";
    fullProfileDiv.style.display = "none";
};

$("#SettingsMenuOption").click(function(event){
    showSettingsDiv();
    document.getElementById("settingsDivUploadProfile").style.display = "none";
    document.getElementById("settingsDivMainSettings").style.display = "block";
});

$("#editUserProfileIcon").click(function(){
    showSettingsWithoutMenuToggle();
});

var showYourDrinkRequests = () => {
    $("#YourDrinkRequestsDiv").toggle("up");
};

var showNotifications = () => {
    
    $("#notificationsDiv").toggle("up");
    
    if(document.getElementById("UserProfileIconsNoticationSpan").style.display === "block"){
        showDropDownMenuAtUserProfileSetting();
    }
};

var showGalleryDiv = () => {
    $("#galleryDiv").toggle("up");
};

var showUserActivity = () => {
    $("#UserActivityDiv").toggle("up");
};

var closeUserActivity = () => {
    $("#UserActivityDiv").toggle("up");
};

var closeNotification = () => {
    $("#notificationsDiv").toggle("up");
};

var closeGallery = () => {
    $("#galleryDiv").toggle("up");
};

var showUploadProfilePhotoPage = () => {
    let UserProfileIframe = document.getElementById("UserProfileIframe");
    let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
    let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
    let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
    let fullProfileDiv = document.getElementById("viewFullProfileDiv");
    let settingsDiv = document.getElementById("settingsDiv");
    
    SetWindowTitle("Settings");
    
    document.getElementById("settingsDivUploadProfile").style.display = "block";
    document.getElementById("settingsDivMainSettings").style.display = "none";
    
    settingsDiv.style.display = "block";
    UserProfileIframe.style.display = "none";
    DrinkRequestsIframe.style.display = "none";
    DrinkOffersIframe.style.display = "none";
    ExploreRestaurantsDiv.style.display = "none";
    fullProfileDiv.style.display = "none";
};

var vewFullScreenPhotoViewer = (imgSrc) =>{
    
    console.log(imgSrc);
    
    document.getElementById("fullScreenPhotoViewerImg").src = imgSrc;
    
    document.getElementById("fullScreenPhotoViewerImg").style.display = "none";
    document.getElementById("fullScreenPhotoViewerLoader").style.display = "block";
    
    setTimeout(()=>{
        document.getElementById("fullScreenPhotoViewerImg").style.display = "block";
        document.getElementById("fullScreenPhotoViewerLoader").style.display = "none";
    }, 2000);
    
    $("#fullScreenPhotoViewerContainer").toggle("up");
    document.getElementById("fullScreenPhotoViewerContainer").style.display = "flex";
};

$("#mainSettingsDivProfilePicture").click((evnt)=>{
    showUploadProfilePhotoPage();
});
$("#dashboardProfilePic").click((evnt)=>{
    showUploadProfilePhotoPage();
});
$("#back_to_main_settings_div").click((evnt)=>{
    document.getElementById("settingsDivUploadProfile").style.display = "none";
    document.getElementById("settingsDivMainSettings").style.display = "block";
});
/*$(".viewFullProfileBtn").click(function(event){
    alert("clicked");
    showFullProfileDiv();
});*/

$("#YourDrinkRequestMenuOption").click(function(event){
    showUserProfile();
    showYourDrinkRequests();
});

$("#closeYourDrinkRequestsDivBtn").click(function(event){
    showYourDrinkRequests();
});

$("#closeUserActivityBtn").click(function(event){
    closeUserActivity();
});

$("#closeNotificationBtn").click(function (event){
    closeNotification();
});

$("#closeGalleryBtn").click(function (event){
    closeGallery();
});

$("#YourActivitiesBtn").click(function(){
    showUserActivity();
});
$("#DatesMenuOption").click(function(){
    showUserActivity();
    showUserProfile();
});
$("#notificationsIcon").click(function (event){
    showNotifications();
});
$("#UserProfileIconsNoticationSpan").click(function (event){
    showNotifications();
});
$("#galleryIcon").click(function (event){
    showGalleryDiv();
});

$(".viewFullProfileBtn").click(function(event){
    showFullProfileDiv();
});

$("#UserProfileMenuOption").click(function(event){
    
    showUserProfile();
    
});

$("#DrinkRequestMenuOption").click(function(event){
    showDrinkRequests();
});

$("#DrinkOffersMenuOption").click(function(event){
    showDrinkOffers();
});


$("#viewDrinkOffersBtn").click(function(event){
    showDrinkOffersNotMenu();
});

$("#MenuOptionSearch").click(function(event){
    showExploreRestaurantsDiv();
});

function show_postpone_dinner_date_form(number){
    let ddf_elem = "postpone_dinner_date_form"+number;
    let update_btns_elem = "update_dinner_date_btns"+number;
    
    $("#"+ddf_elem).toggle('top');
    $("#"+update_btns_elem).toggle('top');
    
}

function show_cancel_dinner_date_form(number){
    let ddf_elem = "cancel_dinner_date_form"+number;
    let update_btns_elem = "update_dinner_date_btns"+number;
    
    $("#"+ddf_elem).toggle('top');
    $("#"+update_btns_elem).toggle('top');
    
}

function show_delete_request_form(number){
    let dlt_dr_elem = "delet_drink_request_form"+number;
    let update_dr_btns_elem = "update_your_drink_request_list_btns"+number;
    
    $("#"+dlt_dr_elem).toggle('top');
    $("#"+update_dr_btns_elem).toggle('top');
}

function check_if_drink_offers_list_node_are_all_hidden(){
    let drink_offers_list = document.getElementById("drink_offers_list");
    let isAllHidden = true;
    
    if(drink_offers_list.hasChildNodes()){
        Array.from(drink_offers_list.childNodes).forEach(item => {
            
            if($(item).is(':visible')){
                isAllHidden = false;
            }
            /*if(typeof item.style !== "undefined"){
                if(item.style.display === "block"){
                    isAllHidden = false;
                }
            }*/

        });
    }else{
        isAllHidden = true;
    }
    
    if(isAllHidden){
        document.getElementById("available_offers_p").style.display = "none";
        if(document.getElementById("see_highest_bidder_btn"))
            document.getElementById("see_highest_bidder_btn").style.display = "none";
        no_available_drink_offers_msg.style.display = "block";
        ViewOffererFullProfileAndMakeOfferBtns.style.display = "none";
    }else{
        no_available_drink_offers_msg.style.display = "none";
        if(document.getElementById("see_highest_bidder_btn"))
            document.getElementById("see_highest_bidder_btn").style.display = "block";
        ViewOffererFullProfileAndMakeOfferBtns.style.display = "flex";
        document.getElementById("available_offers_p").style.display = "block";
    }
}

setInterval(check_if_drink_offers_list_node_are_all_hidden ,1);

function check_if_drink_request_list_node_are_all_hidden(){
    let drink_requests_list = document.getElementById("drink_requests_list");
    let isAllHidden = true;
    
    if(drink_requests_list.hasChildNodes()){
        Array.from(drink_requests_list.childNodes).forEach(item => {
            
            if($(item).is(':visible')){
                isAllHidden = false;
            }
            /*if(typeof item.style !== "undefined"){
                if(item.style.display === "block"){
                    isAllHidden = false;
                }
            }*/

        });
    }else{
        isAllHidden = true;
    }
    
    if(isAllHidden){
        document.getElementById("available_requests_p").style.display = "none";
        no_available_drink_request_msg.style.display = "block";
        ViewRequesteeFullProfileAndMakeOfferBtns.style.display = "none";
    }else{
        ViewRequesteeFullProfileAndMakeOfferBtns.style.display = "flex";
        no_available_drink_request_msg.style.display = "none";
        document.getElementById("available_requests_p").style.display = "block";
    }
}

setInterval(check_if_drink_request_list_node_are_all_hidden ,1);

function showRestaurantsPopupListByAddress() {
  let RestaurantList = document.getElementById("RestaurantList");
  RestaurantList.classList.add("show");
  //popup.classList.toggle("show");
}
function hideRestaurantPopupListByAddress() {
    let RestaurantList = document.getElementById("RestaurantList");
    RestaurantList.classList.remove("show");
    
}

/*function rotateProfileSettingsDropDownCaret(degree){
    // For webkit browsers: e.g. Chrome
    $("#profilePageSettingsMenuDropDownbtnIcon").css({ WebkitTransform: 'rotate(' + degree + 'deg)'});
    // For Mozilla browser: e.g. Firefox
    $("#profilePageSettingsMenuDropDownbtnIcon").css({ '-moz-transform': 'rotate(' + degree + 'deg)'});

    // Animate rotation with a recursive call
    setTimeout(function() { rotateProfileSettingsDropDownCaret(++degree); },5);
}*/

UserProfilePageSettingsDropDown.style.display = "none";
var showDropDownMenuAtUserProfileSetting = ()=>{
    if(UserProfilePageSettingsDropDown.style.display === "none"){
        Array.prototype.slice.call(dropdown_hidden_options).forEach(elem => {
            elem.style.opacity = 0;
        });
        $("#editUserProfileIcon").off("click");
        $("#galleryIcon").off("click");
        UserProfileIconsNoticationSpan.style.display = "block";
        $("#UserProfilePageSettingsDropDown").slideDown("fast");
        
        document.getElementById("profilePageSettingsMenuDropDownbtnIcon").style.transform = "rotate(180deg)";
        
    }else{
        Array.prototype.slice.call(dropdown_hidden_options).forEach(elem => {
            elem.style.opacity = 1;
        });
        $("#editUserProfileIcon").click(function(evnt){
            showSettingsWithoutMenuToggle();
        });
        $("#galleryIcon").click(function (evnt){
            showGalleryDiv();
        });
        UserProfileIconsNoticationSpan.style.display = "none";
        $("#UserProfilePageSettingsDropDown").slideUp("fast");
        
        document.getElementById("profilePageSettingsMenuDropDownbtnIcon").style.transform = "rotate(360deg)";
    }
}
showMoreMenuOnUserProfilePageSettingsIcons.addEventListener("click", ()=>{
    showDropDownMenuAtUserProfileSetting();
});
showMoreMenuOnUserProfilePageSettingsIcons.addEventListener("click", ()=>{
    
});

function ProcessImageForBase64String(Path){
  
    //alert("result");
  
    $.ajax({
        url: "GetBase64StringControl",
        data: "ImgPath=" + Path,
        type: "GET",
        success: function(result){
            //alert(result);
        }
    });
      
}

ProcessImageForBase64String("http://localhost/ByHerDrinkUI/Pictures/TestPhotos/1.jpg");

$(document).ready(function(){
    $("").click(function(event){
        $.ajax({
            
        });
    });
});
