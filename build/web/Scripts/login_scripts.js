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

/*/this function logs the user in
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
}*/

//this function logs the user in
function login_function(username_param, password_param){
    $.ajax({
        beforeSend: function(xhrObj){
            xhrObj.setRequestHeader("Content-Type","application/json");
            xhrObj.setRequestHeader("Accept","application/json");
        },
        type: "POST",
        url: "http://www.bmurphyapi.com/login",
        data: JSON.stringify({"username": username_param, "password": password_param}),
        success: function(result){
            console.log(result);
            var res_ob = {
                        status: "",
                        token_id: "",
                        refresh_id: "",
                        token_validity_duration: "",
                        user_id: "",
                        user_name: "",
                        gender: "",
                        age: 26,
                        area: ""
                    };
            //localStorage.setItem("BHDJWT", result);
            //window.location.href = "./index.jsp";
            document.getElementById("loadingPage").style.display = "none";
        },
        error: function(err){
            document.getElementById("loadingPage").style.display = "none";
            //console.log(err);
            if(err.status === 401){
                //console.log(true);
                document.getElementById("login_status_message").style.display = "block";
            }
        }
    });
}

function signup_function(name_param, age_param, gender_param, address_param, email_param, sex_param, username_param, password_param, phone_param, interests_param){
    document.getElementById("loadingPage").style.display = "none";
    let postObj = {
        full_name: name_param,
        username: username_param,
        password: password_param,
        email: email_param,
        gender: gender_param,
        age: age_param,
        phone: phone_param,
        sex_orientation: sex_param,
        address: address_param,
        interests: interests_param
    };
    
    console.log(postObj);
    
    $.ajax({
        beforeSend: xhrObj => {
            xhrObj.setRequestHeader("Content-Type", "application/json");
            xhrObj.setRequestHeader("Accept", "application/json");
        },
        type: "POST",
        url: "",
        data: JSON.stringify(postObj),
        success: res => {
            console.log(res);
        },
        error: err => {
            console.log(err);
        }
    });
}

