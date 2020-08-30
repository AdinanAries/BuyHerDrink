
var rest_locations_input_fld = document.getElementById("rest_locations_input_fld");
var search_restaurants_btn = document.getElementById("search_restaurants_btn");

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

function initMap(lat, lng) {
    var current_location = new google.maps.LatLng(lat, lng);
    
    map = new google.maps.Map(
            document.getElementById('map'), {center: current_location, zoom: 12});
    
    var request = {
        location: current_location,
        radius: '500',
        type: ['restaurant']
    };
    
    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);
    
    function callback(results, status){
        if(status == google.maps.places.PlacesServiceStatus.OK){
            for(var i = 0; i < results.length; i++) {
                createMarker(results[i]);
            }
        }
    }
    
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
    
    initMap(position.coords.latitude, position.coords.longitude);
    
    $.ajax({
        type: "GET",
        data: 'latlng=' + position.coords.latitude + ',' + position.coords.longitude + '&sensor=true&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ',
        url: 'https://maps.googleapis.com/maps/api/geocode/json',
        success: function(result){
            console.log(result);
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
        }
    });
}

getLocation();


