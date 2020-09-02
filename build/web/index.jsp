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

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.9.1/jquery-ui.min.js" integrity="sha256-UezNdLBLZaG/YoRcr48I68gr8pb5gyTBM+di5P8p6t8=" crossorigin="anonymous"></script>
        
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&libraries=places"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        
    </head>
    <body>
        <div class='Container'>
            <div class='wrapper'>
                <div class='Header'>
                    <div class='MenuIcon' style=''>
                        <a id="nav-toggle" href="#"><span></span></a>
                        <!--div id='firstMenuIconBar' style=''></div>
                        <div id='secondMenuIconBar' style=''></div>
                        <div id='thirdMenuIconBar' style=''></div-->
                    </div>
                    <div class='LogoDiv' ><p style='font-size: 15px; color: red;'>LOGO</p></div>
                    <div class='PageTitle' style=''>Your Profile</div>
                    <p style='clear: both;'></p>
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
                                <tr id="MenuOptionSearch">
                                    <td>
                                        <img src="icons/ExploreIcon.png" alt=""/>
                                    </td>
                                    <td class="SettingName">
                                        Search Restaurants and Bars
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
                            </tbody>
                        </table>
                    </div>
                    <div class="SearchDiv">
                        <input type="text" class="MainSearchFld" />
                        <div class="MainSearchBtn" >
                            <img src="icons/ExploreIcon.png" alt=""/>
                        </div>
                        <p style="clear: both;"></p>
                    </div>
                    <div id='UserProfileIframe'>
                        <div id='notificationsDiv'>
                            <div>
                                <img id="closeNotificationBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                <p style="width: 100%; text-align: center; margin-top: -30px;">Notifications</p>
                            </div>
                        </div>
                        <div id='UserActivityDiv'>
                            <div>
                                <img id="closeUserActivityBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                <p style="width: 100%; text-align: center; margin-top: -30px;">Your Activities</p>
                            </div>
                        </div>
                        <div id='galleryDiv'>
                            <div>
                                <img id="closeGalleryBtn" class="RegularIcons_5" src="icons/icons8-close-window-50.png" alt=""/>
                                <p style="width: 100%; text-align: center; margin-top: -30px;">Your Photos</p>
                            </div>
                        </div>
                        <div class='ProfileDetailsDiv'>
                            <div class="ProfileCover">
                                <img class='ProfilePicture' src="Pictures/ProfilePicPlaceHolder.jpg" alt="">
                                <div class="UserProfileSettingsIcons">
                                    <img id="galleryIcon" src="icons/icons8-photo-gallery-20.png" alt=""/>
                                    <span id='notificationsIcon'><img src="icons/icons8-notification-50.png" alt=""/>
                                        <span class='notificationCounter'>0</span></span>
                                    <img id="editUserProfileIcon" src="icons/icons8-pencil-20.png" alt=""/>
                                </div>
                                <p style="height: 0; clear: both;"></p>
                            </div>
                            <div class='ProfileDetailsInfoDiv'>
                                <p style="font-weight: bolder;">Mohammed Adinan Salifu</p>
                                <p>male, 26 years</p>
                                <p>General New York Area</p>
                            </div>
                            <div class="ActivitiesAndDrinkOffersBtn">
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr>
                                            <td id="YourActivitiesBtn">
                                               Your Activities
                                            </td>
                                            <td id="viewDrinkOffersBtn">
                                               Drink Offers 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class='PublishRequestDiv'>
                            <p style="text-align: center; font-weight: bolder; margin-top: 4px; font-size: 16px;">Publish Drink Request</p>
                            <p style="margin: 10px 5px; font-size: 15px; color: darkgray; text-align: center;">
                                    A drink request lets you reach out for potential date.
                                    Other people will see your drink request and make an offer.
                                    Then its up to you to either accept or decline their offer.
                            </p>
                            <div class="PublishDrinkFieldSet">
                                <div id="map" style="height: 200px;"></div>
                                <fieldset style="border: 1px solid pink; margin: 5px; font-size: 15px;">
                                  <legend style="font-size: 15px; font-weight: bolder;">Add Bar/Restaurant</legend>
                                  <table>
                                      <tbody>
                                        <tr style="background-color: #afe9ff;">
                                            <td>
                                              <img class="RegularIcons_3" src="icons/icons8-marker-filled-30_1.png" alt=""/>
                                            <td>
                                              <div class="RestaurantListPopup" style="width: 100%">
                                                  <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Search restaurants by location:</p>
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
                                                <img class="RegularIcons_3" src="icons/icons8-restaurant-table-50 (1).png" alt=""/>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Search restaurant by name:</p>
                                                <input id="search_rest_by_name_fld" onclick="hideRestaurantPopupListByAddress();" type="text" name="Bar"  placeholder="resturant/bar name" /><br />
                                                <button onclick="showRestaurantsPopupListByAddress()" style="font-size: 14px; bottom: 5px; width: fit-content; border: 0; padding: 5px; background-color: #98d7ff; color: red; border-radius: 4px;">Confirm Restaurant</button>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #afe9ff;" onclick="hideRestaurantPopupListByAddress();">
                                            <td style="padding-right: 10px;"> 
                                                <img class="RegularIcons_3" src="icons/icons8-watch-filled-30.png" alt=""/>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Add date and time:</p>
                                                <input id="PDR_date_fld" style="width: 100px; margin-right: 10px;" type="text" placeholder="add date here" />
                                                -
                                                <select>
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
                                                <img class="RegularIcons_3" src="icons/icons8-cash-50.png" alt=""/>
                                            </td>
                                            <td>
                                                <p style="font-size: 15px; color: darkblue; font-weight: bolder;">Put a price on your date:</p>
                                                <select>
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
                                        <input id="DrinkOnlyPurpose" name="MeetingPurpose" type="checkbox" style="margin-right: 5px;" /><label style="font-size: 14px; margin-right: 10px;" for="DrinkOnlyPurpose">Drink</label> |
                                        <input id="DinnerOnlyPurpose" name="MeetingPurpose" type="checkbox" style="margin-left: 10px; margin-right: 5px;"/><label style="font-size: 14px; margin-right: 10px;" for="DinnerOnlyPurpose">Dinner</label> |
                                        <input id="DrinkAndDinnerPurpose" name="MeetingPurpose" type="checkbox" style="margin-left: 10px; margin-right: 5px;" /><label style="font-size: 14px;" for="DrinkAndDinnerPurpose">Other</label>
                                      </fieldset>

                                      <fieldset style="border: 1px solid pink; margin: 5px; font-size: 15px;" onclick="hideRestaurantPopupListByAddress();">
                                        <legend style="font-size: 15px; font-weight: bolder;">Add Notes</legend>
                                        <center><textarea style="width: 95%; height: 70px;">

                                        </textarea></center>
                                      </fieldset>
                            </div>
                            <div id="PDR_details_pane">
                                <p style="text-align: center; font-weight: bolder; font-size: 16px;">Review and Post</p>
                                <div style="margin: 5px; border: 1px solid pink; padding: 5px;">
                                        <p id='RP_rest_name' style="font-weight: bolder; color: blue;">Restaurant name here</p> 
                                         <div style="background-color: white; padding: 5px; margin-top: 5px; border-radius: 4px;">
                                            <div style="margin: 5px 0;">
                                                <div style="display: flex; justify-content: space-between; margin-bottom: 5px; border-bottom: 1px solid darkgrey; padding-bottom: 5px;">
                                                    <div style="width: 200px; height: 100px; overflow: hidden;">
                                                        <img id='RP_rest_photo' src="" style="width: 200px; height: auto;"/>
                                                    </div>
                                                    <p style="padding: 0 20px; background-color: darkslateblue; color: white; border-radius: 4px; font-weight: bolder; height: 60px; display: flex; flex-direction: column; justify-content: center;">Post</p>
                                                </div>
                                                <p><img id='RP_rest_icon' src="" style="width: 20px; height: auto;"/> <span id='RP_rest_rating' style="color: #37a0f5; font-size: 20px;">&#9733;&#9734;&#9734;&#9734;&#9734;</span></p>
                                                <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> <span id='RP_rest_location'>restaurant location address here</span><p>
                                             </div>
                                             <p style="color: darkgrey;">types: </p>
                                             <p id='RP_rest_types'>Restaurant service types here</p>
                                         </div>
                                         
                                    </div>
                                <!--p class="UserProfilePageSubmitDrinkRequestBtn"></p-->
                            </div>
                        </div>
                    </div>
                    <div id="DrinkRequestsIframe">
                        <div class="DrinkRequestDiv">
                            <div class="RequesteeCoverPhoto">
                                <span class="RequesteeOnlineStatusLed"></span>
                                <span class="RequesteeOnlineStatusText">Offline</span>
                                <img class='RequesteePicture' src="Pictures/TestPhotos/1.jpg" alt=""/>
                            </div>
                            <div class="RequesteeInfoDiv">
                                <p style="font-weight: bolder;">Filomina Gomez</p>
                                <p>25 years, female</p>
                                <p>General New York Area</p>
                            </div>
                            <p style="clear: both;"></p>
                            <center><p class="viewFullProfileBtn" style="color: white; background-color: tomato; padding: 5px; 
                                       text-align: center; margin-top: 5px; font-size: 14px; width: 95%; margin-bottom: 5px; border-radius: 4px;">
                                    View Full Profile
                                </p></center>
                            
                            <div class="RequesteeAdditionalMessage">
                                <div style="padding: 3px; padding-top: 0;">
                                    <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Request Details</p>
                                    <p style="font-size: 14px;">
                                        <img class="RegularIcons_2" src="icons/icons8-restaurant-table-50 (1).png" alt=""/>
                                        <span style="color: tomato; font-size: 14px;">Suspendenders Bar</span>
                                        - <span style="color: tomato; font-size: 14px;">Drink</span><br/>
                                        <img style="" class="RegularIcons_2" src="icons/icons8-watch-filled-30.png" alt=""/>
                                        <span style="color: tomato; font-size: 14px;">9:15pm</span>
                                        <img style="margin-left: 20px;" class="RegularIcons_2" src="icons/icons8-cash-50.png" alt=""/>
                                        <span style="color: tomato; font-size: 14px;">$5.00</span>
                                    </p>
                                </div>
                                <p style="font-size: 14px;">
                                    This is a placeholder text for user added message to drink or dinner requests. It lets user add more clarity to the request being made
                                </p>
                                <table class="ViewRequesteeFullProfileAndMakeOfferBtns">
                                    <tbody>
                                        <tr>
                                            <td style="background-color: aquamarine;">
                                                Customize Your Offer
                                            </td>
                                            <td style="background-color: pink;">
                                                Make Drink Offer
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                
                            </div>
                            
                                <p style="text-align: center; font-size: 14px; font-weight: bolder; color: darkblue; margin-top: 5px;">Available Requests</p>
                                <div class="DrinkRequesteesListDiv">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td id="RequesteeListCoverPhoto">
                                                <img class="RequesteesProfileFromList" src="Pictures/TestPhotos/1.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Filomina Gomez</p>
                                                    <p>female, 25 - Drink <span class="RequesteeOnlineStatusLedFromList"></span></p>
                                                </div>
                                            </td>
                                            <td id="RequesteeListCoverPhoto2">
                                                <img class="RequesteesProfileFromList" src="Pictures/TestPhotos/2.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Anna Rodriqez</p>
                                                    <p>female, 22 - Dinner <span class="RequesteeOnlineStatusLedFromList" style="background-color: green;"></span></p>
                                                    
                                                </div>
                                            </td>
                                            <td id="RequesteeListCoverPhoto3">
                                                <img class="RequesteesProfileFromList" src="Pictures/TestPhotos/3.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Nicole Mohammed</p>
                                                    <p>female, 20 - Dinner <span class="RequesteeOnlineStatusLedFromList"></span></p>
                                                </div>
                                            </td>
                                            <td id="RequesteeListCoverPhoto4">
                                                <img class="RequesteesProfileFromList" src="Pictures/TestPhotos/4.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Sasha Atkingston</p>
                                                    <p>female, 24 - Drink <span class="RequesteeOnlineStatusLedFromList"></span></p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    <div id="DrinkOffersIframe">
                        <div class="DrinkOffersDiv">
                            <div class="OffererCoverPhoto">
                                <span class="OffererOnlineStatusLed"></span>
                                <span class="OffererOnlineStatusText">Offline</span>
                                <img class='OffererPicture' src="Pictures/TestPhotos/1.jpg" alt=""/>
                            </div>
                            <div class="OffererInfoDiv">
                                <p style="font-weight: bolder;">Filomina Gomez</p>
                                <p>25 years, female</p>
                                <p>General New York Area</p>
                            </div>
                            <p style="clear: both;"></p>
                            <center><p class="viewFullProfileBtn" style="color: white; background-color: cadetblue; padding: 5px; 
                                       text-align: center; margin-top: 5px; font-size: 14px; width: 95%; margin-bottom: 5px; border-radius: 4px;">
                                    View Full Profile
                                </p></center>
                            
                            <div class="OffererAdditionalMessage">
                                <div style="padding: 3px; padding-top: 0;">
                                    <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Offer Details</p>
                                    <p style="font-size: 14px;">
                                        <img class="RegularIcons_2" src="icons/icons8-restaurant-table-50 (1).png" alt=""/>
                                        <span style="color: tomato; font-size: 14px;">Suspendenders Bar</span>
                                        - <span style="color: tomato; font-size: 14px;">Drink</span><br/>
                                        <img style="" class="RegularIcons_2" src="icons/icons8-watch-filled-30.png" alt=""/>
                                        <span style="color: tomato; font-size: 14px;">9:15pm</span>
                                        <img style="margin-left: 20px;" class="RegularIcons_2" src="icons/icons8-cash-50.png" alt=""/>
                                        <span style="color: tomato; font-size: 14px;">$5.00</span>
                                    </p>
                                </div>
                                <p style="font-size: 14px;">
                                    This is a placeholder text for user added message to drink or dinner requests. It lets user add more clarity to the request being made
                                </p>
                                <table class="ViewOffererFullProfileAndMakeOfferBtns">
                                    <tbody>
                                        <tr>
                                            <td id="acceptOfferBtn">
                                                Decline Offer
                                            </td>
                                            <td id="declineOfferBtn">
                                                Accept Offer
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                
                            </div>
                            
                                <p style="text-align: center; font-size: 14px; font-weight: bolder; color: darkblue; margin-top: 5px;">Offers Made</p>
                                <div class="DrinkOfferersListDiv">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td id="OfferesListCoverPhoto">
                                                <img class="OfferersProfileFromList" src="Pictures/TestPhotos/1.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Filomina Gomez</p>
                                                    <p>female, 25 - Drink <span class="OfferersOnlineStatusLedFromList"></span></p>
                                                </div>
                                            </td>
                                            <td id="OfferesListCoverPhoto2">
                                                <img class="OfferersProfileFromList" src="Pictures/TestPhotos/2.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Anna Rodriqez</p>
                                                    <p>female, 22 - Dinner <span class="OfferersOnlineStatusLedFromList" style="background-color: green;"></span></p>
                                                    
                                                </div>
                                            </td>
                                            <td id="OfferesListCoverPhoto3">
                                                <img class="OfferersProfileFromList" src="Pictures/TestPhotos/3.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Nicole Mohammed</p>
                                                    <p>female, 20 - Dinner <span class="OfferersOnlineStatusLedFromList"></span></p>
                                                </div>
                                            </td>
                                            <td id="OfferesListCoverPhoto4">
                                                <img class="OfferersProfileFromList" src="Pictures/TestPhotos/4.jpg" alt=""/>
                                                <div>
                                                    <p style="font-size: 15px; font-weight: bolder;">Sasha Atkingston</p>
                                                    <p>female, 24 - Drink <span class="OfferersOnlineStatusLedFromList"></span></p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div id="ExploreRestaurantsDiv">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                    <div id="viewFullProfileDiv">
                        <p style="text-align: right; padding: 0 5px;">
                            <span onclick="document.getElementById('viewFullProfileDiv').style.display = 'none';" 
                                style="color: white; padding: 2px 10px; background-color: red; border-radius: 5px; ">
                                x
                            </span>
                        </p>
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
                        <div style="width: fit-content; background-color: #ff9c9c; padding: 10px; padding-bottom: 5px; margin: 10px; border-radius: 4px;">
                            <img src="icons/icons8-sign-out-50.png" style="width: 25px; height: 25px;" alt=""/>
                            <sup style="font-size: 14px;">Signout</sup>
                        </div>
                    </div>
                    
                </div>
                <div></div>
                <div class='Footer'><p style='color: white; margin-right: 10px; font-size: 15px;'>BuyHerDrink 2020</p></div>
            </div>
        </div>
        <script src="Scripts/client_side_proccesses.js" type="text/javascript"></script>
        <script src="Scripts/places_search.js" type="text/javascript"></script>
        <script src="Scripts/MainScript.js" type="text/javascript"></script>
    </body>
</html>
