# User Resource- Link and processing
from flask_restful import Resource, reqparse
from werkzeug.security import safe_str_cmp
from flask_jwt_extended import (
    create_access_token,
    create_refresh_token,
    jwt_refresh_token_required,
    get_jwt_identity,
    jwt_required,
    get_raw_jwt,
    set_access_cookies,
    set_refresh_cookies, 
    unset_jwt_cookies
)
from models.user import UserModel
from blacklist import BLACKLIST
from flask import jsonify, make_response,request
from dataclasses import dataclass
import db
import json
# User class 

_user_parser = reqparse.RequestParser()
_user_parser.add_argument(
    "username", type=str, required=True, help="This field cannot be blank."
)
_user_parser.add_argument(
    "password", type=str, required=True, help="This field cannot be blank."
)
_user_parser.add_argument(
    "name", type=str,  help="Enter the name please.",default="Drink User"
)
class UserRegister(Resource):
    def post(self):
        data = _user_parser.parse_args()

        if UserModel.find_by_username(data["username"]):
            return {"message": "A user with that username already exists."}, 400

        user = UserModel(**data)
        user.save_to_db()

        return {"message": "User created successfully."}, 201

# Used as test for logins and outs
class User(Resource):
   

    @classmethod
    def get(cls, user_id: int):
        user = UserModel.find_by_id(user_id)
        if not user:
            return {"message": "User not found."}, 404
        return user.json(), 200

    @classmethod
    def delete(cls, user_id: int):
        user = UserModel.find_by_id(user_id)
        if not user:
            return {"message": "User not found."}, 404
        user.delete_from_db()
        return {"message": "User deleted."}, 200

    #Check if user is accessing a page they have edit rights on.
    @classmethod
    @jwt_required
    def post(cls,user_id:int):
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        user = UserModel.find_by_id(user_id)
        if uid ==user_id:
            return {"message":"Logged in as the user. "},200
        else:
            return {"message": "Logged in as user id {}, access deined".format(uid)},200
class GetAll(Resource):
    @classmethod
    @jwt_required
    def post(cls):
        users=[user.json() for user in UserModel.find_all()]
        return {"users":users},200
    @classmethod
    @jwt_required
    def get(cls):
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        user = UserModel.find_by_id(uid)
        #print(user.__dict__)
        #print(vars(user))
        return user.json(),200

class Username(Resource):
    @classmethod
    def get(cls, name:str):
        user=UserModel.find_by_name(name)
        if not user:
            return {"message":"User with name not found."},404
        return user.json(),200

class UserLogin(Resource):
    def post(self):
        data = _user_parser.parse_args()

        user = UserModel.find_by_username(data["username"])

        if user and safe_str_cmp(user.password, data["password"]):
            access_token = create_access_token(identity=user.user_id, fresh=True)
            refresh_token = create_refresh_token(user.user_id)

            resp = jsonify({'login': True,'access_token':access_token,'refresh_token':refresh_token})
            set_access_cookies(resp, access_token)
            set_refresh_cookies(resp, refresh_token)
            #cookies=[ ('Set-Cookie', 'access_token=%s'.format(access_token)), ('Set-Cookie', 'refresh_token=%s'.format(refresh_token)),'Set-Cookie' ]
            resp.headers['Authorization']=str('Bearer '+access_token)
            print(resp)
            return resp

        return {"message": "Invalid credentials!"}, 401


class UserLogout(Resource):
    @jwt_required
    def post(self):
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        user_id = get_jwt_identity()
        BLACKLIST.add(jti)
        # Delete the cookie
        resp = jsonify({'logout': True,"message": "User <id={}> successfully logged out.".format(user_id)})
        
        unset_jwt_cookies(resp)
        return resp

class EditUser(Resource):
     # Edit a post- take form data
    @classmethod
    @jwt_required
    def post(cls):
        print("Coming in from a post request")
        data=request.form.to_dict()

        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        user=UserModel.find_by_id(uid)

        # Editable fields
        params={
        'username':user.username,
        'password':user.password,
        'name':user.name}
        if 'username' in data:
            if UserModel.checkusername(data['username']):
                if user.username != data['username']:
                    return {"message":"Username Taken"},403


        if user.user_id==uid:

            for key in params:
                if key in data:
                    setattr(user,key,data[key])
                else:
                    setattr(user,key,params[key])
                db.db.session.commit()
        else:
            resp={"message":"Not Authoirized"}
            return resp,403
        return user.json()
    
    @classmethod
    @jwt_required
    def put(cls):

        data=request.form.to_dict()

        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        user=UserModel.find_by_id(uid)

        # Editable fields
        params={
        'username':user.username,
        'password':user.password,
        'name':user.name}
        if 'username' in data:
            if UserModel.checkusername(data['username']):
                if user.username != data['username']:
                    return {"message":"Username Taken"},403

        if user.user_id==uid:

            for key in params:
                if key in data:
                    setattr(user,key,data[key])
                else:
                    setattr(user,key,params[key])
                db.db.session.commit()
        else:
            resp={"message":"Not Authoirized"}
            return resp,403
        return user.json()

class TokenRefresh(Resource):
    @jwt_refresh_token_required
    def post(self):
        current_user = get_jwt_identity()
        new_token = create_access_token(identity=current_user, fresh=False)
        return {"access_token": new_token}, 200