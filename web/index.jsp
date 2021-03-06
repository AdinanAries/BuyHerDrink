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
        console.log(userToken);
        
        //function definition for displaying currently logged in user information
        function display_user_profile_info(username, gender, age, address){
            if(username.length > 22){
                username = (username.substring(0,20) + "...");
            }if(address.length > 22){
                address = (address.substring(0,21) + "...");
            }
            document.getElementById("user_info_name_display").innerText = username;
            document.getElementById("user_info_gender_display").innerText = gender;
            document.getElementById("user_info_age_display").innerText = age;
            document.getElementById("user_info_address_display").innerText = address;
        };
        
        function display_user_current_settings(full_name, age, gender, email, phone, address, interests){
            document.getElementById("setting_page_full_name_fld").value = full_name;
            document.getElementById("setting_page_age_fld").value = age;
            document.getElementById("setting_page_gender_fld").value = gender;
            document.getElementById("setting_page_email_fld").value = email;
            document.getElementById("setting_page_phone_fld").value = phone;
            document.getElementById("setting_page_interest_fld").value = interests;
            document.getElementById("setting_page_address_fld").value = address;
        }
        
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
        $(document).ready(()=> {
            if(userToken === null){
                window.location.href = "./login_and_signup.jsp";
            }else{
                document.getElementById("loadingPage").style.display = "none";
                //checkUserLoginStatus();
                console.log(userToken.token_id);
                $(document).ready(()=>{
                    $.ajax({
                        beforeSend: xhrObj => {
                            xhrObj.setRequestHeader("Authorization", ("Bearer " + userToken.token_id));
                            xhrObj.setRequestHeader("Accept", "application/json");
                        },
                        type: "GET",
                        url: "http://www.bmurphyapi.com/getusers",
                        data: "user_id="+userToken.user_id,
                        success: res =>{
                            window.localStorage.setItem("BHDUserData", JSON.stringify(res));
                            display_user_current_settings(res.name, res.age, res.sex_orientation, res.email, res.phone, res.address, res.interests);
                            //console.log(res);
                        },
                        error: err =>{
                            console.log(err);
                        }
                    });
                    
                    display_user_profile_info(userToken.user_name, userToken.gender, userToken.age, userToken.area);
                    
                });
            }
        });
        
        
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
        <div onclick="vewFullScreenPhotoViewer('hiding photo viewer')" id="fullScreenPhotoViewerContainer">
            <div id="fullScreenPhotoViewer">
                <div id="fullScreenPhotoViewerLoader">
                    <p style="text-align: center; color: white; font-size: 17px; font-weight: bolder; margin-bottom: 10px;">
                        <i style="color: #98b3ff; font-size: 30px; margin-right: 10px;" class="fa fa-spinner" aria-hidden="true" ></i>
                    <p>
                    <p style='margin-top: 20px; color: white; font-weight: bolder; text-align: center;'>&copy; 2020, BuyMeDrink</p>
                </div>
                <img id="fullScreenPhotoViewerImg" src="Pictures/TestPhotos/1.jpg" alt="" />
            </div>
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
                                        <sup id="menu_drink_offers_counter" style="font-size: 14px; color: #4CAF50; margin-left: 5px; font-weight: bolder;"></sup>
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
                                        Your Dates <sup id="menu_dinner_dates_counter" style="font-size: 14px; color: #4CAF50; margin-left: 5px; font-weight: bolder;"></sup>
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
                            <div class="popup_window_content">
                                <div>
                                    <img id="closeNotificationBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                    <p style="width: 100%; text-align: center; margin-top: -30px; color: darkblue; font-weight: bolder;">Notifications</p>
                                </div>
                            </div>
                        </div>
                        <div id='YourDrinkRequestsDiv'>
                            <div class="popup_window_content">
                                <div id="your_drink_requests_header">
                                    <div class="popup_window_headers">
                                        <div>
                                            <img id="closeYourDrinkRequestsDivBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                            <p style="text-align: center; color: black; font-weight: bolder; margin-top: -30px;">Your Drink Requests</p>
                                        </div>
                                        <p style="font-weight: bolder; text-align: center; font-size: 14px; color: #37a0f5;">&COPY; 2020, BuyMeDrink</p>
                                    </div>
                                </div>
                                <div style='height: 70px;'></div>
                                <div id='YourDrinkRequestsListDiv'>
                                    
                                </div>
                            </div>
                        </div>
                        <div id='UserActivityDiv'>
                            <div class="popup_window_content">
                                <div id="dinner_dates_header">
                                    <div class="popup_window_headers">
                                        <img id="closeUserActivityBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                        <p style="font-weight: bolder; width: 100%; text-align: center; margin-top: -30px; margin-bottom: 5px;">Your Dates 
                                            <sup id="dinner_dates_counter_of_dates" style="color: #4CAF50; margin-left: 5px; font-weight: bolder;"></sup>
                                        </p>
                                        <p style="font-weight: bolder; text-align: center; font-size: 14px; color: darkgray">&COPY; 2020, BuyMeDrink</p>
                                    </div>
                                    
                                </div>
                                <div class="popup_window_top_padding"></div>
                                <div id="dates_list_container">

                                </div>
                            </div>
                        </div>
                        <div id='galleryDiv'>
                            <div class="popup_window_content" style='display: flex; flex-direction: column; justify-content: center;'>
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
                                <div id="dashboardProfilePic" class='ProfilePicture'>
                                    <!--img src="Pictures/ProfilePicPlaceHolder.jpg" alt=""-->
                                    <i class='fa fa-user' aria-hidden='true'></i>
                                </div>
                                <div class="UserProfileSettingsIcons">
                                    <div id="UserProfileIconsNoticationSpan">Notifications</div>
                                    <div class="UserProfileSettingsIconsItem" style="margin-right: 5px;" id='notificationsIcon'>
                                        <div>
                                            <p style="margin-bottom: -29px;">
                                                <i style="font-size: 20px;" class="fa fa-bell" aria-hidden="true"></i>
                                            </p>
                                            <p class='notificationCounter' id="profilePageNotificationCounter">0</p>
                                        </div>
                                    </div>
                                    <p class="UserProfileSettingsIconsItem  dropdown_hidden" id="editUserProfileIcon">
                                        <i style="font-size: 20px;" class="fa fa-pencil" aria-hidden="true"></i>
                                    </p>
                                    <p class="UserProfileSettingsIconsItem  dropdown_hidden" style="margin-left: 5px;" id="galleryIcon">
                                        <i style="font-size: 20px;" class="fa fa-picture-o" aria-hidden="true"></i>
                                    </p>
                                    <p id="showMoreMenuOnUserProfilePageSettingsIcons" class="UserProfileSettingsIconsItem" style="margin-left: 5px;" id="galleryIcon">
                                        <i id="profilePageSettingsMenuDropDownbtnIcon" style="font-size: 30px; padding: 0 5px; color: steelblue;" class="fa fa-angle-down" aria-hidden="true"></i>
                                    </p>
                                    <div id="UserProfilePageSettingsDropDown" class="UserProfileSettingsIconsDropDown">
                                        <p onclick="(()=>{
                                                        showSettingsWithoutMenuToggle();
                                                        showDropDownMenuAtUserProfileSetting();
                                                        document.getElementById('settingsDivUploadProfile').style.display = 'none';
                                                        document.getElementById('settingsDivMainSettings').style.display = 'block';
                                                    })()" 
                                                style="margin-top: 10px;">
                                            <i style="margin-right: 5px; font-size: 20px;" class="fa fa-pencil" aria-hidden="true"></i>
                                            Edit Profile
                                        </p>
                                        <p onclick="(()=>{
                                                        showGalleryDiv();
                                                        showDropDownMenuAtUserProfileSetting();
                                                    })()"
                                        >
                                            <i style="margin-right: 5px; font-size: 20px;" class="fa fa-picture-o" aria-hidden="true"></i>
                                            Gallery
                                        </p>
                                        <p>
                                            <i style="margin-right: 5px; font-size: 20px;" class="fa fa-file-image-o" aria-hidden="true"></i>
                                            Change Cover
                                        </p>
                                        <p onclick="(()=>{
                                                        showUploadProfilePhotoPage();
                                                        showDropDownMenuAtUserProfileSetting();
                                                    })()"
                                        >
                                            <i style="margin-right: 5px; font-size: 20px;" class="fa fa-user-circle" aria-hidden="true"></i>
                                            Change Photo
                                        </p>
                                    </div>
                                </div>
                                <p style="height: 0; clear: both;"></p>
                            </div>
                            <div class='ProfileDetailsInfoDiv'>
                                <p id='user_info_name_display' style="font-weight: bolder; color: #4d4d4ds;"></p>
                                <p style="opacity: 0.7;"><span style='font-size: 16px;' id='user_info_gender_display'></span>, <span style='font-size: 16px;' id='user_info_age_display'></span> years</p>
                                <p style='opacity: 0.7' id='user_info_address_display'></p>
                            </div>
                            <div class="ActivitiesAndDrinkOffersBtn">
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr>
                                            <td id="YourActivitiesBtn">
                                                <p style="font-size: 14px; font-weight: bolder;">
                                                    <i style="margin-right: 5px; color: goldenrod;" class="fa fa-list" aria-hidden="true"></i>
                                                    Your Dates <sup id="user_profile_page_dates_counter" style="font-size: 14px; color: #4CAF50; margin-left: 5px; font-weight: bolder;"></sup>
                                                </p>
                                            </td>
                                            <td id="viewDrinkOffersBtn">
                                                <p style="font-size: 14px; font-weight: bolder;">
                                                    <i style="margin-right: 5px; color: goldenrod;" class="fa fa-glass" aria-hidden="true"></i>
                                                    Drink Offers <sup id="user_profile_page_offers_counter" style="font-size: 14px; color: seagreen; margin-left: 5px; font-weight: bolder;"></sup>
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div style="background-color: #e8e8e8; padding: 10px 0;">
                            <p style="font-size: 14px; color: darkblue; font-weight: bolder; text-align: center;">
                                Choose type of date?</p>
                            <div style="display: flex; flex-direction: row !important; padding: 10px; justify-content: space-between;" 
                                 id="home_or_restaurant_date_btns">
                                <div style="width: 49%; display: flex; flex-direction: row !important; justify-content: center;">
                                    <div>
                                        <input id="restaurant_type_date_btn" style="margin-right: 5px; width: 12px; height: 12px;" type="radio" name="date_type" checked />
                                        <label for="restaurant_type_date_btn">
                                            <span style="font-size: 14px; color: steelblue;">Restaurant/Bar Date</span>
                                        </label>
                                    </div>
                                </div>
                                <div style="width: 49%; display: flex; flex-direction: row !important; justify-content: center;">
                                    <div><input id="home_type_date_btn" style="margin-right: 5px; width: 12px; height: 12px;" type="radio" name="date_type" />
                                        <label for="home_type_date_btn">
                                            <span style="font-size: 14px; color: steelblue;">Home Date 
                                                <span style="font-size: 10px; padding: 2px 5px; background: red; color: white; border-radius: 3px;">
                                                new</span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="restaurant_date_container" class='PublishRequestDiv'>
                            <p style="text-align: center; font-weight: bolder; margin-top: 15px; font-size: 16px;">Publish Drink Request Below</p>
                            <p style="margin: 10px 5px; margin-bottom: 15px; font-size: 15px; color: darkgray; text-align: center;">
                                    A drink request lets you reach out for potential date.
                                    Other people will see your drink request and make an offer.
                                    Then its up to you to either accept or decline their offer.
                            </p>
                            <div class="PublishDrinkFieldSet">
                                <div id="map" style="height: 200px; margin-bottom: 15px;"></div>
                                <fieldset id="publish_drink_request_fields" style="padding-top: 10px; border: 1px solid pink; margin: 5px; font-size: 15px;">
                                  <legend style="font-size: 15px; font-weight: bolder;">Add Bar/Restaurant</legend>
                                  <table>
                                      <tbody>
                                        <tr>
                                            <td>
                                                <i style="font-size: 22px; margin-left: 15px;" class="fa fa-ellipsis-v" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <div>
                                                    <p style="font-size: 15px; color: darkblue; font-weight: bolder; margin-top: 5px;">Choose a type of place</p>
                                                    <select style="padding: 10px 0;" id="add_place_search_types">
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
                                                  <p style="font-size: 15px; color: darkblue; font-weight: bolder; margin-top: 5px;">Search places by location:</p>
                                                <input id="rest_locations_input_fld" onclick="hideRestaurantPopupListByAddress();" style="padding: 10px 0 !important;" type="text"  placeholder="resturant/bar location" name="BarAddress" /><br />
                                                <div class="RestaurantListDiv" id="RestaurantList" style="width: 100%;">
                                                    <p style="text-align: right; padding-right: 10px;"><span onclick="hideRestaurantPopupListByAddress();" style="color: white; background-color: red; padding: 0 10px; border-radius: 4px;">x</span></p>
                                                    <p style="color: seagreen; font-size: 14px; margin: 0 5px; padding: 5px 0; padding-bottom: 10px; border-bottom: cadetblue 1px solid;"><i class="fa fa-map-marker" style="color: black; font-size: 20px;" aria-hidden="true"></i> <span id="rests_list_location_display">2034 murthal ave. Brookly, NY 1203</span></p>
                                                    <div id="rest_list_scroll_div" style="height: 300px; overflow-y: auto; background-color: #98d7ff; margin: 0 5px;">
                                                        <ul id="current_restaurants_list" style="text-align: left; margin: 5px 0;">

                                                        </ul>
                                                    </div>
                                                </div>
                                                <button id="search_restaurants_btn" onclick="showRestaurantsPopupListByAddress()" style="font-size: 14px; bottom: 5px; width: fit-content; border: 0; padding: 10px; background-color: steelblue; font-weight: bolder; color: white; border-radius: 4px;">Browse Restaurants</button>
                                              </div>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <!--img class="RegularIcons_3" src="icons/icons8-restaurant-table-50 (1).png" alt=""/-->
                                                <i style="font-size: 22px; margin: 0 10px;" class="fa fa-map-marker" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder; margin-top: 5px;">Search place by name:</p>
                                                <input id="search_rest_by_name_fld" onclick="hideRestaurantPopupListByAddress();" style="padding: 10px 0 !important;" type="text" name="Bar"  placeholder="resturant/bar name" /><br />
                                                <button id="ABR_confirm_restaurant_btn" onclick="showRestaurantsPopupListByAddress()" style="font-size: 14px; bottom: 5px; width: fit-content; border: 0; padding: 10px; background-color: steelblue; font-weight: bolder; color: white; border-radius: 4px;">Confirm Restaurant</button>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #afe9ff;" onclick="hideRestaurantPopupListByAddress();">
                                            <td style="padding-right: 10px;"> 
                                                <!--img class="RegularIcons_3" src="icons/icons8-watch-filled-30.png" alt=""/-->
                                                <i style="font-size: 22px; margin: 0 10px;" class="fa fa-calendar" aria-hidden="true"></i>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder; margin-top: 5px;">Add date and time:</p>
                                                <input id="PDR_date_fld" style="width: 100px; margin-right: 10px; padding: 10px 0 !important;" type="text" placeholder="add date here" />
                                                -
                                                <select id='PDR_time_fld' style="padding: 10px 0 !important;">
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
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder; margin-top: 5px;">Put a price on your date:</p>
                                                <select id='PDR_price_fld' style="padding: 10px 0 !important;">
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

                                      <fieldset style="border: 1px solid pink; margin: 5px; font-size: 15px; padding: 10px;" onclick="hideRestaurantPopupListByAddress();">
                                        <legend style="font-size: 15px; font-weight: bolder;">Purpose</legend>
                                        <input checked="true" id="DrinkOnlyPurpose" name="MeetingPurpose" type="checkbox" style="margin-right: 5px;" /><label style="font-size: 14px; margin-right: 10px;" for="DrinkOnlyPurpose">Drink</label> |
                                        <input id="DinnerOnlyPurpose" name="MeetingPurpose" type="checkbox" style="margin-left: 10px; margin-right: 5px;"/><label style="font-size: 14px; margin-right: 10px;" for="DinnerOnlyPurpose">Dinner</label> |
                                        <input id="DrinkAndDinnerPurpose" name="MeetingPurpose" type="checkbox" style="margin-left: 10px; margin-right: 5px;" /><label style="font-size: 14px;" for="DrinkAndDinnerPurpose">Other</label>
                                      </fieldset>

                                      <fieldset style="border: 1px solid pink; margin: 5px; font-size: 15px; padding: 10px;" onclick="hideRestaurantPopupListByAddress();">
                                        <legend style="font-size: 15px; font-weight: bolder;">Add Notes</legend>
                                        <center><textarea id='PDR_notes_fld' style="width: 95%; height: 70px;">

                                        </textarea></center>
                                      <script>
                                          document.getElementById("PDR_notes_fld").innerText = "";
                                      </script>
                                      </fieldset>
                            </div>
                            <div id="PDR_details_pane">
                                <p style="text-align: center; font-weight: bolder; font-size: 16px; padding: 15px 0;">Review and Post</p>
                                <div style="margin: 5px; border: #37a0f5 1px solid; padding: 5px; background-color: #d4f3ff;">
                                    <div id="cancel_update_drink_request_btn" 
                                         style="display: none; color: white; padding: 10px; margin: 5px 0; border-radius: 5px; background-color: crimson; text-align: center; font-size: 14px;">
                                        Cancel Post
                                    </div>
                                    <p id='RP_rest_name' style="font-weight: bolder; margin-top: 10px; padding: 5px; color: blue;"><i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></p> 
                                         <div style="background-color: white; padding: 5px; margin-top: 5px; border-radius: 4px;">
                                            <div style="margin: 5px 0;">
                                                <div style="display: flex; justify-content: space-between; margin-bottom: 5px; padding-bottom: 5px;">
                                                    <div style="width: 200px; height: 100px; overflow: hidden;">
                                                        <img id='RP_rest_photo' src="" style="width: 200px; height: auto;"/>
                                                    </div>
                                                    <p id="RP_post_request_btn" style="padding: 0 20px; background-color: darkslateblue; color: white; border-radius: 4px; font-weight: bolder; height: 60px; display: flex; flex-direction: column; justify-content: center;">Post</p>
                                                    <p id="RP_update_request_btn" style="display: none; padding: 0 20px; background-color: darkslateblue; color: white; border-radius: 4px; font-weight: bolder; height: 60px; flex-direction: column; justify-content: center;">Update</p>
                                                </div>
                                                <p style="padding: 10px 0;"><img id='RP_rest_icon' src="" style="width: 20px; height: auto;"/> <span id='RP_rest_rating' style="color: #37a0f5; font-size: 20px;">&#9733;&#9734;&#9734;&#9734;&#9734;</span></p>
                                                <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> <span id='RP_rest_location'><i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></span><p>
                                                <p style='color: darkgrey; padding: 10px 0;'>
                                                    <i class="fa fa-calendar" aria-hidden="true"></i> <span id='RP_date_display' style='color: darkblue; margin-right: 15px;'>9/2/2020</span>
                                                    <i style='font-size: 20px;' class="fa fa-clock-o" aria-hidden="true"></i> <span id='RP_time_display' style='color: darkblue;'>12:00am</span>
                                                </p>
                                                <p style='color: darkgrey; padding-bottom: 10px;'>
                                                    <i class="fa fa-glass" aria-hidden="true"></i> <span id='RP_purpose_display' style='color: darkblue; margin-right: 15px;'>Drink</span>
                                                    <i class="fa fa-money" aria-hidden="true"></i> <span id='RP_price_display' style='color: darkblue;'>$5.00</span>
                                                </p>
                                             </div>
                                             <p style="color: darkgrey; margin: 10px 0;">types: </p>
                                             <p id='RP_rest_types' style="margin-bottom: 10px;"><i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></p>
                                         </div>
                                         
                                    </div>
                                <!--p class="UserProfilePageSubmitDrinkRequestBtn"></p-->
                            </div>
                        </div>
                        <div style="display: none;" id="home_date_container">
                            <p style="text-align: center; font-weight: bolder; margin-top: 15px; font-size: 16px;">Publish Home Date Below</p>
                            <p style="margin: 10px 5px; margin-bottom: 15px; font-size: 15px; color: darkgray; text-align: center;">
                                Home Date is a new feature that BuyHerDrink implements to help you arrange a 'come to my place date'.
                                This feature is also important in order to meet the new requirements in society due to Covid19.
                            </p>
                        </div>
                    </div>
                    <div id="DrinkRequestsIframe">
                        
                        <div class="DrinkRequestDiv">
                            <div id="selected_drink_request_user_info">
                                
                            </div>
                            
                            <div class="RequesteeAdditionalMessage">
                                <div style="padding: 15px 0;" id="current_selected_drink_request">
                                    
                                </div>
                                
                                <div id="drink_bidding_form" style="display: none; padding: 5px; padding-top: 10px; margin-top: 10px;">
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
                            
                            <p id='available_requests_p' style="text-align: center; font-size: 14px; font-weight: bolder; color: darkblue; margin-top: 15px; margin-bottom: 10px;">Available Requests</p>
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
                                <div style="padding: 15px 0;" id="current_selected_drink_offer">
                                    
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
                            
                            <p id='available_offers_p' style="text-align: center; font-size: 14px; font-weight: bolder; color: darkblue; margin-top: 15px; margin-bottom: 10px;">Available Offers</p>
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
                                style="font-weight: bolder; margin: 5px; padding: 10px; border-radius: 4px; background-color: dodgerblue; width: 150px; text-align: center;">
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
                                <div style="border-radius: 100%; background-color: darkgray; width: 100px; height: 100px; overflow: hidden; border: 3px solid #98b3ff;">
                                    <img id="SFP_profile" style="width: 100px; min-height: 100px; height: auto;" src="" alt="" />
                                </div>
                            </div>
                            <div style="display: flex; flex-direction: column; justify-content: flex-end; margin-left: 15px;">
                                <p id="SFP_name" style="font-weight: bolder;">Ana Rodiriquez</p>
                                <p id="SFP_age_gender" style="font-size: 14px;">25 years, Female</p>
                                <p id="SFP_address" style="font-size: 14px;">1332 davidson ave, Bronx, NY</p>
                                <p id="SFP_email" style="font-size: 14px;">somebody@emailserver.com</p>
                                <p id="SFP_tel" style="font-size: 14px;">(1) 737 282 7721</p>
                            </div>
                        </div>
                        <div style="border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                            <div style='display: flex; justify-content: center;'>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; margin-right: 5px; border-radius: 5px; display:flex; flex-direction: column; justify-content: center;'>
                                    <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                </div>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; border-radius: 5px; display:flex; flex-direction: column; justify-content: center;'>
                                    <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                </div>
                            </div>
                            <div style='display: flex; justify-content: center; margin-top: 5px;'>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; margin-right: 5px; border-radius: 5px; display:flex; flex-direction: column; justify-content: center;'>
                                    <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                </div>
                                <div style='width: 48%; height: 170px; background-color: #4d4d4d; border-radius: 5px; display:flex; flex-direction: column; justify-content: center;'>
                                    <p style='text-align: center; opacity: 0.2;'><i class="fa fa-picture-o" aria-hidden="true" style='font-size: 100px;'></i></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="settingsDiv">
                        <div  style="display: none;" id="settingsDivUploadProfile">
                            
                            <div id="back_to_main_settings_div">
                                <i style="margin-right: 5px; font-size: 17px; color: white;" class="fa fa-long-arrow-left"></i>
                                Settings
                            </div>
                            
                            <p style="margin: 15px 0; text-align: center; font-weight: bolder; color: darkblue;">Change Profile Photo</p>
                            <div id="uploadPhotoPictureDisplayArea"></div>
                            <div id="settingsDivUploadProfileFormArea">
                                <input id="settingsDivUploadProfileFileInput" type="file" />
                                <div style="margin-bottom: 10px;">
                                    <label for="settingsDivUploadProfileFileInput">
                                        <div id="settingsDivUploadProfileChoosePhotoBtn">
                                            <i class="fa fa-file-image-o" style="color: crimson; margin-right: 5px; font-size: 20px"></i>
                                            Choose Photo
                                        </div>
                                    </label>
                                </div>
                                <div style="display: flex; justify-content: space-between;">
                                    <div class='settingsUploadPhotoBtn' style="background-color: #4CAF50;">Upload</div>
                                    <div class='settingsUploadPhotoBtn' style="background-color: #EF3B3A;">Remove Profile</div>
                                </div>
                            </div>
                        </div>
                        <div id="settingsDivMainSettings">
                            <div style="display: flex; justify-content: space-between; padding: 15px 10px;">
                                <div style="height: 70px; width: 70px; border-radius: 100%; overflow: hidden;">
                                    <img style="width: 70px; height: auto; min-height: 70px;" id="mainSettingsDivProfilePicture" src="Pictures/ProfilePicPlaceHolder.jpg" alt=""/>
                                </div> 
                                <div style="width: fit-content; margin: 10px;">
                                    <p style="font-size: 11px; color: red;">8 people viewed you.</p>
                                    <p style="font-size: 11px; color: red;">15 people viewed your drink requests.</p>
                                    <p style="font-size: 14px; color: blue;">Profile Score: 40%</p>
                                </div>
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="background-color: #D9DADC;">
                                            <div style="font-size: 14px;">Full Name: <br/>
                                                <span><input id='setting_page_full_name_fld' type="text" value=""/></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: #ffffff;">
                                            <div style="font-size: 14px;">Age: <br/>
                                                <span><input id='setting_page_age_fld' type="text" value=""/></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: #D9DADC;">
                                            <div style="font-size: 14px;">Sex: <br/>
                                                <span>
                                                    <select id='setting_page_gender_fld' style="max-width: 200px;"> 
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
                                                <span><input id='setting_page_email_fld' type="text" value=""/></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: #D9DADC;">
                                            <div style="font-size: 14px;">Phone: <br/>
                                                <span><input id='setting_page_phone_fld' type="text" value="8482481118"/></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: #ffffff;">
                                            <div style="font-size: 14px;">Address: <br/>
                                                <span><input id='setting_page_address_fld' type="text" value=""/></span></div>
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
                                                    <select id='setting_page_interest_fld' style="max-width: 200px;"> 
                                                        <option>Men</option> 
                                                        <option>Women</option>
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
                </div>
                <div></div>
                <div class='Footer'><p style='color: white; font-weight: bolder; margin-right: 10px; font-size: 15px;'>BuyHerDrink 2020</p></div>
            </div>
        </div>
        <script>
            function show_home_dates_forms(){
                $("#restaurant_date_container").slideUp("fast");
                $("#home_date_container").slideDown("fast");
            }
            document.getElementById("home_type_date_btn").addEventListener("click", (evnt)=>{
                show_home_dates_forms();
            });
            function show_restaurant_dates_forms(){
                $("#home_date_container").slideUp("fast");
                $("#restaurant_date_container").slideDown("fast");
            }
            document.getElementById("restaurant_type_date_btn").addEventListener("click", (evnt)=>{
                show_restaurant_dates_forms();
            });
        </script>
        <script src="Scripts/client_side_proccesses.js" type="text/javascript"></script>
        <script src="Scripts/places_search.js" type="text/javascript"></script>
        <script src="Scripts/logout_script.js" type="text/javascript"></script>
        <script src="Scripts/MainScript.js" type="text/javascript"></script>
        <script src="Scripts/search_feature_scripts.js" type="text/javascript"></script>
    </body>
</html>
