from flask_restful import Resource, reqparse
from werkzeug.security import safe_str_cmp
from flask_jwt_extended import (
    create_access_token,
    create_refresh_token,
    jwt_refresh_token_required,
    get_jwt_identity,
    jwt_required,
    get_raw_jwt,
)
from flask import jsonify, make_response
from models.posts import PostModel
import datetime
# View all posts
class AllPosts(Resource):
    @classmethod
    def get(cls):
        posts = [post.json() for post in PostModel.find_all_posts()]
        return {"posts":posts}
# View, edit, delete, posts for a user.    
class Post(Resource):

    @classmethod
    @jwt_required
    def get(cls):
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        try:
            posts = [post.json() for post in PostModel.find_user_posts(uid)]
        except:
            posts="None Found"
        print(posts)
        return {"posts":posts}


class PostRegister(Resource):
 
    @classmethod
    @jwt_required
    def post(cls):
        from models.user import UserModel
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        _post_parser = reqparse.RequestParser()
        
        _post_parser.add_argument(
        "user_id", type=str, help="Enter a title",default=get_jwt_identity())
        
        _post_parser.add_argument(
        "title", type=str, help="Enter a title",default="Blank")

        _post_parser.add_argument(
        "body", type=str, help="Enter a message", default="Body Message")
        
        _post_parser.add_argument(
        "start_date", type=str,  help="Enter a start date",default=str(datetime.date.today()))
        
        _post_parser.add_argument(
        "end_date", type=str,help="Enter a start date",default=datetime.date.today())

        _post_parser.add_argument(
        "start_date", type=str,  help="Enter a start date",default=datetime.date.today())

        _post_parser.add_argument(
        "active", type=int, help="This field cannot be blank.",default=0)

        _post_parser.add_argument(
        "request_status", type=str,  help="Enter the name please.",default="Pending")
        data = _post_parser.parse_args()
        print(data)
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()

        if not UserModel.find_by_id(uid):
            return {"message": "User not found"}, 400

        post = PostModel(**data)
        post.save_to_db()

        return {"message": "Post created successfully."}, 201
