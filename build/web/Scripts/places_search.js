
var rest_locations_input_fld = document.getElementById("rest_locations_input_fld");
var search_rest_by_name_fld = document.getElementById("search_rest_by_name_fld");
var search_restaurants_btn = document.getElementById("search_restaurants_btn");
var rests_list_location_display = document.getElementById("rests_list_location_display");
var current_restaurants_list = document.getElementById("current_restaurants_list");
var add_place_search_types = document.getElementById("add_place_search_types");

var GoogleReturnedZipCode;
var GoogleReturnedCity;
var GoogleReturnedTown;
var GoogleReached = false;
            
            var StateAbbrev = {
                "AL": "Alabama",
                "AK": "Alaska",
                "AZ": "Arizona",
                "AR": "Arkansas",
                "CA": "California",
                "CO": "Colorado",
                "CT": "Connecticut",
                "DE": "Delaware",
                "FL": "Florida",
                "GA": "Georgia",
                "HI": "Hawaii",
                "ID": "Idaho",
                "IL": "Illinois",
                "IN": "Indiana",
                "IA": "Iowa",
                "KS": "Kansas",
                "KY": "Kentucky",
                "LA": "Louisiana",
                "ME": "Maine",
                "MD": "Maryland",
                "MA": "Massachusetts",
                "MI": "Michigan",
                "MN": "Minnesota",
                "MS": "Mississippi",
                "MO": "Missouri",
                "MT": "Montana",
                "NE": "Nebraska",
                "NV": "Nevada",
                "NH": "New Hampshire",
                "NJ": "New Jersey",
                "NM": "New Mexico",
                "NY": "New York",
                "NC": "North Carolina",
                "ND": "North Dakota",
                "OH": "Ohio",
                "OK": "Oklahoma",
                "OR": "Oregon",
                "PA": "Pennsylvania",
                "RI": "Rhode Island",
                "SC": "South Carolina",
                'SD': "South Dakota",
                "TN": "Tennessee",
                "TX": "Texas",
                "UT": "Utah",
                "VT": "Vermont",
                "VA": "Virginia",
                "WA": "Washington",
                "WV": "West Virginia",
                "WI": "Wisconsin",
                "WY": "Wyoming"
            };


//Finding places using a search query
var map;
var service;
var infowindow;

function initMap(lat, lng, search_radius) {
    
    current_lng = lng;
    current_lat = lat;
    
    var current_location = new google.maps.LatLng(lat, lng);
    
    infowindow = new google.maps.InfoWindow();
    map = new google.maps.Map(
            document.getElementById('map'), {center: current_location, zoom: 12});
    
    var request = {
        location: current_location,
        radius: search_radius,
        type: [type_of_search]
    };
    
    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);
    
    function callback(results, status){
        if(status == google.maps.places.PlacesServiceStatus.OK){
            rests_list_location_display.innerText = rest_locations_input_fld.value;
            current_restaurants_list.innerHTML = "";
            for(var i = 0; i < results.length; i++) {
                
                createMarker(results[i], map, infowindow);
                
                let rating_int = Math.round(results[i].rating);
                let stars = "&#9733;&#9733;&#9733;&#9733;&#9733;";
                if(rating_int === 1){
                    stars="&#9733;&#9734;&#9734;&#9734;&#9734;";
                }else if(rating_int === 2){
                    stars="&#9733;&#9733;&#9734;&#9734;&#9734;";
                }else if(rating_int === 3){
                    stars="&#9733;&#9733;&#9733;&#9734;&#9734;";
                }else if(rating_int === 4){
                    stars="&#9733;&#9733;&#9733;&#9733;&#9734;";
                }else {
                    stars="&#9733;&#9733;&#9733;&#9733;&#9733;";
                }
                
                let types_list = results[i].types.join(', ').replace(/_/g, ' ');
                let rest_name  = results[i].name.replace(/'/g, "");
                
                let li_elem = document.createElement("li");
                li_elem.innerHTML = `<div>
                                        <p style="font-weight: bolder; color: blue;">${results[i].name}</p> 
                                         <div style="background-color: white; padding: 5px; margin-top: 5px; border-radius: 4px;">
                                            <div style="margin: 5px 0;">
                                                <div style="display: flex; justify-content: space-between; margin-bottom: 5px; padding-bottom: 5px;">
                                                    <div style="width: 200px; height: 100px; overflow: hidden;">
                                                        <img src="${results[i].photos[0].getUrl()}" style="width: 200px; height: auto;"/>
                                                    </div>
                                                    <p onclick="pick_restaurant('${rest_name}', '${results[i].photos[0].getUrl()}', '${results[i].icon}', '${stars}', '${results[i].vicinity}', '${types_list}', ${results[i].rating});"
                                                        style="padding: 0 10px; background-color: darkblue; border-radius: 4px; color: white; height: 60px; display: flex; flex-direction: column; justify-content: center;">
                                                        Choose
                                                    </p>
                                                </div>
                                                <p><img src="${results[i].icon}" style="width: 20px; height: auto;"/> <span style="color: #37a0f5; font-size: 20px;">${stars}</span></p>
                                                <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> ${results[i].vicinity}<p>
                                             </div>
                                             <p style="color: darkgrey;">types: </p>
                                             <p>${types_list}</p>
                                         </div>
                                         
                                    </div>`;
                current_restaurants_list.appendChild(li_elem);
                //console.log(results[i]);
            }
        }
    }
    
}

