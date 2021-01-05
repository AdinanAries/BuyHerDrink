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
                <input id="signup_full_name_fld" type="text" placeholder="full name"/>
                <select id="signup_age_fld">
                    <option value="default">Age</option>
                    <option value="18">18 years</option>
                    <option value="19">19 years</option>
                    <option value="20">20 years</option>
                    <option value="21">21 years</option>
                    <option value="22">22 years</option>
                    <option value="23">23 years</option>
                    <option value="24">24 years</option>
                    <option value="25">25 years</option>
                    <option value="26">26 years</option>
                    <option value="27">27 years</option>
                    <option value="28">28 years</option>
                    <option value="29">29 years</option>
                    <option value="30">30 years</option>
                    <option value="31">31 years</option>
                    <option value="32">32 years</option>
                    <option value="33">33 years</option>
                    <option value="34">34 years</option>
                    <option value="35">35 years</option>
                    <option value="36">36 years</option>
                    <option value="37">37 years</option>
                    <option value="38">38 years</option>
                    <option value="39">39 years</option>
                    <option value="40">40 years</option>
                    <option value="41">41 years</option>
                    <option value="42">42 years</option>
                    <option value="43">43 years</option>
                    <option value="44">44 years</option>
                    <option value="45">45 years</option>
                    <option value="46">46 years</option>
                    <option value="47">47 years</option>
                    <option value="48">48 years</option>
                    <option value="49">49 years</option>
                    <option value="50">50 years</option>
                    <option value="51">51 years</option>
                    <option value="52">52 years</option>
                    <option value="53">53 years</option>
                    <option value="54">54 years</option>
                    <option value="55">55 years</option>
                    <option value="56">56 years</option>
                    <option value="57">57 years</option>
                    <option value="58">58 years</option>
                    <option value="59">59 years</option>
                    <option value="60">60 years</option>
                    <option value="61">61 years</option>
                    <option value="62">62 years</option>
                    <option value="63">63 years</option>
                    <option value="64">64 years</option>
                    <option value="65">65 years</option>
                    <option value="66">66 years</option>
                    <option value="67">67 years</option>
                    <option value="68">68 years</option>
                    <option value="69">69 years</option>
                    <option value="70">70 years</option>
                    <option value="71">71 years</option>
                    <option value="72">72 years</option>
                    <option value="73">73 years</option>
                    <option value="74">74 years</option>
                    <option value="75">75 years</option>
                    <option value="76">76 years</option>
                    <option value="77">77 years</option>
                    <option value="78">78 years</option>
                    <option value="79">79 years</option>
                    <option value="80">80 years</option>
                    <option value="81">81 years</option>
                    <option value="82">82 years</option>
                    <option value="83">83 years</option>
                    <option value="84">84 years</option>
                    <option value="85">85 years</option>
                    <option value="86">86 years</option>
                    <option value="87">87 years</option>
                    <option value="88">88 years</option>
                    <option value="89">89 years</option>
                    <option value="90">90 years</option>
                    <option value="91">91 years</option>
                    <option value="92">92 years</option>
                    <option value="93">93 years</option>
                    <option value="94">94 years</option>
                    <option value="95">95 years</option>
                    <option value="96">96 years</option>
                    <option value="97">97 years</option>
                    <option value="98">98 years</option>
                    <option value="99">99 years</option>
                </select>
                <select id="signup_gender_fld">
                    <option value="default">gender</option>
                    <option>Male</option>
                    <option>Female</option>
                </select>
                <select id="signup_interest_fld">
                    <option value="default">Interested in</option>
                    <option>Men</option>
                    <option>Women</option>
                    <option>Both</option>
                </select>
                <!--select id="signup_sexual_orientation_fld">
                    <option value="default">sexual orientation</option>
                    <option>Straight</option>
                    <option>Gay</option>
                    <option>Bi</option>
                    <option>Prefer Not to Say</option>
                </select-->
                <input id="signup_phone_fld" type="number" placeholder="phone"/>
                <input id="signup_email_fld" type="email" placeholder="email address"/>
                <input id="signup_address_fld" type="text" placeholder="residence address"/>
                
                <p style="text-align: left; margin: 10px 0; margin-top: 15px; font-size: 12px; letter-spacing: 0.6px; font-weight: bolder; color: darkblue">
                    Add Login Information Below
                </p>
                <input id="signup_username_fld" type="text" placeholder="username"/>
                <input id="signup_password_fld" type="password" placeholder="password"/>
                <input id="signup_confirm_password_fld" type="password" placeholder="confirm password"/>
                
                <button id="signup_btn">Sign Up</button>
                <p class="message">Already have an account? <a href="#">Sign In</a></p>
              </form>
              <form class="login-form">
                <h1 style="font-weight: bolder; color: #37a0f5;
                    font-size: 22px; margin: 20px 0; text-align: center;">
                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                    Login
                </h1>
                  <input id='lgn_user_name_fld' type="text" placeholder="username" required="true"/>
                <input id='lgn_password_fld' type="password" placeholder="password"/>
                
                <button id='login_btn'>login</button>
                <p id="login_status_message" style="display: none; color: darkblue; font-size: 14px; margin: 20px 0;">
                    <i style="color: orangered; margin-right: 5px;" class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                   Enter correct username or password. Or sign up if you don't have an account
                </p>
                <p class="message">Not registered? <a href="#">Create an account</a></p>
              </form>
            </div>
        </div>
        <script src="Scripts/login_scripts.js" type="text/javascript"></script>
    </body>
</html>
