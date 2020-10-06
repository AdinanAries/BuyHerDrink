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
from models.posts import PostModel

from flask import jsonify, make_response,request,render_template
from dataclasses import dataclass
import db
import json

class Test_UserEdit(Resource):

    #Check if user is accessing a page they have edit rights on.
    @classmethod
    @jwt_required
    def get(cls):
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        user = UserModel.find_by_id(uid)
        headers={"X-HTTP-Method-Override": "PUT"}
        print("Gonna try to make a GET inot a PUT. Here Goes!")
        return make_response(render_template('edituser.html',data=user),200,headers)