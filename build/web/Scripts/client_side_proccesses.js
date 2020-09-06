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

function pick_restaurant(name, photoUrl, iconUrl, rating, locationAddress, typesList){
    RP_rest_name.innerText = name;
    RP_rest_photo.src = photoUrl;
    RP_rest_icon.src = iconUrl;
    RP_rest_rating.innerText = rating;
    RP_rest_location.innerText = locationAddress,
    RP_rest_types.innerText = typesList;
    hideRestaurantPopupListByAddress();
}

function render_drink_request_to_list(requestee_name, requestee_gender, requestee_age, requestee_address, request_purpose, restaurant, location, date, time, budget, message){
    let td = document.createElement("td");
    
    td.addEventListener("click", ()=>{
        render_each_selected_drink_request(restaurant, request_purpose, location, date, time, budget, message);
        render_each_selected_drink_request_user(requestee_name, requestee_age, requestee_gender, requestee_address);;
    });
    
    td.classList.add("RequesteeListCoverPhoto");
    td.innerHTML = `
                    <img class="RequesteesProfileFromList" src="Pictures/TestPhotos/1.jpg" alt=""/>
                    <div>
                        <p style="font-size: 15px; font-weight: bolder;">${requestee_name}</p>
                        <p>${requestee_gender},  ${requestee_age} - ${request_purpose} <span class="RequesteeOnlineStatusLedFromList"></span></p>
                    </div>
            `;
    drink_requests_list.appendChild(td);
}

function render_drink_offers_to_list(requestee_name, requestee_gender, requestee_age, requestee_address, request_purpose, restaurant, location, date, time, budget, message){
    let td = document.createElement("td");
    td.classList.add("OfferesListCoverPhoto");
    
    td.addEventListener("click", ()=>{
        render_each_selected_drink_offer(restaurant, request_purpose, location, date, time, budget, message);
        //render_each_selected_drink_offer_user(requestee_name, requestee_age, requestee_gender, requestee_address);
    });
    
    td.innerHTML = `
                    <img class="OfferersProfileFromList" src="Pictures/TestPhotos/1.jpg" alt=""/>
                    <div>
                        <p style="font-size: 15px; font-weight: bolder;">${requestee_name}</p>
                        <p>${requestee_gender}, ${requestee_age} - ${request_purpose} <span class="OfferersOnlineStatusLedFromList"></span></p>
                    </div>
            `;
    drink_offers_list.appendChild(td);
}

//getting and rendering drink requests
function get_recent_ten_drink_request(city, town, country){
    $.ajax({
        type: "GET",
        url: "./get_recent_ten_drink_request_controller",
        data: "city="+city+"&town="+town+"&country="+country,
        success: function(result){
            console.log(JSON.parse(result));
            let request_list = JSON.parse(result);
            request_list.forEach( request => {
                render_drink_request_to_list(request.requestee_name, request.requestee_gender, request.requestee_age, request.requestee_address, request.request_purpose, request.rest_name, request.rest_location, request.meeting_date, request.meeting_time, request.meeting_budget, request.added_message);
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
            let request_list = JSON.parse(result);
            request_list.forEach( request => {
                render_drink_offers_to_list(request.requestee_name, request.requestee_gender, request.requestee_age, request.request_purpose, request.rest_name, request.rest_location, request.meeting_date, request.meeting_time, request.meeting_budget, request.added_message);
            });
        }
    });
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
                        <img class='RequesteePicture' src="Pictures/TestPhotos/1.jpg" alt=""/>
                    </div>
                    <div class="RequesteeInfoDiv">
                        <p style="font-weight: bolder;">${name}</p>
                        <p>${age} years, ${gender}</p>
                        <p>${address}</p>
                    </div>
                    <p style="clear: both;"></p>
                    <p class="viewFullProfileBtn" style="margin: auto; color: white; background-color: tomato; padding: 5px; 
                            text-align: center; margin-top: 5px; font-size: 14px; width: 95%; margin-bottom: 5px; border-radius: 4px;">
                        View Full Profile
                    </p>
                `;
}

//this function renders each selected drink offer
function render_each_selected_drink_offer(restaurant, purpose, location, date, time, budget, message){
    current_selected_drink_offer.innerHTML = `
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

$(document).ready(()=>{
    get_recent_ten_drink_request("New York", "Bronx", "USA");
    get_recent_ten_drink_offers("jkdhise43hkjJJdjkI4h8dGN09lskw");
});