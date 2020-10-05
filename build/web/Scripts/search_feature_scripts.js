//handling dom elements
var ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
var search_page_restaurant_option = document.getElementById("search_page_restaurant_option");
var search_page_parks_option = document.getElementById("search_page_parks_option");
var search_page_movies_option = document.getElementById("search_page_movies_option");
var search_page_museums_option = document.getElementById("search_page_museums_option");
var search_page_cafe_option = document.getElementById("search_page_cafe_option");
var search_page_bar_option = document.getElementById("search_page_bar_option");
var map_div = document.getElementById("map_div");
var SearchResultDiv = document.getElementById("SearchResultDiv");
var search_results_list = document.getElementById("search_results_list");
var search_page_start_page = document.getElementById("search_page_start_page");
var search_page_location_P = document.getElementById("search_page_location_P");
var main_search_fld = document.getElementById("main_search_fld");
var back_to_search_home_icons_btn = document.getElementById("back_to_search_home_icons_btn");
var main_search_types = document.getElementById("main_search_types");

//this global variable lets us know what search button was clicked
var current_lng, current_lat;

//even handlers for search option clicks

//back to search home function
back_to_search_home_icons_btn.addEventListener("click", (evnt)=>{
    SearchResultDiv.style.display = "none";
    search_page_start_page.style.display = "block";
});

//restaurant option
search_page_restaurant_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    type_of_search = "restaurant";
    get_location();
});

//parks option
search_page_parks_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    type_of_search = "park";
    get_location();
});

//movies option
search_page_movies_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    type_of_search = "movie_theater";
    get_location();
});


//museums option
search_page_museums_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    type_of_search = "museum";
    get_location();
});

//garderns option
search_page_cafe_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    type_of_search = "cafe";
    get_location();
});

//bar option
search_page_bar_option.addEventListener("click", (evnt)=>{
    search_page_start_page.style.display = "none";
    SearchResultDiv.style.display = "block";
    type_of_search = "bar";
    get_location();
});


//functions that perform search processes
var GoogleReturned_ZipCode;
var GoogleReturned_City;
var GoogleReturned_Town;
var Google_Reached = false;


//Finding places using a search query
var sp_map;
var sp_service;
var sp_infowindow;

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

function init_map(lat, lng, search_radius, type = "restaurant") {
    var sp_current_location = new google.maps.LatLng(lat, lng);
    
    sp_infowindow = new google.maps.InfoWindow();
    sp_map = new google.maps.Map(
            document.getElementById('map_div'), {center: sp_current_location, zoom: 12});
    
    var sp_request = {
        location: sp_current_location,
        radius: search_radius,
        type: [type]
    };
    
    sp_service = new google.maps.places.PlacesService(sp_map);
    sp_service.nearbySearch(sp_request, call_back);
    
    function call_back(results, status){
        if(status == google.maps.places.PlacesServiceStatus.OK){
            
            search_results_list.innerHTML = "";
            
            for(var w = 0; w < results.length; w++) {
                
                createMarker(results[w], sp_map, sp_infowindow);
                
                let rating_int = Math.round(results[w].rating);
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
                
                let types_list = results[w].types.join(', ').replace(/_/g, ' ');
                let rest_name  = results[w].name.replace(/'/g, "");
                
                let div = document.createElement("div");
                div.innerHTML = `
                            <div class="each_search_result_item">
                                <div style="display: flex;">
                                    <div style="width: 100px; height: 100px; background-color: #4d4d4d; overflow: hidden;">
                                        <img src="${results[w].photos[0].getUrl()}" style="width: 100px; height: auto;">
                                    </div>
                                    <div style="max-width: 200px; margin-left: 10px;">
                                        <p style="color: darkblue; font-weight: bolder; margin-bottom: 5px;">${rest_name}</p>
                                        <p><img src="${results[w].icon}" style="width: 20px; height: auto;"> <span style="color: #37a0f5; font-size: 20px;">${stars}</span></p>
                                        <p><i class="fa fa-map-marker" style="color: darkgrey; font-size: 18px;" aria-hidden="true"></i> ${results[w].vicinity}<p>
                                    </div>
                                </div>
                                <div style="margin-top: 5px;">
                                    <p style="color: darkgrey;">types: </p>
                                    <p>${types_list}</p>
                                </div>
                                <div onclick="pick_restaurant_from_search('${rest_name}', '${results[w].photos[0].getUrl()}', '${results[w].icon}', '${stars}', '${results[w].vicinity}', '${types_list}', '${results[w].rating}');"
                                     style="margin: 10px; padding: 10px 5px; text-align: center; border-radius: 4px; background-color: darkslateblue; color: white; font-size: 16px;">
                                        Make Drink Request</div>
                            </div>
                    `;
                
                search_results_list.appendChild(div);
            }
        }
    }
    
}

//*********************************
function get_location(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(show_position);
    }else {
        alert("Your browser doesn't support locations feature");
    }
}


