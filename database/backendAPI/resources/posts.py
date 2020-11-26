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
    @classmethod
    @jwt_required
    def post(cls):
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
        'active':post.active,
        'location_id':post.location_id,
        'place_location':post.place_location,
        'place_name':post.place_name,
        'place_rating':post.place_rating,
        'place_photo':post.place_photo,
        'place_icon':post.place_icon,
        'place_service_type':post.place_service_type,
        'town':post.town}
        
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
    
class FindNearbyPosts(Resource):
    # Takes city and offset, using defaults if not set
    @classmethod
    @jwt_required
    def get(cls):
        try:
            city=request.args.get('city')
            if city is None:
                raise Exception
            
        except Exception as e:
            return {"status":"Failed","message":"City not set"},400
        try:
            old_offset=request.args.get('offset')
            if old_offset is None:
                raise Exception
        except Exception as e:
            old_offset=-1
        try:
            old_offset=int(old_offset)
        except Exception as e:
            {"status":"Failed","message":"Number not supplied"},400
        new_offset=int(old_offset) + 1 #To get groups of 10

        uid = get_jwt_identity()
        # town,_id,qry_offset=0
        try:
            posts=[post.json() for post in PostModel.find_nearby_posts(city,old_offset) if post.user_id != uid]
            # old_offset=old_offset*10
            
            posts=posts[:10]

        except Exception as e:
            print(e)
            return {"status":"Failed","message":"Unknown Error occurred"}

        return {"seed":new_offset,"posts":posts}



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

        _post_parser.add_argument(
        "location_id", type=str,  help="Enter the name please.",default="Not Speced")
        _post_parser.add_argument(
        "place_location", type=str,  help="Enter the name please.",default="Not Speced")
        _post_parser.add_argument(
        "place_name", type=str,  help="Enter the name please.",default="Not Speced")
        _post_parser.add_argument(
        "place_rating", type=int,  help="Enter the name please.",default=0)

        _post_parser.add_argument(
        "place_photo", type=str,  help="Enter the name please.",default="Not Speced")

        _post_parser.add_argument(
        "place_icon", type=str,  help="Enter the name please.",default="Not Speced")

        _post_parser.add_argument(
        "place_service_type", type=str,  help="Enter the name please.",default="Not Speced")

        _post_parser.add_argument(
        "town", type=str,  help="Enter the name please.",default="Not Speced")
        data = _post_parser.parse_args()
        alldata=request.form.to_dict()
        
        if 'meeting_date' in alldata and 'meeting_time' in alldata:
            data['start_date']=alldata['meeting_date']+" "+alldata['meeting_time']
        
        print(data)
        jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
        uid = get_jwt_identity()

        if not UserModel.find_by_id(uid):
            return {"message": "User not found"}, 400

        post = PostModel(**data)
        post.save_to_db()
        
        return {"message": "Post created successfully."}, 201