//this onclick event gets the username and password inputs and try to log in
$(document).ready(()=>{
    //login button event listener
    document.getElementById("login_btn").addEventListener("click", (evnt)=>{
        document.getElementById("loadingPage").style.display = "flex";
        evnt.preventDefault();
        let all_set = true;
        
        document.getElementById("lgn_user_name_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("lgn_password_fld").style.backgroundColor = "#f2f2f2";
        
        let username = document.getElementById("lgn_user_name_fld").value;
        if(username === ""){
            all_set = false;
            document.getElementById("lgn_user_name_fld").focus();
            document.getElementById("lgn_user_name_fld").placeholder = "please enter username";
            document.getElementById("lgn_user_name_fld").style.backgroundColor = "#FBEFEF";
        }
        let password = document.getElementById("lgn_password_fld").value;
        if(password === ""){
            all_set = false;
            document.getElementById("lgn_password_fld").focus();
            document.getElementById("lgn_password_fld").placeholder = "please enter password";
            document.getElementById("lgn_password_fld").style.backgroundColor = "#FBEFEF";
        }
        
        if(all_set){
            login_function(username, password);
        }
    });
    
    //signup button event listener
    document.getElementById("signup_btn").addEventListener("click", (evnt)=>{
        //document.getElementById("loadingPage").style.display = "flex";
        evnt.preventDefault();
        let all_set = true;
        
        document.getElementById("signup_full_name_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_age_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_gender_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_sexual_orientation_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_interest_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_address_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_phone_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_email_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_username_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_password_fld").style.backgroundColor = "#f2f2f2";
        document.getElementById("signup_confirm_password_fld").style.backgroundColor = "#f2f2f2";
        
        let full_name = document.getElementById("signup_full_name_fld").value;
        if(full_name === ""){
            all_set = false;
            document.getElementById("signup_full_name_fld").focus();
            document.getElementById("signup_full_name_fld").placeholder = "please enter full name";
            document.getElementById("signup_full_name_fld").style.backgroundColor = "#FBEFEF";
        }
        let age = document.getElementById("signup_age_fld").value;
        if(age === "default"){
            all_set = false;
            document.getElementById("signup_age_fld").focus();
            document.getElementById("signup_age_fld").placeholder = "please enter age";
            document.getElementById("signup_age_fld").style.backgroundColor = "#FBEFEF";
        }
        let gender = document.getElementById("signup_gender_fld").value;
        if(gender === "default"){
            all_set = false;
            document.getElementById("signup_gender_fld").focus();
            document.getElementById("signup_gender_fld").placeholder = "please enter gender";
            document.getElementById("signup_gender_fld").style.backgroundColor = "#FBEFEF";
        }
        let sexual_orientation = document.getElementById("signup_sexual_orientation_fld").value;
        if(sexual_orientation === "default"){
            all_set = false;
            document.getElementById("signup_sexual_orientation_fld").focus();
            document.getElementById("signup_sexual_orientation_fld").placeholder = "please enter sexual orientation";
            document.getElementById("signup_sexual_orientation_fld").style.backgroundColor = "#FBEFEF";
        }
        let interest = document.getElementById("signup_interest_fld").value;
        if(gender === "default"){
            all_set = false;
            document.getElementById("signup_interest_fld").focus();
            document.getElementById("signup_interest_fld").placeholder = "please pick your interest";
            document.getElementById("signup_interest_fld").style.backgroundColor = "#FBEFEF";
        }
        let residency_address = document.getElementById("signup_address_fld").value;
        if(residency_address === ""){
            all_set = false;
            document.getElementById("signup_address_fld").focus();
            document.getElementById("signup_address_fld").placeholder = "please enter address";
            document.getElementById("signup_address_fld").style.backgroundColor = "#FBEFEF";
        }
        let email = document.getElementById("signup_email_fld").value;
        if(email === ""){
            all_set = false;
            document.getElementById("signup_email_fld").focus();
            document.getElementById("signup_email_fld").placeholder = "please enter email";
            document.getElementById("signup_email_fld").style.backgroundColor = "#FBEFEF";
        }
        let phone = document.getElementById("signup_phone_fld").value;
        if(phone === ""){
            all_set = false;
            document.getElementById("signup_phone_fld").focus();
            document.getElementById("signup_phone_fld").placeholder = "please enter phone";
            document.getElementById("signup_phone_fld").style.backgroundColor = "#FBEFEF";
        }
        let username = document.getElementById("signup_username_fld").value;
        if(username === ""){
            all_set = false;
            document.getElementById("signup_username_fld").focus();
            document.getElementById("signup_username_fld").placeholder = "please enter username";
            document.getElementById("signup_username_fld`").style.backgroundColor = "#FBEFEF";
        }
        let password = document.getElementById("signup_password_fld").value;
        if(password === ""){
            all_set = false;
            document.getElementById("signup_password_fld").focus();
            document.getElementById("signup_password_fld").placeholder = "please enter password";
            document.getElementById("signup_password_fld").style.backgroundColor = "#FBEFEF";
        }
        let confirm_password = document.getElementById("signup_confirm_password_fld").value;
        if(confirm_password === ""){
            all_set = false;
            document.getElementById("signup_confirm_password_fld").focus();
            document.getElementById("signup_confirm_password_fld").placeholder = "please confirm your password";
            document.getElementById("signup_confirm_password_fld").style.backgroundColor = "#FBEFEF";
        }
        if(password !== confirm_password){
            all_set = false;
            document.getElementById("signup_confirm_password_fld").value = "";
            document.getElementById("signup_confirm_password_fld").focus();
            document.getElementById("signup_confirm_password_fld").placeholder = "passwords don't match";
            document.getElementById("signup_confirm_password_fld").style.backgroundColor = "#FBEFEF";
        }
        if(all_set){
            signup_function(full_name, age, gender, residency_address, email, sexual_orientation, username, password, phone, interest);
        }
    });
    
//end of $(document).ready();
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

document.getElementById("lgn_user_name_fld").addEventListener('input',(evnt)=>{
    document.getElementById("login_status_message").style.display = "none";
});
document.getElementById("lgn_password_fld").addEventListener('input',(evnt)=>{
    document.getElementById("login_status_message").style.display = "none";
});