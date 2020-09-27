# About

This folder contains backend API and server logic for the Buy Her Drink Web app. It uses Python Flask, and has dependencies listed in Requirements.txt.

To use create a virtualenvironment, then type pip install -r requirements.txt

# API Manual

The API has few paths, listed below. Note that much of the API is still under development, with some off repo.

## /register
### Method: POST  
Parameters: username,password  
Result: Registers a new user.  
## /user/user_id:int

### Method: GET  
Parameters: user_id(integer)  
Result: Looks up a user by id  

### Method: DELETE  
Parameters: user_id(integer)  
Result: Deletes a user by their ID.

### Method: POST  
Parameters: user_id(integer), must be logged in  
Result: Shows if you are logged in as the user.  
##  /login
### Method: POST  
Parameters: username,password
Result: Logs user in by returning a cookie with access and refresh tokens

## /logout  
### Method: POST  
Parameters: Must be logged in  
Result: Deletes cookie and revokes token.

## /getusers  
### Method: GET  
Parameters: Must be logged in
Result: Returns full JSON details of logged in user.  

### Method: POST  
Parameters: Must be logged in  
Result: Returns list of users in JSON format.  

## /mypost
### Method: GET  
Parameters: Must be logged in
Result: Returns list of posts that logged in user has made.  

## /allposts  
### Method: Get
Paramters: None
Result: Gets list of all posts made.

## /createpost
### Method: Post
Parameters: Must be logged in, user_id,-int  
            title,body,  
            start_date,end_date- both datetimes  
            active- bool but technically int,
            request_status-string(not required)

Result: Finds current logged in User ID and creates a post linked to them. 