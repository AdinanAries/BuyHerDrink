//handling dom elements
var ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
var search_page_restaurant_option = document.getElementById("search_page_restaurant_option");
var search_page_parks_option = document.getElementById("search_page_parks_option");
var search_page_movies_option = document.getElementById("search_page_movies_option");
var search_page_museums_option = document.getElementById("search_page_museums_option");
var search_page_garderns_option = document.getElementById("search_page_garderns_option");
var search_page_skating_option = document.getElementById("search_page_skating_option");
var map_div = document.getElementById("map_div");
var SearchResultDiv = document.getElementById("SearchResultDiv");
var search_results_list = document.getElementById("search_results_list");
var search_page_start_page = document.getElementById("search_page_start_page");
var search_page_location_P = document.getElementById("search_page_location_P");


//even handlers for search option clicks

//restaurant option
search_page_restaurant_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    _getLocation();
});

//parks option
search_page_parks_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
});

//movies option
search_page_movies_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
});


//museums option
search_page_museums_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
});

//garderns option
search_page_garderns_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
});

//skating option
search_page_skating_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
});


//functions that perform search processes
var GoogleReturned_ZipCode;
var GoogleReturned_City;
var GoogleReturned_Town;
var Google_Reached = false;


//Finding places using a search query
var _map;
var _service;
var _infowindow;

var State_Abbrev = {
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

function init_map(lat, lng, search_radius) {
    var current_location = new google.maps.LatLng(lat, lng);
    
    _infowindow = new google.maps.InfoWindow();
    _map = new google.maps.Map(
            document.getElementById('map_div'), {center: current_location, zoom: 12});
    
    var _request = {
        location: current_location,
        radius: search_radius,
        type: ["restaurant"]
    };
    
    _service = new google.maps.places.PlacesService(_map);
    _service.nearbySearch(_request, call_back);
    
    function call_back(results, status){
        if(status == google.maps.places.PlacesServiceStatus.OK){
            
            for(var i = 0; i < results.length; i++) {
                create_marker(results[i]);
                
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
                
                let div = document.createElement("div");
                div.innerHTML = `
                            <div class="each_search_result_item">
                                <div style="display: flex;">
                                    <div style="width: 100px; height: 100px; background-color: #4d4d4d;">
                                        <img src="${results[i].photos[0].getUrl()}" style="width: 100px; height: auto;">
                                    </div>
                                    <div style="max-width: 200px; margin-left: 10px;">
                                        <p style="color: darkblue; font-weight: bolder; margin-bottom: 5px;">${rest_name}</p>
                                        <p><img src="${results[i].icon}" style="width: 20px; height: auto;"> <span style="color: #37a0f5; font-size: 20px;">${stars}</span></p>
                                        <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> ${results[i].vicinity}<p>
                                    </div>
                                </div>
                                <div style="margin-top: 5px;">
                                    <p style="color: darkgrey;">types: </p>
                                    <p>${types_list}</p>
                                </div>
                                <div style="margin: 10px; padding: 10px 5px; text-align: center; border-radius: 4px; background-color: darkslateblue; color: white;">Make Drink Request</div>
                            </div>
                    `;
                
                search_results_list.appendChild(div);
            }
        }
    }
    
}

function create_marker(place) {
  const _marker = new google.maps.Marker({
    _map,
    position: place.geometry.location
  });
  google.maps.event.addListener(_marker, "click", () => {
    
    _infowindow.setContent(place.name);
    _infowindow.open(_map);
  });
}

function _getLocation(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(_showPosition);
    }else {
        alert("Your browser doesn't support locations feature");
    }
}


function _showPosition(position){
    //alert(position.coords.latitude);
    //alert(position.coords.longitude);
    
    init_map(position.coords.latitude, position.coords.longitude, '5000');
    
    $.ajax({
        type: "GET",
        data: 'latlng=' + position.coords.latitude + ',' + position.coords.longitude + '&sensor=true&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ',
        url: 'https://maps.googleapis.com/maps/api/geocode/json',
        success: function(result){
            //console.log(result);
            GoogleReturned_City = result.results[0].address_components[4].long_name;
            GoogleReturned_Town = result.results[0].address_components[3].long_name;

            let AddressParts = result.results[0].formatted_address.split(",");
            let street = AddressParts[0];
            let country = AddressParts[3];
            let CityZipCodeParts = AddressParts[2].split(" ");
            let city = CityZipCodeParts[1].trim();
            GoogleReturned_Town = AddressParts[1].trim();
            if(GoogleReturned_Town === "The Bronx")
                GoogleReturned_Town = "Bronx";
            GoogleReturned_City = State_Abbrev[city].trim();
            GoogleReturned_ZipCode = CityZipCodeParts[2].trim();
            
            search_page_location_P.innerText = `${street}, ${GoogleReturned_Town} ${GoogleReturned_City}, ${country} ${GoogleReturned_ZipCode}`;
        }
    });
}

