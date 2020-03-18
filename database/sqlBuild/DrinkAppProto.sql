--create database if it doesn't exist
USE MASTER
 If NOT EXISTS( SELECT * FROM sys.databases WHERE name=N'drinkapp_Backend')
	BEGIN
		CREATE DATABASE drinkapp_Backend
		USE drinkapp_Backend
	END
ELSE
BEGIN
	USE drinkapp_Backend
END

IF NOT EXISTS (SELECT name from sys.schemas where name='drinkproto')
	EXEC ('CREATE SCHEMA drinkproto')

	--Make the tables in the schema
	--User Table
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'Users')
		CREATE TABLE drinkproto.Users (
			Usr_Id INT NOT NULL PRIMARY KEY IDENTITY,
			First_Name NVARCHAR(50) NOT NULL,
			Last_Name NVARCHAR(60),
			Middle_Name NVARCHAR(50),
			Suffix NVARCHAR(10),--Jr, the III, etc.
			Usr_Name NVARCHAR(20) UNIQUE,--No two usernames can be the same
			Usr_Password NVARCHAR(50),
			Usr_Bio NVARCHAR(1000),
			Usr_Birthday DATE,
			Location_City NVARCHAR(200),
			Gender NVARCHAR(20),
			Desired_Relationship NVARCHAR(50),
			Desired_Partner NVARCHAR(20),
			Tagline NVARCHAR(100),
			Email NVARCHAR(500)
		);
	--User Status
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'User_Status')
		CREATE TABLE drinkproto.User_Status (
			Status_Id INT NOT NULL PRIMARY KEY IDENTITY,
			Usr_Id INT NOT NULL,
			Profile_Status NVARCHAR(100),--Busy, Online, etc.
		CONSTRAINT FK_UserStatus_Users FOREIGN KEY (Usr_Id)
				REFERENCES drinkproto.Users(Usr_Id)
				ON DELETE CASCADE
				ON UPDATE CASCADE
		);
	--User Details
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'User_Details')
	--User Details-Hobbies, extended bio, etc
		CREATE TABLE drinkproto.User_Details(
			Detail_Id INT NOT NULL PRIMARY KEY,
			Usr_Id INT NOT NULL,
			Detail_Type NVARCHAR(20),--Dropdown selection, Hobby, bio, etc.
			Detail_Info NVARCHAR(500),--Detail info, the bio, hobby, etc
		CONSTRAINT FK_UserDetail_Users FOREIGN KEY (Detail_Id)
				REFERENCES drinkproto.Users (Usr_Id)
				ON DELETE CASCADE
				ON UPDATE CASCADE
		);
	--User Pictures
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'User_Pictures')
		CREATE TABLE drinkproto.User_Pictures(
			Pic_Id INT NOT NULL IDENTITY,
			Usr_Id INT NOT NULL,--Id picture is linked to
			is_profile_pic BIT,--Boolean
			Picture IMAGE,
			CONSTRAINT FK_UserPicture_Users FOREIGN KEY (Usr_Id)
				REFERENCES drinkproto.Users(Usr_Id)
				ON DELETE CASCADE
				ON UPDATE CASCADE
			);
	--Locations
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'Locations')
		CREATE TABLE drinkproto.Locations(
			Loc_Id INT NOT NULL IDENTITY PRIMARY KEY,
			Loc_Address NVARCHAR(200) NOT NULL,
			Loc_Description NVARCHAR(500),
			Loc_website NVARCHAR(2083)
		);
	--Location photos-profile, etc.
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'Locations_Pictures')
		CREATE TABLE drinkproto.Locations_Pictures(
			Pic_Id INT NOT NULL IDENTITY,
			Loc_Id INT NOT NULL,
			is_profile_pic BIT,--Boolean
			Picture IMAGE,
			CONSTRAINT FK_LocationsPicture_Locations FOREIGN KEY (Loc_Id)
				REFERENCES drinkproto.Locations(Loc_Id)
				ON DELETE CASCADE
				ON UPDATE CASCADE
			);

	--Posts table for creating posts
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'Posts')
		CREATE TABLE drinkproto.Posts(
			Post_Id INT NOT NULL IDENTITY PRIMARY KEY,
			Post_Creator INT NOT NULL,
			Create_Date TIME,--Timestamp, made on creation of post
			Post_Reason NVARCHAR(200),--What the poster is looking for, from dropdown(someone to buy for them, etc.)
			Post_Message NVARCHAR(500),--Message for viewers once they click it
			Loc_Id INT NOT NULL,--Link to Locations
			View_Count INT,
			Start_DateTime DATETIME,
			End_DateTime DATETIME,
			Requested_Amount INT,--Requested amount to be spent
			Accepted_User INT,--Who was accepted by the creator
			Post_Active BIT,--Wheter the Post can be seen or not
			CONSTRAINT FK_PostCreator_Users FOREIGN KEY (Post_Creator)
				REFERENCES drinkproto.Users(Usr_Id)
				ON DELETE CASCADE
				ON UPDATE CASCADE,
			CONSTRAINT FK_AcceptedUser_Users FOREIGN KEY (Accepted_User)
				REFERENCES drinkproto.Users(Usr_Id)
				ON DELETE NO ACTION
				ON UPDATE NO ACTION
			);
	--Table for responding to Posts
	--NOTE: Each Response should auto-create a Response item that is connected to itself in the Response_Links
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA=N'drinkproto'AND TABLE_NAME = N'Post_Responses')
		CREATE TABLE drinkproto.Post_Responses(
			Response_Id INT NOT NULL IDENTITY PRIMARY KEY,
			Post_Creator INT NOT NULL,--FK who created the post
			Response_Creator INT NOT NULL,--who responded
			Original_Post INT, --What post started the chain
			
			Create_Date TIME,--Timestamp, made on creation of post
			Response_Message NVARCHAR(200),
			Response_Offer INT,--Response offer amount, can be different from Posted amount
			
			CONSTRAINT FK_ResponsePostCreator_Users FOREIGN KEY (Post_Creator)
				REFERENCES drinkproto.Users(Usr_Id)
				ON DELETE NO ACTION
				ON UPDATE CASCADE,

			CONSTRAINT FK_OriginalPost_Posts FOREIGN KEY (Original_Post)
				REFERENCES drinkproto.Posts(Post_Id)
				ON DELETE NO ACTION
				ON UPDATE NO ACTION	,

				CONSTRAINT FK_ResponseCreator_Users FOREIGN KEY (Response_Creator)
				REFERENCES drinkproto.Users(Usr_Id)
				ON DELETE NO ACTION
				ON UPDATE NO ACTION
			);

	--Response Links, used to store how Responses are related to each other.
	IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA=N'drinkproto' AND TABLE_NAME=N'Response_Paths')
		CREATE TABLE drinkproto.Response_Paths(
			response_ancestor INT NOT NULL,
			response_descendant INT NOT NULL,
			path_length INT,--how far down the chain the response is.
			PRIMARY KEY(response_ancestor, response_descendant),--

			CONSTRAINT FK_RespAn_Response FOREIGN KEY (response_ancestor)
				REFERENCES drinkproto.Post_Responses(Response_Id)
				ON DELETE NO ACTION
				ON UPDATE NO ACTION,

			CONSTRAINT FK_RespDesc_Response FOREIGN KEY (response_descendant)
				REFERENCES drinkproto.Post_Responses (Response_Id)
				ON DELETE NO ACTION
				ON UPDATE NO ACTION,
		
		
		);
		SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='drinkproto' 