function show_position(position){
    //alert(position.coords.latitude);
    //alert(position.coords.longitude);
    
    init_map(position.coords.latitude, position.coords.longitude, '5000', type_of_search);
    
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

//main search autocompletion and search
    
    var sp_autocomplete = new google.maps.places.Autocomplete(main_search_fld);
    sp_autocomplete.addListener('place_changed', function () {
        let place = sp_autocomplete.getPlace();
        
        current_lng = place.geometry['location'].lng();
        current_lat = place.geometry['location'].lat();
        
        // place variable will have all the information you are looking for.
        let search_type = main_search_types.value;
        init_map(place.geometry['location'].lat(), place.geometry['location'].lng(), '5000', search_type);
        search_page_location_P.innerText = main_search_fld.value;
        //document.getElementById("rest_list_scroll_div").scrollTop = 0;
        sp_showExploreRestaurantsDiv();
        search_page_start_page.style.display = "none";
        SearchResultDiv.style.display = "block";
        //console.log(place.geometry['location'].lat());
        //console.log(place.geometry['location'].lng());
    });
    
    //when the selected type of search value changes
    main_search_types.addEventListener("change", ()=>{
        init_map(current_lat, current_lng, '5000', main_search_types.value);
        search_page_location_P.innerText = main_search_fld.value;
        //document.getElementById("rest_list_scroll_div").scrollTop = 0;
        sp_showExploreRestaurantsDiv();
        search_page_start_page.style.display = "none";
        SearchResultDiv.style.display = "block";
    });
    
   var sp_showExploreRestaurantsDiv = () => {
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   SetWindowTitle("Search Results");
   
   ExploreRestaurantsDiv.style.display = "block";
   DrinkRequestsIframe.style.display = "none";
   UserProfileIframe.style.display = "none";
   DrinkOffersIframe.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
};

function pick_restaurant_from_search(rest_name, rest_photos, rest_icon, stars, rest_location, rest_types_list, rest_rating_number){
    document.getElementById("rest_locations_input_fld").value = main_search_fld.value;
    
    initMap(current_lat, current_lng, '5000');
    document.getElementById("rest_list_scroll_div").scrollTop = 0;
    
    pick_restaurant(rest_name, rest_photos, rest_icon, stars, rest_location, rest_types_list, rest_rating_number);
    
    document.getElementById("search_rest_by_name_fld").value = rest_name;
    hide_search_and_show_home();
    document.getElementById("publish_drink_request_fields").scrollIntoView();
    
    
    /*if($(window).width() < 1000){
       $(window).scrollTop(1000);
    }*/
}

function hide_search_and_show_home(){
   let UserProfileIframe = document.getElementById("UserProfileIframe");
   let DrinkRequestsIframe = document.getElementById("DrinkRequestsIframe");
   let DrinkOffersIframe = document.getElementById("DrinkOffersIframe");
   let ExploreRestaurantsDiv = document.getElementById("ExploreRestaurantsDiv");
   let fullProfileDiv = document.getElementById("viewFullProfileDiv");
   let settingsDiv = document.getElementById("settingsDiv");
   
   SetWindowTitle("Your Profile");
   
   UserProfileIframe.style.display = "block";
   DrinkRequestsIframe.style.display = "none";
   DrinkOffersIframe.style.display = "none";
   ExploreRestaurantsDiv.style.display = "none";
   fullProfileDiv.style.display = "none";
   settingsDiv.style.display = "none";
}