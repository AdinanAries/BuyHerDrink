//Getting handles to DOM elements

//function for displaying chosen restaurant details to confirmation pane
var RP_rest_name = document.getElementById("RP_rest_name");
var RP_rest_photo = document.getElementById("RP_rest_photo");
var RP_rest_icon = document.getElementById("RP_rest_icon");
var RP_rest_rating = document.getElementById("RP_rest_rating");
var RP_rest_location = document.getElementById("RP_rest_location");
var RP_rest_types = document.getElementById("RP_rest_types");
var RP_post_request_btn = document.getElementById("RP_post_request_btn");
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
var drink_offer_status_P = document.getElementById("drink_offer_status_P");
var ViewOffererFullProfileAndMakeOfferBtns = document.getElementsByClassName("ViewOffererFullProfileAndMakeOfferBtns")[0];
var acceptOfferBtn = document.getElementById("acceptOfferBtn");
var declineOfferBtn = document.getElementById("declineOfferBtn");
var mainMakeOfferBtn = document.getElementById("mainMakeOfferBtn");
var customizeOfferBtn = document.getElementById("customizeOfferBtn");
var drink_request_status_P = document.getElementById("drink_request_status_P");
var drink_bidding_form = document.getElementById("drink_bidding_form");
var drink_request_comments_div = document.getElementById("drink_request_comments_div");
var PDR_details_pane = document.getElementById("PDR_details_pane");

