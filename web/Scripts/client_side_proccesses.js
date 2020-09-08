//Getting handles to DOM elements

//function for displaying chosen restaurant details to confirmation pane
var RP_rest_name = document.getElementById("RP_rest_name");
var RP_rest_photo = document.getElementById("RP_rest_photo");
var RP_rest_icon = document.getElementById("RP_rest_icon");
var RP_rest_rating = document.getElementById("RP_rest_rating");
var RP_rest_location = document.getElementById("RP_rest_location");
var RP_rest_types = document.getElementById("RP_rest_types");
var drink_requests_list = document.getElementById("drink_requests_list");
var drink_offers_list = document.getElementById("drink_offers_list");
var current_selected_drink_request = document.getElementById("current_selected_drink_request");
var current_selected_drink_offer = document.getElementById("current_selected_drink_offer");
var selected_drink_request_user_info = document.getElementById("selected_drink_request_user_info");
var selected_drink_offer_user_info = document.getElementById("selected_drink_offer_user_info");
var DrinkOnlyPurpose = document.getElementById("DrinkOnlyPurpose");
var DinnerOnlyPurpose = document.getElementById("DinnerOnlyPurpose");
var DrinkAndDinnerPurpose = document.getElementById("DrinkAndDinnerPurpose");
var RP_purpose_display = document.getElementById("RP_purpose_display");

//In memory Object to hold processes data
var publish_request_data = {
                    "request_id": "created on server",
                    "request_purpose": "Drink",
                    "rest_location": "1913 Bronxdale Ave, The Bronx",
                    "rest_name": "F&J Pine",
                    "rest_rating": 5,
                    "rest_photo": "url from google",
                    "rest_category_icon": "from google places",
                    "rest_service_types": "from google places",
                    "meeting_date": "09/04/2020",
                    "meeting_time": "14:00",
                    "meeting_budget": "$5.00",
                    "added_message": "This is a place holder text for message to be added on for the drink request",
                    "requestee_id": "value from client"
                };

//Gobal variables for various utility functions
var currentDate = new Date();

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//DOM manipulation functions

//this function displays selected restaurants for drink request to review and post pane
function pick_restaurant(name, photoUrl, iconUrl, rating, locationAddress, typesList){
    RP_rest_name.innerText = name;
    RP_rest_photo.src = photoUrl;
    RP_rest_icon.src = iconUrl;
    RP_rest_rating.innerText = rating;
    RP_rest_location.innerText = locationAddress,
    RP_rest_types.innerText = typesList;
    hideRestaurantPopupListByAddress();
    add_selected_rest_post_data(name, rating, photoUrl, iconUrl, typesList, locationAddress);
}

//this function renders drink requests to list that displays them
//it also add a click event listener to each request in the list thats used to diplay the selected user and drink request info
function render_drink_request_to_list(requestee_name, requestee_gender, requestee_age, requestee_address, request_purpose, restaurant, location, date, time, budget, message){
    let td = document.createElement("td");
    
    td.addEventListener("click", ()=>{
        render_each_selected_drink_request(restaurant, request_purpose, location, date, time, budget, message);
        render_each_selected_drink_request_user(requestee_name, requestee_age, requestee_gender, requestee_address);
    });
    
    td.classList.add("RequesteeListCoverPhoto");
    td.innerHTML = `
                    <div class="RequesteesProfileFromList">
                        <img src="Pictures/TestPhotos/1.jpg" alt=""/>
                    </div>
                    <div>
                        <p style="font-size: 15px; font-weight: bolder;">${requestee_name}</p>
                        <p>${requestee_gender},  ${requestee_age} - ${request_purpose} <span class="RequesteeOnlineStatusLedFromList"></span></p>
                    </div>
            `;
    drink_requests_list.appendChild(td);
}

//this function renders drink offers to list that displays them
//it also add a click event listener to each request in the list thats used to diplay the selected user and drink offer info
function render_drink_offers_to_list(requestee_name, requestee_gender, requestee_age, requestee_address, request_purpose, restaurant, location, date, time, budget, message){
    let td = document.createElement("td");
    td.classList.add("OfferesListCoverPhoto");
    
    td.addEventListener("click", ()=>{
        render_each_selected_drink_offer(restaurant, request_purpose, location, date, time, budget, message);
        render_each_selected_drink_offer_user(requestee_name, requestee_age, requestee_gender, requestee_address);
    });
    
    td.innerHTML = `
                    <div class="OfferersProfileFromList">
                        <img src="Pictures/TestPhotos/1.jpg" alt=""/>
                    </div>
                    <div>
                        <p style="font-size: 15px; font-weight: bolder;">${requestee_name}</p>
                        <p>${requestee_gender}, ${requestee_age} - ${request_purpose} <span class="OfferersOnlineStatusLedFromList"></span></p>
                    </div>
            `;
    drink_offers_list.appendChild(td);
}