function createMarker(place, map, infowindow) {
  const marker = new google.maps.Marker({
    map,
    position: place.geometry.location
  });
  google.maps.event.addListener(marker, "click", () => {
    
    infowindow.setContent(place.name);
    infowindow.open(map);
  });
}

function getLocation(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition);
    }else {
        alert("Your browser doesn't support locations feature");
    }
}


function showPosition(position){
    //alert(position.coords.latitude);
    //alert(position.coords.longitude);
    current_lng = position.coords.longitude;
    current_lat = position.coords.latitude;
    
    initMap(position.coords.latitude, position.coords.longitude, '5000');
    
    $.ajax({
        type: "GET",
        data: 'latlng=' + position.coords.latitude + ',' + position.coords.longitude + '&sensor=true&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ',
        url: 'https://maps.googleapis.com/maps/api/geocode/json',
        success: function(result){
            //console.log(result);
            GoogleReturnedCity = result.results[0].address_components[4].long_name;
            GoogleReturnedTown = result.results[0].address_components[3].long_name;

            let AddressParts = result.results[0].formatted_address.split(",");
            let CityZipCodeParts = AddressParts[2].split(" ");
            let city = CityZipCodeParts[1].trim();
            GoogleReturnedTown = AddressParts[1].trim();
            if(GoogleReturnedTown === "The Bronx")
                GoogleReturnedTown = "Bronx";
            GoogleReturnedCity = StateAbbrev[city].trim();
            GoogleReturnedZipCode = CityZipCodeParts[2].trim();
            
            rest_locations_input_fld.value = `${GoogleReturnedTown} ${GoogleReturnedCity}, ${GoogleReturnedZipCode}`;
            rests_list_location_display.innerText = `${GoogleReturnedTown} ${GoogleReturnedCity}, ${GoogleReturnedZipCode}`;
        }
    });
}

getLocation();


//Finding places by user's query
/*var Qmap;
var Qservice;
var Qinfowindow

function QinitMap(){
    let 
}*/

//function gets long and lat from user provided address
google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
    
    //for all location based searches
    let autocomplete = new google.maps.places.Autocomplete(rest_locations_input_fld);
    autocomplete.addListener('place_changed', function () {
        let place = autocomplete.getPlace();
    
        // place variable will have all the information you are looking for.
        initMap(place.geometry['location'].lat(), place.geometry['location'].lng(), '5000');
        document.getElementById("rest_list_scroll_div").scrollTop = 0;
        //console.log(place.geometry['location'].lat());
        //console.log(place.geometry['location'].lng());
    });
    
    //for all name based searches
    let autocomplete2 = new google.maps.places.Autocomplete(search_rest_by_name_fld);
    autocomplete2.addListener('place_changed', function () {
        let place = autocomplete2.getPlace();
        
        //setting the address to the locations input field
        rest_locations_input_fld.value = place.formatted_address;
        
        // place variable will have all the information you are looking for.
        initMap(place.geometry['location'].lat(), place.geometry['location'].lng(), '10');
        document.getElementById("rest_list_scroll_div").scrollTop = 0;
        //console.log(place.geometry['location'].lat());
        //console.log(place.geometry['location'].lng());
    });
    
}

add_place_search_types.addEventListener("change", (evnt)=>{
    type_of_search = add_place_search_types.value;
    initMap(current_lat, current_lng, '5000');
    search_rest_by_name_fld.value = '';
    document.getElementById("rest_list_scroll_div").scrollTop = 0;
});

/*/this function returns google address obj using address as parameter.
function getLatLong(address){
      var geo = new google.maps.Geocoder;

      geo.geocode({'address':address},function(results, status){
              if (status == google.maps.GeocoderStatus.OK) {
                return results;
              } else {
                alert("Geocode was not successful for the following reason: " + status);
              }

       });

  }*/