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
from flask import jsonify, make_response,request
from models.posts import PostModel
import datetime
import db
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
   
class EditPost(Resource):
     # Edit a post- take form data
    @classmethod
    @jwt_required
    def put(cls):
        data=request.form.to_dict()
        if 'id' not in data:
            resp={"message":"Not Authoirized"}
            return resp,403
        print(data)
        post=PostModel.find_by_id(data['id'])
        if not post:
            resp={"message":"Not Authoirized"}
            return resp,403
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()
        
        # Editable fields
        params={
        'title':post.title,
        'body':post.body,
        'start_date':post.start_date,
        'end_date':post.end_date,
        'active':post.active}
        
        if post.user_id==uid:
            # post.body=data['body'] if 'body' in data else post.body
            for key in params:
                if key in data:
                    setattr(post,key,data[key])
                else:
                    setattr(post,key,params[key])
                db.db.session.commit()
        else:
            resp={"message":"Not Authoirized"}
            return resp,403
        return post.json()

class PostRegister(Resource):
 
    @classmethod
    @jwt_required
    def post(cls):
        data=request.form.to_dict()
        print(data)
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
