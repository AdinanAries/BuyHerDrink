//function for displaying chosen restaurant details to confirmation pane
var RP_rest_name = document.getElementById("RP_rest_name");
var RP_rest_photo = document.getElementById("RP_rest_photo");
var RP_rest_icon = document.getElementById("RP_rest_icon");
var RP_rest_rating = document.getElementById("RP_rest_rating");
var RP_rest_location = document.getElementById("RP_rest_location");
var RP_rest_types = document.getElementById("RP_rest_types");
var drink_requests_list = document.getElementById("drink_requests_list");
var drink_offers_list = document.getElementById("drink_offers_list");

function pick_restaurant(name, photoUrl, iconUrl, rating, locationAddress, typesList){
    RP_rest_name.innerText = name;
    RP_rest_photo.src = photoUrl;
    RP_rest_icon.src = iconUrl;
    RP_rest_rating.innerText = rating;
    RP_rest_location.innerText = locationAddress,
    RP_rest_types.innerText = typesList;
    hideRestaurantPopupListByAddress();
}

function render_drink_request_to_list(requestee_name, requestee_gender, requestee_age, request_purpose){
    let td = document.createElement("td");
    
    td.addEventListener("click", ()=>{
        alert("clicked");
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

function render_drink_offers_to_list(requestee_name, requestee_gender, requestee_age, request_purpose){
    let td = document.createElement("td");
    td.classList.add("OfferesListCoverPhoto");
    
    td.addEventListener("click", ()=>{
        alert("clicked");
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
            //console.log(JSON.parse(result));
            let request_list = JSON.parse(result);
            request_list.forEach( request => {
                render_drink_request_to_list(request.requestee_name, request.requestee_gender,request.requestee_age, request.request_purpose);
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
                render_drink_offers_to_list(request.requestee_name, request.requestee_gender,request.requestee_age, request.request_purpose);
            });
        }
    });
}



$(document).ready(()=>{
    get_recent_ten_drink_request("New York", "Bronx", "USA");
    get_recent_ten_drink_offers("jkdhise43hkjJJdjkI4h8dGN09lskw");
});