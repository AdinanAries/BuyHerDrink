//getting handles for dom objects
var signup_address_fld = document.getElementById("signup_address_fld");

//Globals for utility function
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

///jquery function for toggling in between login and signup pages
$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});

//this function logs the user in
function login_function(username, password){
    $.ajax({
        type: "GET",
        url: "./login_controller",
        data: "username="+username+"&password="+password,
        success: function(result){
            console.log(result);
            localStorage.setItem("BHDJWT", result);
            window.location.href = "./index.jsp";
            //document.getElementById("loadingPage").style.display = "none";
        }
    });
}

//this onclick event gets the username and password inputs and try to log in
$(document).ready(()=>{
    document.getElementById("login_btn").addEventListener("click", ()=>{
        document.getElementById("loadingPage").style.display = "flex";
        let username = document.getElementById("lgn_user_name_fld").value;
        let password = document.getElementById("lgn_password_fld").value;
        login_function(username, password);
    });
});

//loadingPage is display: block; by default, so set it to display none when page finishes loading
$(document).ready(()=>{
    document.getElementById("loadingPage").style.display = "none";
});

//this line declaratively enables address input feild to have auto completion functionality
let autocomplete = new google.maps.places.Autocomplete(signup_address_fld);

//the subsequent functions enable getting of users current location based on current longitude and latitude

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
    $.ajax({
        type: "GET",
        data: 'latlng=' + position.coords.latitude + ',' + position.coords.longitude + '&sensor=true&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ',
        url: 'https://maps.googleapis.com/maps/api/geocode/json',
        success: function(result){
            //console.log(result);
            GoogleReturnedCity = result.results[0].address_components[4].long_name;
            GoogleReturnedTown = result.results[0].address_components[3].long_name;

            let AddressParts = result.results[0].formatted_address.split(",");
            console.log(AddressParts);
            let street = AddressParts[0];
            let country = AddressParts[3];
            let CityZipCodeParts = AddressParts[2].split(" ");
            let city = CityZipCodeParts[1].trim();
            GoogleReturnedTown = AddressParts[1].trim();
            if(GoogleReturnedTown === "The Bronx")
                GoogleReturnedTown = "Bronx";
            GoogleReturnedCity = StateAbbrev[city].trim();
            GoogleReturnedZipCode = CityZipCodeParts[2].trim();
            
            signup_address_fld.value = `${street}, ${GoogleReturnedTown} ${GoogleReturnedCity}, ${country} ${GoogleReturnedZipCode}`;
        }
    });
}

getLocation();