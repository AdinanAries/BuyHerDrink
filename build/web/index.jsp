<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>BuyHerDrink</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="StyleSheets/MainStyles.css" rel="stylesheet" type="text/css"/>
        
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel='stylesheet'>

        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.9.1/jquery-ui.min.js" integrity="sha256-UezNdLBLZaG/YoRcr48I68gr8pb5gyTBM+di5P8p6t8=" crossorigin="anonymous"></script>
        
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&libraries=places"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        
    </head>
    
    <script>
        
        //Get user login jwt token 
        var userToken = JSON.parse(localStorage.getItem("BHDJWT"));
        
        //function definition for displaying currently logged in user information
        function display_user_profile_info(username, gender, age, address){
            document.getElementById("user_info_name_display").innerText = username;
            document.getElementById("user_info_gender_display").innerText = gender;
            document.getElementById("user_info_age_display").innerText = age;
            document.getElementById("user_info_address_display").innerText = address;
        };
        
        //function that calls the backend server to verify if user's tokenId is valid as a logged in user
        function checkUserLoginStatus(){
            $.ajax({
                type: "GET",
                url: "./isUserLoggedIn",
                data: "token="+userToken.token_id,
                success: function(result){
                    if(result === "true"){
                        //get updated information here
                        document.getElementById("loadingPage").style.display = "none";
                    }else if(result === "false"){
                        window.location.href = "./login_and_signup.jsp";
                    }
                }
            });
        }
        
        //flow control that handles whether user gets sent to login/signup page or checkes if verification of token is needed to allow user login
        //if userToken is null, then it is not present in localStorage
        if(userToken === null){
            window.location.href = "./login_and_signup.jsp";
        }else{
            checkUserLoginStatus();
            $(document).ready(()=>{
                display_user_profile_info(userToken.user_name, userToken.gender, userToken.age, userToken.area);
            });
        }
        
        
    </script>
    
    <body>
        <div id='loadingPage'>
            <div class='loader_container'>
                <div class="loader">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <p style='margin: 10px 0; color: darkgrey; font-weight: bolder; opacity: 0.8; text-align: center;'>&copy; 2020, BuyMeDrink</p>
        </div>
        <div class='Container'>
            <div class='wrapper'>
                <div class='Header'>
                    <div class='MenuIcon' style=''>
                        <a id="nav-toggle" href="#"><span></span></a>
                        <!--div id='firstMenuIconBar' style=''></div>
                        <div id='secondMenuIconBar' style=''></div>
                        <div id='thirdMenuIconBar' style=''></div-->
                    </div>
                    <div style='display: flex; flex-direction: column; justify-content: center;'>
                        <p class='PageTitle'>Your Profile<p>
                    </div>
                    <div class='LogoDiv' >
                        <img src='buyherdrinkLOGO.png' style='width: 60px; height: auto;' />
                    </div>
                </div>
                <div class='Main'>
                    <div class='MainMenu'>
                        <table>
                            <tbody>
                                <tr id="UserProfileMenuOption">
                                    <td>
                                        <img src="icons/icons8-user-48.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Profile
                                    </td>
                                </tr>
                                <tr id="DrinkOffersMenuOption">
                                    <td>
                                        <img src="icons/icons8-champagne-48_1.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Drink Offers
                                    </td>
                                </tr>
                                <tr id="DrinkRequestMenuOption">
                                    <td>
                                        <img src="icons/icons8-cocktail-48.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Published Requests
                                    </td>
                                </tr>
                                <tr id="YourDrinkRequestMenuOption">
                                    <td>
                                        <img src="icons/icons8-cocktail-46.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Your Drink Requests
                                    </td>
                                </tr>
                                <tr id="MenuOptionSearch">
                                    <td>
                                        <img src="icons/ExploreIcon.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Search Places
                                    </td>
                                </tr>
                                <tr id="SettingsMenuOption">
                                    <td>
                                        <img src="icons/icons8-settings-48.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Settings
                                    </td>
                                </tr>
                                <tr id="DatesMenuOption">
                                    <td>
                                        <i style="margin-right: 5px; color: goldenrod;" class="fa fa-list" aria-hidden="true"></i>
                                    </td>
                                    <td class="SettingName">
                                        Your Dates <sup style="font-size: 14px; color: #4CAF50; margin-left: 5px; font-weight: bolder;">3</sup>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="SearchDiv">
                        <span><i class="fa fa-map-marker"></i></span>
                        <input id="main_search_fld" type="text" placeholder="enter address to search" class="MainSearchFld" />
                        <span style="color: darkgrey;">Type:</span>
                        <select id="main_search_types">
                            <option value="restaurant">
                                Restaurant
                            </option>
                            <option value="bar">
                                Bar
                            </option>
                            <option value="park">
                                Park
                            </option>
                            <option value="movie_theater">
                                Movie Theater
                            </option>
                            <option value="museum">
                                Museum
                            </option>
                            <option value="cafe">
                                Cafe
                            </option>
                        </select>
                        <div class="MainSearchBtn" >
                            <img src="icons/ExploreIcon.png" alt=""/>
                        </div>
                        <p style="clear: both;"></p>
                    </div>
                    <div id='UserProfileIframe'>
                        <div id='notificationsDiv'>
                            <div>
                                <img id="closeNotificationBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                <p style="width: 100%; text-align: center; margin-top: -30px; color: darkblue; font-weight: bolder;">Notifications</p>
                            </div>
                        </div>
                        <div id='YourDrinkRequestsDiv'>
                            <div id="your_drink_requests_header">
                                <div>
                                    <img id="closeYourDrinkRequestsDivBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                    <p style="width: 100%; text-align: center; color: black; font-weight: bolder; margin-top: -30px;">Your Drink Requests</p>
                                </div>
                                <p style="font-weight: bolder; text-align: center; font-size: 14px; color: #37a0f5;">&COPY; 2020, BuyMeDrink</p>
                            </div>
                            
                            <div id='YourDrinkRequestsListDiv' style='padding-top: 70px;'>
                                <div class='each_your_drink_request_div' id="each_your_drink_request_div0">
                                    <div>
                                        <p style='font-weight: bolder; color: darkblue; margin-bottom: 10px; margin-left: 5px;'>Restaurant Name</p>
                                        <div style='height: 200px; background-color: #D9DADC; margin-bottom: 10px; overflow: hidden;'>
                                            <img style='width: 100%; height: auto;'
                                                src='https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sCmRaAAAALfEmoWwMDroJAku0GVwK-rWuKwFvgHYVs2CTlV8SSBW0RKsc3h6sfAmM19Dnve0Ki9xC6hKz2hyUEeSW5p5oAzc7vWkk1secdPs90VPIicUx_4noDCCx8Ipqp5xacljLEhBXejtuBJV-RnOpbXw6djCMGhQM4ScWIC9ysBFkXicMadvctBrdVA&3u1920&5m1&2e1&callback=none&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&token=54222' />
                                        </div>
                                        <div style='padding: 5px;'>
                                            <p style='color: darkblue;'><img src="https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png" style="width: 20px; height: auto;"/> <span style="font-size: 20px;">&#9733;&#9734;&#9734;&#9734;&#9734;</span></p>
                                            <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> <span><span>Restaurant location here</span></span><p>

                                            <p style='color: darkgrey; padding-top: 10px;'>
                                                <i class="fa fa-calendar" aria-hidden="true"></i> <span style='color: darkblue; margin-right: 15px;'>2/2/2020</span>
                                                <i style='font-size: 20px;' class="fa fa-clock-o" aria-hidden="true"></i> <span style='color: darkblue;'>10:00am</span>
                                            </p>
                                            <p style='color: darkgrey; padding-bottom: 10px;'>
                                                <i class="fa fa-glass" aria-hidden="true"></i> <span style='color: darkblue; margin-right: 15px;'>Drink</span>
                                                <i class="fa fa-money" aria-hidden="true"></i> <span style='color: darkblue;'>$15.00</span>
                                            </p>
                                            <p style="color: darkgrey;">types: </p>
                                            <p>restaurant, food, point of interest, establishment</p>
                                        </div>
                                    </div>
                                    <div class='delete_drink_request_form' id="delet_drink_request_form0">
                                        <p style="text-align: center; color: #4d4d4d; font-size: 15px; font-weight: bolder; margin: 5px 0;">
                                            <i class="fa fa-exclamation" style="color: red;"></i> Are you sure you want to remove this request
                                        </p>

                                        <div style="display: flex; justify-content: center; padding: 5px;">
                                            <div class="delete_drink_request_btns">
                                                <div class='delete_drink_request_yes_btn'>Yes</div>
                                                <div onclick="show_delete_request_form('0');" class='delete_drink_request_no_btn'>No</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id='update_your_drink_request_list_btns0' class='update_your_drink_request_list_btns' style='display: flex; justify-content: space-between; padding: 5px;'>
                                        <div 
                                            onclick='start_update_drink_request(0,"user_id","drink_request_id","2/2/2020","10:00am","Cafe Bravo","restaurant, food, point of interest, establishment",
                                                        "&#9733;&#9734;&#9734;&#9734;&#9734;", 1,"https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png","Drink","9th Avenue, New York, NY, USA","$15.00",
                                                        "https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sCmRaAAAALfEmoWwMDroJAku0GVwK-rWuKwFvgHYVs2CTlV8SSBW0RKsc3h6sfAmM19Dnve0Ki9xC6hKz2hyUEeSW5p5oAzc7vWkk1secdPs90VPIicUx_4noDCCx8Ipqp5xacljLEhBXejtuBJV-RnOpbXw6djCMGhQM4ScWIC9ysBFkXicMadvctBrdVA&3u1920&5m1&2e1&callback=none&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&token=54222");' 
                                            class='your_drink_request_update_btn'>
                                            Update
                                        </div>
                                        <div onclick="show_delete_request_form('0');" class='your_drink_request_delete_btn'>
                                            Delete
                                        </div>
                                    </div>
                                </div>
                                <div class='each_your_drink_request_div' id="each_your_drink_request_div0">
                                    <div>
                                        <p style='font-weight: bolder; color: darkblue; margin-bottom: 10px; margin-left: 5px;'>Restaurant Name</p>
                                        <div style='height: 200px; background-color: #D9DADC; margin-bottom: 10px; overflow: hidden;'>
                                            <img style='width: 100%; height: auto;'
                                                src='https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sCmRaAAAALfEmoWwMDroJAku0GVwK-rWuKwFvgHYVs2CTlV8SSBW0RKsc3h6sfAmM19Dnve0Ki9xC6hKz2hyUEeSW5p5oAzc7vWkk1secdPs90VPIicUx_4noDCCx8Ipqp5xacljLEhBXejtuBJV-RnOpbXw6djCMGhQM4ScWIC9ysBFkXicMadvctBrdVA&3u1920&5m1&2e1&callback=none&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&token=54222' />
                                        </div>
                                        <div style='padding: 5px;'>
                                            <p style='color: darkblue;'><img src="https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png" style="width: 20px; height: auto;"/> <span style="font-size: 20px;">&#9733;&#9734;&#9734;&#9734;&#9734;</span></p>
                                            <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> <span><span>Restaurant location here</span></span><p>

                                            <p style='color: darkgrey; padding-top: 10px;'>
                                                <i class="fa fa-calendar" aria-hidden="true"></i> <span style='color: darkblue; margin-right: 15px;'>9/2/2020</span>
                                                <i style='font-size: 20px;' class="fa fa-clock-o" aria-hidden="true"></i> <span style='color: darkblue;'>12:00am</span>
                                            </p>
                                            <p style='color: darkgrey; padding-bottom: 10px;'>
                                                <i class="fa fa-glass" aria-hidden="true"></i> <span style='color: darkblue; margin-right: 15px;'>Drink</span>
                                                <i class="fa fa-money" aria-hidden="true"></i> <span style='color: darkblue;'>$5.00</span>
                                            </p>
                                            <p style="color: darkgrey;">types: </p>
                                            <p>restaurant, food, point of interest, establishment</p>
                                        </div>
                                    </div>
                                    <div class='delete_drink_request_form' id="delet_drink_request_form1">
                                        <p style="text-align: center; color: #4d4d4d; font-size: 15px; font-weight: bolder; margin: 5px 0;">
                                            <i class="fa fa-exclamation" style="color: red;"></i> Are you sure you want to remove this request
                                        </p>

                                        <div style="display: flex; justify-content: center; padding: 5px;">
                                            <div class="delete_drink_request_btns">
                                                <div class='delete_drink_request_yes_btn'>Yes</div>
                                                <div onclick="show_delete_request_form('1');" class='delete_drink_request_no_btn'>No</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id='update_your_drink_request_list_btns1' class='update_your_drink_request_list_btns' style='display: flex; justify-content: space-between; padding: 5px;'>
                                        <div 
                                            onclick='start_update_drink_request(1,"user_id","drink_request_id","date", "time","rest_name","rest_location","price");'
                                            class='your_drink_request_update_btn'>
                                            Update
                                        </div>
                                        <div onclick="show_delete_request_form('1');" class='your_drink_request_delete_btn'>
                                            Delete
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id='UserActivityDiv'>
                            <div id="dinner_dates_header">
                                <img id="closeUserActivityBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                <p style="font-weight: bolder; width: 100%; text-align: center; margin-top: -30px; margin-bottom: 5px;">Your Dates 
                                    <sup style="color: #4CAF50; margin-left: 5px; font-weight: bolder;">3</sup>
                                </p>
                                <p style="font-weight: bolder; text-align: center; font-size: 14px; color: darkgray">&COPY; 2020, BuyMeDrink</p>
                            </div>
                            <div>
                                <div id="dates_list_container">
                                    
                                </div>
                            </div>
                        </div>
                        <div id='galleryDiv'>
                            <div style='display: flex; flex-direction: column; justify-content: center;'>
                                <div>
                                    <img id="closeGalleryBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                    <p style="width: 100%; text-align: center; margin-top: -30px;">Your Photos</p>
                                </div>
                                <div style='display: flex; flex-direction: column; justify-content: center; padding-top: 15px;'>
                                    <div style='display: flex; justify-content: center;'>
                                        <div style='height: 45vh; width: 48%; background-color: #333333; border-radius: 5px; margin-right: 5px; display: flex; flex-direction: column; justify-content: center;'>
                                            <p style='text-align: center;'><i class="fa fa-plus" aria-hidden="true" style='color: #4CAF50; font-size: 45px;'></i></p>
                                        </div>
                                        <div style='height: 45vh; width: 48%; background-color: #333333; border-radius: 5px; display: flex; flex-direction: column; justify-content: center;'>
                                            <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                        </div>
                                    </div>
                                    <div style='display: flex; justify-content: center; margin-top: 5px;'>
                                        <div style='height: 45vh; width: 48%; background-color: #333333; border-radius: 5px; margin-right: 5px; display: flex; flex-direction: column; justify-content: center;'>
                                            <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                        </div>
                                        <div style='height: 45vh; width: 48%; background-color: #333333; border-radius: 5px; display: flex; flex-direction: column; justify-content: center;'>
                                            <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class='ProfileDetailsDiv'>
                            <div class="ProfileCover">
                                <div class='ProfilePicture'>
                                    <img src="Pictures/ProfilePicPlaceHolder.jpg" alt="">
                                </div>
                                <div class="UserProfileSettingsIcons">
                                    <img id="galleryIcon" src="icons/icons8-photo-gallery-20.png" alt=""/>
                                    <span id='notificationsIcon'><img src="icons/icons8-notification-50.png" alt=""/>
                                        <span class='notificationCounter'>0</span></span>
                                    <img id="editUserProfileIcon" src="icons/icons8-pencil-20.png" alt=""/>
                                </div>
                                <p style="height: 0; clear: both;"></p>
                            </div>
                            <div class='ProfileDetailsInfoDiv'>
                                <p id='user_info_name_display' style="font-weight: bolder;"></p>
                                <p><span style='font-size: 16px;' id='user_info_gender_display'></span>, <span style='font-size: 16px;' id='user_info_age_display'></span> years</p>
                                <p id='user_info_address_display'></p>
                            </div>
                            <div class="ActivitiesAndDrinkOffersBtn">
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr>
                                            <td id="YourActivitiesBtn">
                                                <p style="font-size: 14px; font-weight: bolder;">
                                                    <i style="margin-right: 5px; color: goldenrod;" class="fa fa-list" aria-hidden="true"></i>
                                                    Your Dates <sup style="font-size: 14px; color: #4CAF50; margin-left: 5px; font-weight: bolder;">3</sup>
                                                </p>
                                            </td>
                                            <td id="viewDrinkOffersBtn">
                                                <p style="font-size: 14px; font-weight: bolder;">
                                                    <i style="margin-right: 5px; color: goldenrod;" class="fa fa-glass" aria-hidden="true"></i>
                                                    Drink Offers <sup style="font-size: 14px; color: seagreen; margin-left: 5px; font-weight: bolder;">5</sup>
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class='PublishRequestDiv'>
                            <p style="text-align: center; font-weight: bolder; margin-top: 10px; font-size: 16px;">Publish Drink Request Below</p>
                            <p style="margin: 10px 5px; font-size: 15px; color: darkgray; text-align: center;">
                                    A drink request lets you reach out for potential date.
                                    Other people will see your drink request and make an offer.
                                    Then its up to you to either accept or decline their offer.
                            </p>
                            <div class="PublishDrinkFieldSet">
                                <div id="map" style="height: 200px;"></div>
                                <fieldset id="publish_drink_request_fields" style="border: 1px solid pink; margin: 5px; font-size: 15px;">
                                  <legend style="font-size: 15px; font-weight: bolder;">Add Bar/Restaurant</legend>
                                  <table>
                                      <tbody>
                                        <tr>
                                            <td>
                                                <i style="font-size: 22px; margin: 0 10px;" class="fa fa-bars" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <div>
                                                    <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Choose a type of place</p>
                                                    <select id="add_place_search_types">
                                                        <option value="restaurant">
                                                            Restaurant
                                                        </option>
                                                        <option value="bar">
                                                            Bar
                                                        </option>
                                                        <option value="park">
                                                            Park
                                                        </option>
                                                        <option value="movie_theater">
                                                            Movie Theater
                                                        </option>
                                                        <option value="museum">
                                                            Museum
                                                        </option>
                                                        <option value="cafe">
                                                            Cafe
                                                        </option>
                                                    </select>
                                                </div> 
                                            </td>
                                        </tr>
                                        <tr style="background-color: #afe9ff;">
                                            <td>
                                              <!--img class="RegularIcons_3" src="icons/icons8-marker-filled-30_1.png" alt=""/-->
                                              <i style="font-size: 22px; margin: 0 10px;" class="fa fa-map-marker" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                              <div class="RestaurantListPopup" style="width: 100%">
                                                  <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Search places by location:</p>
                                                <input id="rest_locations_input_fld" onclick="hideRestaurantPopupListByAddress();" type="text"  placeholder="resturant/bar location" name="BarAddress" /><br />
                                                <div class="RestaurantListDiv" id="RestaurantList" style="width: 100%;">
                                                    <p style="text-align: right; padding-right: 10px;"><span onclick="hideRestaurantPopupListByAddress();" style="color: white; background-color: red; padding: 0 10px; border-radius: 4px;">x</span></p>
                                                    <p style="color: seagreen; font-size: 14px; margin: 0 5px; padding: 5px 0; border-bottom: cadetblue 1px solid;"><i class="fa fa-map-marker" style="color: black; font-size: 20px;" aria-hidden="true"></i> <span id="rests_list_location_display">2034 murthal ave. Brookly, NY 1203</span></p>
                                                    <div id="rest_list_scroll_div" style="height: 300px; overflow-y: auto; background-color: #98d7ff; margin: 0 5px;">
                                                        <ul id="current_restaurants_list" style="text-align: left; margin: 5px 0;">

                                                        </ul>
                                                    </div>
                                                </div>
                                                <button id="search_restaurants_btn" onclick="showRestaurantsPopupListByAddress()" style="font-size: 14px; bottom: 5px; width: fit-content; border: 0; padding: 5px; background-color: #98d7ff; color: red; border-radius: 4px;">Browse Restaurants</button>
                                              </div>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <!--img class="RegularIcons_3" src="icons/icons8-restaurant-table-50 (1).png" alt=""/-->
                                                <i style="font-size: 22px; margin: 0 10px;" class="fa fa-map-marker" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Search place by name:</p>
                                                <input id="search_rest_by_name_fld" onclick="hideRestaurantPopupListByAddress();" type="text" name="Bar"  placeholder="resturant/bar name" /><br />
                                                <button id="ABR_confirm_restaurant_btn" onclick="showRestaurantsPopupListByAddress()" style="font-size: 14px; bottom: 5px; width: fit-content; border: 0; padding: 5px; background-color: #98d7ff; color: red; border-radius: 4px;">Confirm Restaurant</button>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #afe9ff;" onclick="hideRestaurantPopupListByAddress();">
                                            <td style="padding-right: 10px;"> 
                                                <!--img class="RegularIcons_3" src="icons/icons8-watch-filled-30.png" alt=""/-->
                                                <i style="font-size: 22px; margin: 0 10px;" class="fa fa-calendar" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Add date and time:</p>
                                                <input id="PDR_date_fld" style="width: 100px; margin-right: 10px;" type="text" placeholder="add date here" />
                                                -
                                                <select id='PDR_time_fld'>
                                                    <option>12:00am</option>
                                                    <option>1:00am</option>
                                                    <option>2:00am</option>
                                                    <option>3:00am</option>
                                                    <option>4:00am</option>
                                                    <option>5:00am</option>
                                                    <option>6:00am</option>
                                                    <option>7:00am</option>
                                                    <option>8:00am</option>
                                                    <option>9:00am</option>
                                                    <option>10:00am</option>
                                                    <option>11:00am</option>
                                                    <option>12:00pm</option>
                                                    <option>1:00pm</option>
                                                    <option>2:00pm</option>
                                                    <option>3:00pm</option>
                                                    <option>4:00pm</option>
                                                    <option>5:00pm</option>
                                                    <option>6:00pm</option>
                                                    <option>7:00pm</option>
                                                    <option>8:00pm</option>
                                                    <option>9:00pm</option>
                                                    <option>10:00pm</option>
                                                    <option>11:00pm</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr onclick="hideRestaurantPopupListByAddress();">
                                            <td>
                                                <!--img class="RegularIcons_3" src="icons/icons8-cash-50.png" alt=""/-->
                                                <i style="font-size: 22px; margin: 0 10px;" class="fa fa-money" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Put a price on your date:</p>
                                                <select id='PDR_price_fld'>
                                                    <option>$5.00</option>
                                                    <option>$10.00</option>
                                                    <option>$15.00</option>
                                                    <option>$20.00</option>
                                                    <option>$25.00</option>
                                                    <option>$30.00</option>
                                                    <option>$35.00</option>
                                                    <option>$5.00</option>
                                                    <option>$45.00</option>
                                                    <option>$50.00</option>
                                                    <option>$55.00</option>
                                                    <option>$60.00</option>
                                                    <option>$65.00</option>
                                                    <option>$70.00</option>
                                                    <option>$75.00</option>
                                                    <option>$80.00</option>
                                                    <option>$85.00</option>
                                                    <option>$90.00</option>
                                                    <option>$95.00</option>
                                                    <option>$100.00</option>
                                                    <option>$200.00</option>
                                                    <option>$300.00</option>
                                                    <option>$400.00</option>
                                                    <option>$500.00</option>
                                                    <option>$500+</option>
                                                </select>
                                            </td>
                                        </tr>
                                        </tbody>
                                </table>
                                      </fieldset>

                                      <fieldset style="border: 1px solid pink; margin: 5px; font-size: 15px;" onclick="hideRestaurantPopupListByAddress();">
                                        <legend style="font-size: 15px; font-weight: bolder;">Purpose</legend>
                                        <input checked="true" id="DrinkOnlyPurpose" name="MeetingPurpose" type="checkbox" style="margin-right: 5px;" /><label style="font-size: 14px; margin-right: 10px;" for="DrinkOnlyPurpose">Drink</label> |
                                        <input id="DinnerOnlyPurpose" name="MeetingPurpose" type="checkbox" style="margin-left: 10px; margin-right: 5px;"/><label style="font-size: 14px; margin-right: 10px;" for="DinnerOnlyPurpose">Dinner</label> |
                                        <input id="DrinkAndDinnerPurpose" name="MeetingPurpose" type="checkbox" style="margin-left: 10px; margin-right: 5px;" /><label style="font-size: 14px;" for="DrinkAndDinnerPurpose">Other</label>
                                      </fieldset>

                                      <fieldset style="border: 1px solid pink; margin: 5px; font-size: 15px;" onclick="hideRestaurantPopupListByAddress();">
                                        <legend style="font-size: 15px; font-weight: bolder;">Add Notes</legend>
                                        <center><textarea id='PDR_notes_fld' style="width: 95%; height: 70px;">

                                        </textarea></center>
                                      <script>
                                          document.getElementById("PDR_notes_fld").innerText = "";
                                      </script>
                                      </fieldset>
                            </div>
                            <div id="PDR_details_pane">
                                <p style="text-align: center; font-weight: bolder; font-size: 16px; padding: 10px 0;">Review and Post</p>
                                <div style="margin: 5px; border: #37a0f5 1px solid; padding: 5px; background-color: #d4f3ff;">
                                    <p id='RP_rest_name' style="font-weight: bolder; color: blue;"><i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></p> 
                                         <div style="background-color: white; padding: 5px; margin-top: 5px; border-radius: 4px;">
                                            <div style="margin: 5px 0;">
                                                <div style="display: flex; justify-content: space-between; margin-bottom: 5px; padding-bottom: 5px;">
                                                    <div style="width: 200px; height: 100px; overflow: hidden;">
                                                        <img id='RP_rest_photo' src="" style="width: 200px; height: auto;"/>
                                                    </div>
                                                    <p id="RP_post_request_btn" style="padding: 0 20px; background-color: darkslateblue; color: white; border-radius: 4px; font-weight: bolder; height: 60px; display: flex; flex-direction: column; justify-content: center;">Post</p>
                                                    <p id="RP_update_request_btn" style="display: none; padding: 0 20px; background-color: darkslateblue; color: white; border-radius: 4px; font-weight: bolder; height: 60px; flex-direction: column; justify-content: center;">Update</p>
                                                </div>
                                                <p><img id='RP_rest_icon' src="" style="width: 20px; height: auto;"/> <span id='RP_rest_rating' style="color: #37a0f5; font-size: 20px;">&#9733;&#9734;&#9734;&#9734;&#9734;</span></p>
                                                <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> <span id='RP_rest_location'><i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></span><p>
                                                <p style='color: darkgrey; padding-top: 10px;'>
                                                    <i class="fa fa-calendar" aria-hidden="true"></i> <span id='RP_date_display' style='color: darkblue; margin-right: 15px;'>9/2/2020</span>
                                                    <i style='font-size: 20px;' class="fa fa-clock-o" aria-hidden="true"></i> <span id='RP_time_display' style='color: darkblue;'>12:00am</span>
                                                </p>
                                                <p style='color: darkgrey; padding-bottom: 10px;'>
                                                    <i class="fa fa-glass" aria-hidden="true"></i> <span id='RP_purpose_display' style='color: darkblue; margin-right: 15px;'>Drink</span>
                                                    <i class="fa fa-money" aria-hidden="true"></i> <span id='RP_price_display' style='color: darkblue;'>$5.00</span>
                                                </p>
                                             </div>
                                             <p style="color: darkgrey;">types: </p>
                                             <p id='RP_rest_types'><i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></p>
                                         </div>
                                         
                                    </div>
                                <!--p class="UserProfilePageSubmitDrinkRequestBtn"></p-->
                            </div>
                        </div>
                    </div>
                    <div id="DrinkRequestsIframe">
                        
                        <div class="DrinkRequestDiv">
                            <div id="selected_drink_request_user_info">
                                
                            </div>
                            
                            <div class="RequesteeAdditionalMessage">
                                <div id="current_selected_drink_request">
                                    
                                </div>
                                
                                <div id="drink_bidding_form" style="display: none; padding: 5px; padding-top: 10px; border-top: 1px solid #D9DADC; margin-top: 10px;">
                                    <p style="font-size: 17px; padding: 5px 0; color: darkblue; font-weight: bolder; min-width: 200px;"><i style="margin-right: 5px;" class="fa fa-money"></i> name your price here:</p>
                                    <select style="font-size: 15px; border: 1px solid black;" id='bidding_price_fld'>
                                        <option>$5.00</option>
                                        <option>$10.00</option>
                                        <option>$15.00</option>
                                        <option>$20.00</option>
                                        <option>$25.00</option>
                                        <option>$30.00</option>
                                        <option>$35.00</option>
                                        <option>$5.00</option>
                                        <option>$45.00</option>
                                        <option>$50.00</option>
                                        <option>$55.00</option>
                                        <option>$60.00</option>
                                        <option>$65.00</option>
                                        <option>$70.00</option>
                                        <option>$75.00</option>
                                        <option>$80.00</option>
                                        <option>$85.00</option>
                                        <option>$90.00</option>
                                        <option>$95.00</option>
                                        <option>$100.00</option>
                                        <option>$200.00</option>
                                        <option>$300.00</option>
                                        <option>$400.00</option>
                                        <option>$500.00</option>
                                        <option>$500+</option>
                                    </select>
                                </div>
                                
                                <div id="drink_request_comments_div">
                                    <textarea id="drink_request_comments_fld">add your comments here
                                    </textarea>
                                </div>
                                
                                <p id="drink_request_status_P" class="status_text"></p>
                                
                                <div class="ViewRequesteeFullProfileAndMakeOfferBtns">
                                    <div id="customizeOfferBtn" style="background-color: aquamarine;">
                                        Add Comments
                                        <i style="margin-left: 10px;" class="fa fa-commenting" aria-hidden="true"></i>
                                    </div>
                                    <div id="mainMakeOfferBtn" style="background-color: pink;">
                                        Make Offer
                                        <i style="margin-left: 10px;" class="fa fa-check"></i>
                                    </div>
                                </div>
                                
                            </div>
                            
                            <p id='available_requests_p' style="text-align: center; font-size: 14px; font-weight: bolder; color: darkblue; margin-top: 5px;">Available Requests</p>
                            <div class="DrinkRequesteesListDiv">
                                <p id='no_available_drink_request_msg' style='margin-top: 20px; margin-bottom: 80px; text-align: center;'>
                                    <i class='fa fa-exclamation-triangle' style='color: orange'></i> there are no requests at this time
                                </p>
                                <table>
                                    <tbody>
                                        <tr id="drink_requests_list">
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    <div style="background-color: #d4f3ff;" id="DrinkOffersIframe">
                        <div class="DrinkOffersDiv">
                            <div id="selected_drink_offer_user_info">
                            
                            </div>
                            
                            <div class="OffererAdditionalMessage">
                                <div id="current_selected_drink_offer">
                                    
                                </div>
                                
                                <p id="drink_offer_status_P" class="status_text"></p>
                                
                                <div class="ViewOffererFullProfileAndMakeOfferBtns">
                                    <div id="declineOfferBtn">
                                        Decline Offer
                                        <i class="fa fa-times" style="color: white; margin-left: 10px;"></i>
                                   </div>
                                    <div id="acceptOfferBtn">
                                         Accept Offer
                                        <i class="fa fa-handshake-o" aria-hidden="true" style="color: white; margin-left: 10px;"></i>
                                    </div>
                                </div>
                                
                            </div>
                            
                            <p id='available_offers_p' style="text-align: center; font-size: 14px; font-weight: bolder; color: darkblue; margin-top: 5px;">Available Offers</p>
                            <div class="DrinkOfferersListDiv">
                                <p id='no_available_drink_offers_msg' style='margin-top: 20px; margin-bottom: 80px; text-align: center;'>
                                    <i class='fa fa-exclamation-triangle' style='color: orange'></i> you don't have any offer at this time
                                </p>
                                <table>
                                    <tbody>
                                        <tr id="drink_offers_list">
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div id="ExploreRestaurantsDiv">
                        <div id="search_page_start_page">
                            <p style="padding: 20px; color: darkblue; font-weight: bolder;">What is your search for?</p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td id="search_page_restaurant_option">
                                            <p>Restaurants</p>
                                            <div style="padding: 5px;">
                                                <img src="icons/icons8-restaurant-80.png" style="width: 40px; height: auto;" alt=""/>
                                            </div>
                                        </td>
                                        <td id="search_page_parks_option">
                                            <p>Parks</p>
                                            <div style="padding: 5px;">
                                                <img src="icons/icons8-seesaw-80.png" style="width: 50px; height: auto;" alt=""/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="search_page_movies_option">
                                            <p>Movies</p>
                                            <div style="padding: 5px;">
                                                <img src="icons/icons8-cinema-80.png" style="width: 40px; height: auto;" alt=""/>
                                            </div>
                                        </td>
                                        <td id="search_page_museums_option">
                                            <p>Museums</p>
                                            <div style="padding: 5px;">
                                                <img src="icons/icons8-museum-80.png" style="width: 40px; height: auto;" alt=""/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="search_page_cafe_option">
                                            <p>Cafe</p>
                                            <div style="padding: 5px;">
                                                <img src="icons/icons8-cafe-80.png" style="width: 50px; height: auto;" alt=""/>
                                            </div>
                                        </td>
                                        <td id="search_page_bar_option">
                                            <p>Bar</p>
                                            <div style="padding: 5px;">
                                                <img src="icons/icons8-wine-glass-80.png" style="width: 50px; height: auto;" alt=""/>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div id="SearchResultDiv">
                            <p id="back_to_search_home_icons_btn"
                                style="font-weight: bolder; margin: 5px; padding: 5px; border-radius: 4px; background-color: dodgerblue; width: 150px; text-align: center;">
                                <i style="color: white; font-weight: bolder; margin-right: 10px;" class="fa fa-long-arrow-left" aria-hidden="true"></i>
                                Categories
                            </p>
                            <p style="color: darkblue; margin: 15px; font-weight: bolder;">Search results</p>
                            <p id="search_page_location_P" style="font-size: 15px; font-weight: bolder; margin-bottom: 5px; color: darkgray;"></p>
                            <div id="map_div">
                                
                            </div>
                            <div id="search_results_list">
                                <!--div class="each_search_result_item">
                                    <div style="display: flex;">
                                        <div style="width: 100px; height: 100px; background-color: #4d4d4d;">
                                            <img src="" style="width: 100px; height: auto;">
                                        </div>
                                        <div style="max-width: 200px; margin-left: 10px;">
                                            <p style="color: darkblue; font-weight: bolder; margin-bottom: 5px;">Place Name Here</p>
                                            <p><img src="https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png" style="width: 20px; height: auto;"> <span style="color: #37a0f5; font-size: 20px;">&#9733;&#9733;&#9733;&#9733;&#9734;</span></p>
                                            <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> 4961 Broadway, New York<p>
                                        </div>
                                    </div>
                                    <div style="margin-top: 5px;">
                                        <p style="color: darkgrey;">types: </p>
                                        <p>cafe, restaurant, food, point of interest, establishment</p>
                                    </div>
                                    <div style="margin: 10px; padding: 10px 5px; text-align: center; border-radius: 4px; background-color: darkslateblue; color: white;">Make Drink Request</div>
                                </div-->
                            </div>
                        </div>
                        
                    </div>
                    <div id="viewFullProfileDiv">
                        <p style="text-align: right; padding: 0 5px;">
                            <span onclick="$( '#viewFullProfileDiv' ).toggle( 'up' );" 
                                style="color: white; padding: 2px 10px; background-color: red; border-radius: 5px; ">
                                x
                            </span>
                        </p>
                        <div style="display: flex; padding: 5px; padding-bottom: 20px;">
                            <div>
                                <div style="border-radius: 100%; background-color: darkgray; width: 100px; height: 100px; overflow: hidden; border: 3px solid #D9DADC;">
                                    
                                </div>
                            </div>
                            <div style="display: flex; flex-direction: column; justify-content: flex-end; margin-left: 15px;">
                                <p style="font-weight: bolder;">Ana Rodiriquez</p>
                                <p style="font-size: 14px;">25 years, Female</p>
                                <p style="font-size: 14px;">1332 davidson ave, Bronx, NY</p>
                                <p style="font-size: 14px;">somebody@emailserver.com</p>
                                <p style="font-size: 14px;">(1) 737 282 7721</p>
                            </div>
                        </div>
                        <div style="border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                            <div style='display: flex; justify-content: center;'>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; margin-right: 5px; border-radius: 5px;'>
                                    
                                </div>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; border-radius: 5px;'>
                                    
                                </div>
                            </div>
                            <div style='display: flex; justify-content: center; margin-top: 5px;'>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; margin-right: 5px; border-radius: 5px;'>
                                    
                                </div>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; border-radius: 5px;'>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="settingsDiv">
                        <p style="font-size: 20px; font-weight: bolder; margin: 10px; width: fit-content; float: right;">
                            <img id="profilePic" src="Pictures/ProfilePicPlaceHolder.jpg" alt=""/>
                        </p> 
                        <div style="width: fit-content; margin: 10px;">
                            <p style="font-size: 11px; color: red;">8 people viewed you.</p>
                            <p style="font-size: 11px; color: red;">15 people viewed your drink requests.</p>
                            <p style="font-size: 14px; color: blue;">Profile Score: 40%</p>
                        </div>
                        <table>
                            <tbody>
                                <tr>
                                    <td style="background-color: #D9DADC;">
                                        <div style="font-size: 14px;">Full Name: <br/>
                                            <span><input type="text" value="Mohammed Adinan"/></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #ffffff;">
                                        <div style="font-size: 14px;">Age: <br/>
                                            <span><input type="text" value="26"/></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #D9DADC;">
                                        <div style="font-size: 14px;">Sex: <br/>
                                            <span>
                                                <select style="max-width: 200px;"> 
                                                    <option>Male</option> 
                                                    <option>Female</option>
                                                    <option>Prefer not to say</option>
                                                </select>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #ffffff;">
                                        <p class='status_1'>your email is not verified</p>
                                        <div style="font-size: 14px;">Email: <br/>
                                            <span><input type="text" value="m.adinan@yahoo.com"/></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #D9DADC;">
                                        <div style="font-size: 14px;">Phone: <br/>
                                            <span><input type="text" value="8482481118"/></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #ffffff;">
                                        <div style="font-size: 14px;">Search Radius: <br/>
                                            <span><sub>0</sub><input style="background: none; width: 80%; height: 0; border: 1px solid black; margin-bottom: 15px;" type="range" id="points" name="points" min="0" max="100"><sub>100%</sub></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #D9DADC;">
                                        <div style="font-size: 14px;">Interests: <br/>
                                            <span>
                                                <select style="max-width: 200px;"> 
                                                    <option>Male</option> 
                                                    <option>Female</option>
                                                    <option>Both</option>
                                                </select>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="logout_btn" style="width: fit-content; background-color: #ff9c9c; padding: 10px; padding-bottom: 5px; margin: 10px; border-radius: 4px;">
                            <img src="icons/icons8-sign-out-50.png" style="width: 25px; height: 25px;" alt=""/>
                            <sup style="font-size: 14px;">Signout</sup>
                        </div>
                    </div>
                    
                </div>
                <div></div>
                <div class='Footer'><p style='color: white; font-weight: bolder; margin-right: 10px; font-size: 15px;'>BuyHerDrink 2020</p></div>
            </div>
        </div>
        <script src="Scripts/client_side_proccesses.js" type="text/javascript"></script>
        <script src="Scripts/places_search.js" type="text/javascript"></script>
        <script src="Scripts/logout_script.js" type="text/javascript"></script>
        <script src="Scripts/MainScript.js" type="text/javascript"></script>
        <script src="Scripts/search_feature_scripts.js" type="text/javascript"></script>
    </body>
</html>