//this function renders each selected drink request
function render_each_selected_drink_request(restaurant, purpose, location, date, time, budget, message){
    current_selected_drink_request.innerHTML = `
                        <div style="padding: 3px; padding-top: 0;">
                            <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Request Details</p>
                            <p style="font-size: 14px;">
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-restaurant-table-50 (1).png" alt=""/>
                                <span style="color: tomato; font-size: 14px;">${restaurant}</span>
                                - <span style="color: tomato; font-size: 14px;">${purpose}</span><br/>
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-marker-filled-30_1.png" alt="">
                                <a style="color: white;" href="https://maps.google.com/?q=${location}" target="_blank"><span style="color: tomato; font-size: 14px;">${location}</span></a><br/>
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-watch-filled-30.png" alt=""/>
                                <span style="color: tomato; font-size: 14px;">${date}</span> - <span style="color: tomato; font-size: 14px;">${time}</span><br/>
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-cash-50.png" alt=""/>
                                <span style="color: tomato; font-size: 14px;">${budget}</span>
                            </p>
                        </div>
                        <div style="padding: 10px; border-top: 1px solid darkgrey;">
                            <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Added Message</p>
                            <p style="font-size: 14px;">
                                ${message}
                            </p>
                        </div>
                `;
}

//this function renders each selected drink request's user info
function render_each_selected_drink_request_user(name, age, gender, address){
    selected_drink_request_user_info.innerHTML = `
                    <div class="RequesteeCoverPhoto">
                        <span class="RequesteeOnlineStatusLed"></span>
                        <span class="RequesteeOnlineStatusText">Offline</span>
                        <div class='RequesteePicture'>
                            <img src="Pictures/TestPhotos/1.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="RequesteeInfoDiv">
                        <p style="font-weight: bolder;">${name}</p>
                        <p>${age} years, ${gender}</p>
                        <p>${address}</p>
                    </div>
                    <p style="clear: both;"></p>
                    <p class="viewFullProfileBtn" onclick="showFullProfileDiv();"
                       style="margin: auto; color: white; background-color: tomato; padding: 5px; 
                            text-align: center; margin-top: 5px; font-size: 14px; width: 95%; margin-bottom: 5px; border-radius: 4px;">
                        View Full Profile
                    </p>
                `;
}

//this function renders each selected drink offer
function render_each_selected_drink_offer(restaurant, purpose, location, date, time, budget, message){
    current_selected_drink_offer.innerHTML = `
                        <div style="padding: 3px; padding-top: 0;">
                            <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Offer Details</p>
                            <p style="font-size: 14px;">
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-restaurant-table-50 (1).png" alt=""/>
                                <span style="color: tomato; font-size: 14px;">${restaurant}</span>
                                - <span style="color: tomato; font-size: 14px;">${purpose}</span><br/>
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-marker-filled-30_1.png" alt="">
                                <a style="color: white;" href="https://maps.google.com/?q=${location}" target="_blank"><span style="color: tomato; font-size: 14px;">${location}</span></a><br/>
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-watch-filled-30.png" alt=""/>
                                <span style="color: tomato; font-size: 14px;">${date}</span> - <span style="color: tomato; font-size: 14px;">${time}</span><br/>
                                <img style="margin-right: 15px;" class="RegularIcons_2" src="icons/icons8-cash-50.png" alt=""/>
                                <span style="color: tomato; font-size: 14px;">${budget}</span>
                            </p>
                        </div>
                        <div style="padding: 10px; border-top: 1px solid darkgrey;">
                            <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Added Message</p>
                            <p style="font-size: 14px;">
                                ${message}
                            </p>
                        </div>
                `;
}

//this function renders each selected drink offer's user info
function render_each_selected_drink_offer_user(name, age, gender, address){
    selected_drink_offer_user_info.innerHTML = `
                    <div class="OffererCoverPhoto">
                        <span class="OffererOnlineStatusLed"></span>
                        <span class="OffererOnlineStatusText">Offline</span>
                        <div class='OffererPicture'>
                            <img src="Pictures/TestPhotos/1.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="OffererInfoDiv">
                        <p style="font-weight: bolder;">${name}</p>
                        <p>${age} years, ${gender}</p>
                        <p>${address}</p>
                    </div>
                    <p style="clear: both;"></p>
                    <p class="viewFullProfileBtn" onclick="showFullProfileDiv();"
                        style="margin: auto; color: white; background-color: cadetblue; padding: 5px; 
                            text-align: center; margin-top: 5px; font-size: 14px; width: 95%; margin-bottom: 5px; border-radius: 4px;">
                        View Full Profile
                    </p>
                `;
}

$("#PDR_date_fld").datepicker({ minDate: 0 }).datepicker("setDate", currentDate);

setInterval(()=>{
    let picked_date = document.getElementById("PDR_date_fld").value;
    document.getElementById("RP_date_display").innerText = picked_date;
    publish_request_data.meeting_date = picked_date;
},1);

setInterval(()=>{
    let picked_time = document.getElementById("PDR_time_fld").value;
    document.getElementById("RP_time_display").innerText = picked_time;
    publish_request_data.meeting_time = picked_time;
},1);

