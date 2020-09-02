//function for displaying chosen restaurant details to confirmation pane
var RP_rest_name = document.getElementById("RP_rest_name");
var RP_rest_photo = document.getElementById("RP_rest_photo");
var RP_rest_icon = document.getElementById("RP_rest_icon");
var RP_rest_rating = document.getElementById("RP_rest_rating");
var RP_rest_location = document.getElementById("RP_rest_location");
var RP_rest_types = document.getElementById("RP_rest_types");

function pick_restaurant(name, photoUrl, iconUrl, rating, locationAddress, typesList){
    RP_rest_name.innerText = name;
    RP_rest_photo.src = photoUrl;
    RP_rest_icon.src = iconUrl;
    RP_rest_rating.innerText = rating;
    RP_rest_location.innerText = locationAddress,
    RP_rest_types.innerText = typesList;
}

