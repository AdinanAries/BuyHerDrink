<%-- 
    Document   : login_and_signup
    Created on : Sep 2, 2020, 11:34:39 PM
    Author     : aries
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login/Register</title>
        <link href="StyleSheets/login_styles.css" rel="stylesheet" type='text/css' />
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&libraries=places"></script>
        
    </head>
    <body>
        <div id='loadingPage'>
            <div class='loader_container'>
                <div class="loader">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <p style='margin: 10px 0; color: darkgrey; font-weight: bolder; opacity: 0.8; text-align: center;'>&copy; 2020, BuyMeDrink</p>
        </div>
        <header>
            <p style='text-align: center;'><img src='buyherdrinkLOGO.png' style='width: 120px; height: auto;' /></p>
            <p style="text-align: center; margin-top: -10px;">&copy; 2020, all rights reserved</p>
            <p style="text-align: center; color: darkblue; font-weight: bolder;">
                <i id="lgn_snp_pg_status_icon" class="fa fa-exclamation-triangle" style="color: red;"></i>
                <span id="lgn_snp_pg_status_msg">You're not logged in. Login or Signup below</span>
            </p>
        </header>
        <div class="login-page">
            <div class="form">
              <form class="register-form">
                <h1 style="font-weight: bolder; color: #37a0f5;
                    font-size: 22px; margin: 20px 0; text-align: center;">
                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                    Register
                </h1>
                <input type="text" placeholder="full name"/>
                <select>
                    <option>21 years</option>
                    <option>22 years</option>
                    <option>23 years</option>
                    <option>24 years</option>
                    <option>25 years</option>
                    <option>26 years</option>
                    <option>27 years</option>
                    <option>28 years</option>
                    <option>29 years</option>
                    <option>30 years</option>
                    <option>31 years</option>
                    <option>32 years</option>
                    <option>33 years</option>
                    <option>34 years</option>
                    <option>35 years</option>
                    <option>36 years</option>
                    <option>37 years</option>
                    <option>38 years</option>
                </select>
                <select>
                    <option>gender</option>
                    <option>Male</option>
                    <option>Female</option>
                </select>
                <select>
                    <option>sexual orientation</option>
                    <option>Straight</option>
                    <option>Gay</option>
                    <option>Bi</option>
                    <option>Prefer Not to Say</option>
                </select>
                <input id="signup_address_fld" type="text" placeholder="residence address"/>
                <input type="password" placeholder="password"/>
                <input type="text" placeholder="email address"/>
                <button>Register</button>
                <p class="message">Already registered? <a href="#">Sign In</a></p>
              </form>
              <form class="login-form">
                <h1 style="font-weight: bolder; color: #37a0f5;
                    font-size: 22px; margin: 20px 0; text-align: center;">
                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                    Login
                </h1>
                <input id='lgn_user_name_fld' type="text" placeholder="username"/>
                <input id='lgn_password_fld' type="password" placeholder="password"/>
                <button id='login_btn'>login</button>
                <p class="message">Not registered? <a href="#">Create an account</a></p>
              </form>
            </div>
        </div>
        <script src="Scripts/login_scripts.js" type="text/javascript"></script>
    </body>
</html>