//In memory Object to hold processes data
var publish_request_data = {
    "request_id": "created on server",
    "request_purpose": "Drink",
    "rest_location": "1913 Bronxdale Ave, The Bronx",
    "rest_name": null,
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

var post_dinner_date_data = {
    "user_id": "jkdhise43hkjJJdjkI4h8dGN09lskw",
    "date_party_id": "this your date party id",
    "drink_offer_id": "this is the drink offer id for this date"
};

var send_drink_offer_data = {
    
};

var highest_bidder = {
    "added_message": "This request was so good it needed a 50.00 offer from me",
    "meeting_budget": "$50.00",
    "meeting_date": "09/04/2020",
    "meeting_time": "14:00",
    "request_id": 24,
    "request_purpose": "Drink",
    "bidder_address": "3423 River Ave, Albany, NY",
    "bidder_age": 21,
    "bidder_coverphoto": null,
    "bidder_gender": "female",
    "bidder_id": 252,
    "bidder_name": "Kristina Rodriquez",
    "bidder_propic": null,
    "rest_category_icon": null,
    "rest_location": "1913 Bronxdale Ave, The Bronx",
    "rest_name": "F&J Pine",
    "rest_photo": null,
    "rest_rating": 5,
    "rest_service_types": null
};


//Gobal variables for various utility functions
var type_of_search = "restaurant";
var current_drink_offer_item = "";
var current_drink_request_item = "";
var currentDate = new Date();

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//DOM manipulation functions

//cleaning the slate after drink request post and update
function clean_slate_after_drink_request(){
    rest_locations_input_fld.value = '';
    search_rest_by_name_fld.value = '';
    
    $("html, body").animate({ scrollTop: 0 }, "fast");
    
    RP_rest_name.innerHTML = `<i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span>`;
    RP_rest_photo.src = "";
    RP_rest_icon.src = "";
    RP_rest_rating = document.getElementById("RP_rest_rating");
    RP_rest_location.innerHTML = `<i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span></span>`;
    RP_rest_types.innerHTML = `<i class='fa fa-exclamation-triangle' style='color: red;'></i> <span>no restaurant chosen</span>`;
}

//this function displays selected restaurants for drink request to review and post pane
function pick_restaurant(name, photoUrl, iconUrl, rating, locationAddress, typesList, rating_number){
    RP_rest_name.innerText = name;
    RP_rest_photo.src = photoUrl;
    RP_rest_icon.src = iconUrl;
    RP_rest_rating.innerText = rating;
    RP_rest_location.innerText = locationAddress,
    RP_rest_types.innerText = typesList;
    hideRestaurantPopupListByAddress();
    add_selected_rest_post_data(name, rating_number, photoUrl, iconUrl, typesList, locationAddress);
    search_rest_by_name_fld.value = name;
}

//this function renders drink requests to list that displays them
//it also add a click event listener to each request in the list thats used to diplay the selected user and drink request info
function render_drink_request_to_list(number, requestee_name, requestee_gender, requestee_age, requestee_address, request_purpose, restaurant, location, date, time, budget, message){
    let td = document.createElement("td");
    td.id = "drink_request_"+number;
    
    td.addEventListener("click", ()=>{
        drink_request_status_P.innerHTML = "";
        mainMakeOfferBtn.style.display = "block";
        mainMakeOfferBtn.style.width = "48%";
        customizeOfferBtn.style.display = "block"; 
        drink_request_comments_div.style.display = "none";
        
        render_each_selected_drink_request(restaurant, request_purpose, location, date, time, budget, message);
        render_each_selected_drink_request_user(requestee_name, requestee_age, requestee_gender, requestee_address);
        set_current_drink_request_item("drink_request_"+number);
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

function render_drink_offers_to_list(drink_offer_counter, date_party_id, drink_offer_id, drink_request_id, requestee_name, requestee_gender, requestee_age, requestee_address, request_purpose, restaurant, location, date, time, budget, message){
    
    let td = document.createElement("td");
    td.classList.add("OfferesListCoverPhoto");
    td.id = "drink_offer_"+ drink_offer_counter;
    
    td.addEventListener("click", ()=>{
        drink_offer_status_P.innerHTML = "";
        acceptOfferBtn.style.display = "block";
        declineOfferBtn.style.display = "block";
        
        render_each_selected_drink_offer(restaurant, request_purpose, location, date, time, budget, message);
        render_each_selected_drink_offer_user(requestee_name, requestee_age, requestee_gender, requestee_address);
        add_dinner_date_data(date_party_id, drink_offer_id);
        set_current_drink_offer_item("drink_offer_"+ drink_offer_counter);
        get_highest_bidder(drink_request_id);
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
                                <span style="color: tomato; font-size: 14px;">${budget} </span><br/> 
                            </p>
                            <p id="beat_bid_btn"
                               style="color: white; font-size: 14px; border-radius: 4px; padding: 10px; background-color: darkslateblue; text-align: center; margin: 5px 0;">beat current bid: $50.00</p>
                        </div>
                        <div style="padding: 10px;">
                            <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Added Message</p>
                            <p style="font-size: 14px;">
                                ${message}
                            </p>
                        </div>
                `;
    
     $("HTML, BODY").animate({
            scrollTop: 0
        }, 300);
    document.getElementById("beat_bid_btn").style.display = "block";
    drink_bidding_form.style.display = "none";
    
    document.getElementById("beat_bid_btn").addEventListener("click", ()=>{
        document.getElementById("beat_bid_btn").style.display = "none";
        drink_bidding_form.style.display = "flex";
    });
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
                                <span style="color: tomato; font-size: 14px;">${budget} </span>
                            </p>
                            <p id="see_highest_bidder_btn" 
                                        style="color: darkgreen; font-size: 14px; font-weight: bolder; padding: 5px; border-radius: 4px; 
                                                background-color: darkslateblue; color: white; margin: 5px 0; max-width: 250px; text-align: center;">
                                    see highest bidder: ${highest_bidder.meeting_budget}
                              
                            </p>
                        </div>
                        <div style="padding: 10px;">
                            <p style="font-size: 14px; font-weight: bolder; text-align: center; color: navy;">Added Message</p>
                            <p style="font-size: 14px;">
                                ${message}
                            </p>
                        </div>
                `;
    
    $("HTML, BODY").animate({
            scrollTop: 0
        }, 300);
        
        document.getElementById("see_highest_bidder_btn").addEventListener("click", (evnt) => {
            render_each_selected_drink_offer(highest_bidder.rest_name, highest_bidder.request_purpose, highest_bidder.rest_location, highest_bidder.meeting_date, highest_bidder.meeting_time, highest_bidder.meeting_budget, highest_bidder.added_message);
            render_each_selected_drink_offer_user(highest_bidder.bidder_name, highest_bidder.bidder_age, highest_bidder.bidder_gender, highest_bidder.bidder_address);
            document.getElementById("see_highest_bidder_btn").style.display = "none";
            //console.log("rendering highest bidder");
            
        });
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

//this function renders dinner dates
function render_dinner_date(index, name, gender, age, address, rest_name, rest_location, meeting_date, meeting_time, meeting_purpose, meeting_price){
    let div = document.createElement("div");
    div.innerHTML = `
                <div class="each_date_details_div">
                    <div style="display: flex; padding: 10px;">
                        <div style="width: 100px; height: 100px; border-radius: 100%; background-color: #D9DADC;">
                            <img src="" style="width: 100%; height: auto;"/>
                        </div>
                        <div style="padding: 5px; margin-left: 15px; display: flex; flex-direction: column; justify-content: flex-end;">
                            <p style="color: #4CAF50; font-weight: bolder;">${name}</p>
                            <p style="font-size: 14px;">${gender}, ${age}, ${meeting_purpose}</p>
                            <p style="font-size: 14px;">${address}</p>
                        </div>
                    </div>
                    <div style='padding: 10px; margin-top: 5px; border-top: #999999 1px solid;'>
                        <p style="color: aqua; font-weight: bolder;">${rest_name}</p>
                        <p style="font-size: 14px;">${rest_location}</p>
                        <p style="font-size: 14px;">${meeting_date} at ${meeting_time} - ${meeting_price}</p>
                    </div>
                    <div class='postpone_dinner_date_form' id="postpone_dinner_date_form${index}">
                        <p style="text-align: center; color: white; font-weight: bolder; margin: 5px 0;">Postpone this date</p>
                        <div style="display: flex; justify-content: center;">
                            <div style="width: 300px;">
                                <input style="margin-right: 5px;" id="postpone_dinner_date_fld${index}" class="postpone_dinner_date_fld" type="text" />
                                <input class="postpone_dinner_time_fld" id="postpone_dinner_time_fld${index}" type="text" />
                            </div>
                        </div>
                        <div style="display: flex; justify-content: center; padding: 5px;">
                            <div class="postpone_dinner_date_btns">
                                <div class='update_dinner_date_btn'>Update</div>
                                <div onclick="show_postpone_dinner_date_form('${index}');" class='cancel_update_dinner_date_btn'>Cancel</div>
                            </div>
                        </div>
                    </div>
                    <div class='cancel_dinner_date_form' id="cancel_dinner_date_form${index}">
                        <p style="text-align: center; color: white; font-size: 15px; font-weight: bolder; margin: 5px 0;">
                            <i class="fa fa-exclamation" style="color: red;"></i> Are you sure you want to cancel this date
                        </p>
                        
                        <div style="display: flex; justify-content: center; padding: 5px;">
                            <div class="cancel_dinner_date_btns">
                                <div class='cancel_dinner_date_yes_btn'>Yes</div>
                                <div onclick="show_cancel_dinner_date_form('${index}');" class='_cancel_dinner_date_no_btn'>No</div>
                            </div>
                        </div>
                    </div>
                    <div
                         id="update_dinner_date_btns${index}" 
                         class="update_dinner_date_btns" style='display: flex; padding: 10px; justify-content: space-between;'>
                        <div onclick="show_postpone_dinner_date_form('${index}');" style="padding: 10px; background-color: #37a0f5; border-radius: 5px;">
                            <p style="font-size: 14px;">Postpone</p>
                        </div>
                        <div onclick="show_cancel_dinner_date_form('${index}');" style="padding: 10px; background-color: #98d7ff; border-radius: 5px; margin-left: 10px; background-color: crimson">
                            <p style="font-size: 14px;">Cancel Date</p>
                        </div>
                    </div>
            </div>
        `;
    document.getElementById("dates_list_container").appendChild(div);
}

$("#PDR_date_fld").datepicker({ minDate: 0 }).datepicker("setDate", currentDate);
$("#postpone_dinner_date_fld0").datepicker({ minDate: 0 }).datepicker("setDate", currentDate);

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
            current_drink_request_item = "drink_request_0";
            
            request_list.forEach( (request, index) => {
                render_drink_request_to_list(
                                                index,
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
            current_drink_offer_item = "drink_offer_0";
            
            offer_list.forEach( (request, index) => {
                render_drink_offers_to_list(index,"new_date_party_id", "new_drink_offer_id", "new_drink_request_id", request.requestee_name, request.requestee_gender, request.requestee_age, request.requestee_address, request.request_purpose, request.rest_name, request.rest_location, request.meeting_date, request.meeting_time, request.meeting_budget, request.added_message);
            });
        }
    });
}


//getting and rendering dinner dates
function get_recent_ten_dinner_dates(user_id){
    $.ajax({
        type: "POST",
        url: "./get_recent_ten_dinner_dates",
        data: "user_id="+user_id,
        success: function(result){
            let data = JSON.parse(result);
            data.forEach((item, index) => {
                render_dinner_date(index, item.date_name, item.date_gender, item.date_age, item.date_address,
                                    item.rest_name, item.rest_location, item.meeting_date, 
                                    item.meeting_time, item.meeting_purpose, item.meeting_pric
                                );
            });
        }
    });
}

//getting highest bidder for each request
function get_highest_bidder(drink_request_id){
    console.log(drink_request_id);
    $.ajax({
        type: "GET",
        url: "./get_highest_bidder",
        data: "drink_request_id="+drink_request_id,
        success: function(result){
            let obj = JSON.parse(result);
            highest_bidder = obj;
        }
    });
    
    document.getElementById("see_highest_bidder_btn").innerText = "see highest bidder: " + highest_bidder.meeting_budget;
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

function add_dinner_date_data(date_party_id, drink_offer_id){
    post_dinner_date_data.date_party_id = date_party_id;
    post_dinner_date_data.drink_offer_id = drink_offer_id;
}

function set_current_drink_offer_item(item_id){
    current_drink_offer_item = item_id;
}
    
function set_current_drink_request_item(item_id){
    current_drink_request_item = item_id;
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
//functions that post data from the endpoints

function post_drink_request(data){
    $.ajax({
        type: "POST",
        url: "./post_drink_request_controller",
        data: JSON.stringify(data),
        success: function(result){
            publish_request_data.rest_name = null;
            clean_slate_after_drink_request();
        }
    });
}

function update_drink_request(data){
    //ajax code here
    //then success funtion here
    alert("drink request updated");
    RP_update_request_btn.style.display = "none";
    RP_post_request_btn.style.display = "flex";
    publish_request_data.rest_name = null;
    clean_slate_after_drink_request();
    
}

$("#RP_post_request_btn").click(function(event){
    //alert(RP_post_request_btn.disabled);
    post_drink_request(publish_request_data);
});

$("#RP_update_request_btn").click(function(evnt){
    update_drink_request(publish_request_data);
});

function start_update_drink_request(number, user_id, drink_request_id, date, time, rest_name, types, rating, rating_number, iconUrl, purpose, rest_location, price, imgurl){
    let each_your_dr = "each_your_drink_request_div"+number;
    $("#"+each_your_dr).slideUp("fast");
    
    /*$("#search_rest_by_name_fld").val(rest_name + " " + rest_location).trigger('change');
    document.getElementById("search_rest_by_name_fld").click();
    
    $.ajax({
        url: "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&address="+rest_location+"&sensor=false",
        type: "POST",
        success: function(res){
           initMap(res.results[0].geometry.location.lat, res.results[0].geometry.location.lng, '1000');
        }
      });*/
    
    RP_post_request_btn.style.display = "none";
    RP_update_request_btn.style.display = "flex";
    
    rest_locations_input_fld.value = rest_location;
    PDR_date_fld.value = date;
    PDR_time_fld.value = time;
    PDR_price_fld.value = price;
    
    pick_restaurant(rest_name, imgurl, iconUrl, rating, rest_location, types, rating_number);
    
    //this hides drink requests div since its a toggle
    showYourDrinkRequests();
    
    search_rest_by_name_fld.value = rest_name + " " + rest_location;
    search_rest_by_name_fld.focus();
    document.getElementById("publish_drink_request_fields").scrollIntoView();
    document.getElementById("search_rest_by_name_fld").scrollTop = 0;
}

function post_dinner_date(data, current_item){
    console.log(data.user_id);
    console.log(data.date_party_id);
    console.log(data.drink_offer_id);
    drink_offer_status_P.innerHTML = "<i style='color: green;' class='fa fa-check'></i> your have confirmed this date";
    document.getElementById(current_item).style.display = "none";
    acceptOfferBtn.style.display = "none";
    declineOfferBtn.style.display = "none";
}

$("#acceptOfferBtn").click((evnt) => {
    post_dinner_date(post_dinner_date_data, current_drink_offer_item);
});

function decline_drink_offer(drink_offer_id, current_item){
    drink_offer_status_P.innerHTML = "<i style='color: red;' class='fa fa-exclamation-triangle'></i> you've declined this offer";
    document.getElementById(current_item).style.display = "none";
    acceptOfferBtn.style.display = "none";
    declineOfferBtn.style.display = "none";
}

$("#declineOfferBtn").click((evnt)=>{
    decline_drink_offer("drink_offer_id", current_drink_offer_item);
});

function send_drink_offer(send_offer_data){
    drink_request_status_P.innerHTML = "<i style='color: green;' class='fa fa-check'></i> your offer has been sent";
    document.getElementById(current_drink_request_item).style.display = "none";
    mainMakeOfferBtn.style.display = "none";
    customizeOfferBtn.style.display = "none";
    drink_request_comments_div.style.display = "none";
    document.getElementById("beat_bid_btn").style.display = "none";
    drink_bidding_form.style.display = "none";
}

$("#mainMakeOfferBtn").click((evnt)=>{
    send_drink_offer(send_drink_offer_data);
});

customizeOfferBtn.addEventListener("click", ()=>{
    customizeOfferBtn.style.display = "none";
    drink_request_comments_div.style.display = "block";
    mainMakeOfferBtn.style.width = "100%";
});
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
//functions that initialize application
$(document).ready(()=>{
    get_recent_ten_drink_request("New York", "Bronx", "USA");
    get_recent_ten_drink_offers("jkdhise43hkjJJdjkI4h8dGN09lskw");
    get_recent_ten_dinner_dates("jkdhise43hkjJJdjkI4h8dGN09lskw");
});

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//functions that enforce checks

setInterval(()=>{
    if(publish_request_data.rest_name === null){
        document.getElementById("RP_post_request_btn").style.backgroundColor = "darkgrey";
        document.getElementById("RP_post_request_btn").disabled = "true";
    }else{
        document.getElementById("RP_post_request_btn").style.backgroundColor = "darkslateblue";
        document.getElementById("RP_post_request_btn").disabled = "false";
    }
}, 1);