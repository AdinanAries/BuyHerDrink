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
Result: Returns list(array) of posts that logged in user has made.  

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
## /edituser
### Method: POST(for browsers) and PUT(for Postman or other tools)
Parameters:  
            All Optional-expects it as form data  
            **username**:string, new username  
            **password**: string, new password  
            **name**: string, new name of user  
Results:
    Sets set paramters to new values for logged in user. If not logged in, returns a message with a code 403.  
Additional Information:  
    Checks if username is taken. If it is, will return {"message":"Username Taken"} with status code 403

    User Id cannot be set by user, and is not accessible via this endpoint.

    If all is well, returns the new post as a JSON object with code 200

## /editpost  
### Method: POST(for browsers) and PUT(for Postman or other tools)  
Parameters:  
            Mostly Optional- expects it as form data  
            **id**: id of the post, if not set returns a 403. Validated serverside that logged in user can edit it.
            **title**: string, new title of Post  
            **body**: string, new message body of Post  
            **start_date**: dateTime, new datetime for when date should start being active  
            **end_date**: dateTime, new datetime for when post should end.  
            **active**: integer, if post should be shown now or at a later time.  
Results:  
    Checks if current logged in user owns the post they are trying to edit. If not, returns a code 403, also returns a 403 if id of post is not specified, and if it doesn't exist.  

    If all is well, returns the new post as a JSON object with code 200  
Additional Information:  
    User Id and Post Id cannot be set by user, and is not accessible via this endpoint.

# The following are samples of browser based methods of editing posts and users.

## /editself
### Method: GET  
Parameters:  
        Must be Logged In  
Results:
    Returns a form to edit the Username, Password, and Name of the Logged In User. Autopopulated with current information.  

    Submit button sends the form via POST request to /edituser  

## /editposts

### Method: GET
Parameters: Must be Logged In. 

Results: Table of all posts made by user, with Post Title, Body message, Start date, end date, and active status shown, along with Button that leads to /edit/post/  


## /edit/post/<int:post_id>  as in /edit/post/2
### Method: GET

Parameters: Must be Logged In  
        **post_id**: integer, id of a post
Results:
    Returns a form with all the fields of the post that can be changed by the user. 
    
    On submit, will send form via POST to /editpost

## /edit/post/
### Method: POST
Parameters: Must be Logged In
            **post_id**: integer, sent via form POST request

Results:
    Returns a form with all the fields of the post that can be changed by the user. 
    
    On submit, will send form via POST to /editpost