setInterval(()=>{
    let picked_price = document.getElementById("PDR_price_fld").value;
    document.getElementById("RP_price_display").innerText = picked_price;
    publish_request_data.meeting_budget = picked_price;
},1);

setInterval(()=>{
    if(DrinkOnlyPurpose.checked && DinnerOnlyPurpose.checked && DrinkAndDinnerPurpose.checked){
        RP_purpose_display.innerText = "Drink, Dinner, Other";
        publish_request_data.request_purpose = "Drink, Dinner, Other";
    }else if(DrinkOnlyPurpose.checked && DinnerOnlyPurpose.checked){
        RP_purpose_display.innerText = "Drink, Dinner";
        publish_request_data.request_purpose = "Drink, Dinner";
    }else if(DrinkOnlyPurpose.checked && DrinkAndDinnerPurpose.checked){
        RP_purpose_display.innerText = "Drink, Other";
        publish_request_data.request_purpose = "Drink, Other";
    }else if(DinnerOnlyPurpose.checked && DrinkAndDinnerPurpose.checked){
        RP_purpose_display.innerText = "Dinner, Other";
        publish_request_data.request_purpose = "Dinner, Other";
    }
    else if(DrinkOnlyPurpose.checked){
        RP_purpose_display.innerText = "Drink";
        publish_request_data.request_purpose = "Drink";
    }else if(DinnerOnlyPurpose.checked){
        RP_purpose_display.innerText = "Dinner";
        publish_request_data.request_purpose = "Dinner";
    }
    else if(DrinkAndDinnerPurpose.checked){
        RP_purpose_display.innerText = "Other";
        publish_request_data.request_purpose = "Other";
    }
},1);

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Reaching out to endpoints for data

//getting and rendering drink requests
function get_recent_ten_drink_request(city, town, country){
    $.ajax({
        type: "GET",
        url: "./get_recent_ten_drink_request_controller",
        data: "city="+city+"&town="+town+"&country="+country,
        success: function(result){
            console.log(JSON.parse(result));
            let request_list = JSON.parse(result);
            
            //rendering first request as selected by default
            //user details
            render_each_selected_drink_request_user(
                                                        request_list[0].requestee_name, request_list[0].requestee_age,
                                                        request_list[0].requestee_gender, request_list[0].requestee_address
                                                    );
            //request details
            render_each_selected_drink_request(
                                                request_list[0].rest_name, request_list[0].request_purpose,
                                                request_list[0].rest_location, request_list[0].meeting_date,
                                                request_list[0].meeting_time, request_list[0].meeting_budget,
                                                request_list[0].added_message
                                              );
            
            
            request_list.forEach( request => {
                render_drink_request_to_list(
                                                request.requestee_name, request.requestee_gender, request.requestee_age, 
                                                request.requestee_address, request.request_purpose, request.rest_name, request.rest_location,
                                                request.meeting_date, request.meeting_time, request.meeting_budget, request.added_message
                                            );
            });
        }
    });
}

//getting and rendering drink offers
function get_recent_ten_drink_offers(clientId){
    $.ajax({
        type: "GET",
        url: "./get_recent_ten_drink_offers_controller",
        data: "client_id="+clientId,
        success: function(result){
            //console.log(JSON.parse(result));
            let offer_list = JSON.parse(result);
            
            //rendering first offer as selected by default
            //user details
            render_each_selected_drink_offer_user(offer_list[0].requestee_name, offer_list[0].requestee_age, offer_list[0].requestee_gender, offer_list[0].requestee_address);
            //offer details
            render_each_selected_drink_offer(offer_list[0].rest_name, offer_list[0].request_purpose, offer_list[0].rest_location, offer_list[0].meeting_date, offer_list[0].meeting_time, offer_list[0].meeting_budget, offer_list[0].added_message);
            
            offer_list.forEach( request => {
                render_drink_offers_to_list(request.requestee_name, request.requestee_gender, request.requestee_age, request.requestee_address, request.request_purpose, request.rest_name, request.rest_location, request.meeting_date, request.meeting_time, request.meeting_budget, request.added_message);
            });
        }
    });
}

//functions that collect data for various processes
//
//This function sets the selected restaurant's data to data object to be published to the server
function add_selected_rest_post_data(name, rating, photo_url, icon, types, address){
    publish_request_data.rest_name = name;
    publish_request_data.rest_rating = rating;
    publish_request_data.rest_photo = photo_url;
    publish_request_data.rest_category_icon = icon;
    publish_request_data.rest_service_types = types;
    publish_request_data.rest_location = address;
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
//functions that post data from the endpoints

function post_drink_request(data){
    $.ajax({
        type: "POST",
        url: "./post_drink_request_controller",
        data: JSON.stringify(data),
        success: function(result){
            //alert(result);
        }
    });
}

$("#RP_post_request_btn").click(function(event){
    post_drink_request(publish_request_data);
});
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
//functions that initialize application
$(document).ready(()=>{
    get_recent_ten_drink_request("New York", "Bronx", "USA");
    get_recent_ten_drink_offers("jkdhise43hkjJJdjkI4h8dGN09lskw");
});