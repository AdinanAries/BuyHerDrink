# Post Model- for Posts/Requests made
from db import db
from models.user import UserModel
from flask import jsonify
import json as js
from sqlalchemy import cast
class PostModel(db.Model):
    __tablename__ = "posts"
    
    post_id=db.Column(db.Integer,primary_key=True)
    user_id=db.Column(db.Integer,db.ForeignKey("users.user_id"))#Foreign Key to users
    title=db.Column(db.String(1000))
    body=db.Column(db.Text)
    start_date=db.Column(db.DateTime) # Datetime for when date should start
    end_date=db.Column(db.DateTime)
    active=db.Column(db.Integer)
    request_status=db.Column(db.Text)
    #About the place-from Mohammad requests
    location_id=db.Column(db.String(3000))
    place_location=db.Column(db.String(500))
    place_name=db.Column(db.String(500))
    place_rating=db.Column(db.Integer)
    place_photo=db.Column(db.String(3000))
    place_icon=db.Column(db.String(3000))
    place_service_type=db.Column(db.String(300))
    #User's Town
    town=db.Column(db.String(500))

    def __init__(self,user_id,title,body,start_date,end_date,active,request_status,location_id,
                 place_location, place_name, place_rating,place_photo, place_icon, place_service_type,town):
        self.user_id=user_id
        self.title=title if title else "None Specified"
        self.body=body if body else "None Specified"
        self.start_date=start_date if start_date else "None Specified"
        self.end_date=end_date if end_date else "None Specified"
        self.active=active if active else 0
        self.request_status=request_status if request_status else "None Specified"

        self.location_id=location_id if location_id else "None Specified"
        self.place_location=place_location if place_location else "None Specified"
        self.place_name=place_name if place_name else "None Specified"
        self.place_rating=place_rating if place_rating else 0
        self.place_photo=place_photo if place_photo else "None Specified"
        self.place_icon=place_icon if place_icon else "None Specified"
        self.place_service_type=place_service_type if place_service_type else "None Specified"
        self.town=town if town else "None Specified"

    
    def json(self):
        print("JSON ing the thing")
        # return vars(self)
        post= {"post_id":self.post_id,
        "user_id":self.user_id,
        "title":self.title,
        "body":self.body,
        "start_date":str(self.start_date),
        "end_date":str(self.end_date),
        "active":self.active,
        "request status":self.request_status,
        "location_id":self.location_id,
        "place_location":self.place_location,
        "place_name":self.place_name,
        "place_rating":self.place_rating,
        "place_photo":self.place_photo,
        "place_icon":self.place_icon,
        "place_service_type":self.place_service_type,
        "requestee_town":self.town,
        "meeting_date":str(self.start_date.date()),
        "meeting_time":str(self.start_date.time())
        }
        #post={c.name:getattr(self,c.name) for c in self.__table__.columns}
        return post
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()
    
    # Search Queries using SQLaclhemy
    # Find Post by ID
    @classmethod
    def find_by_id(cls, _id):
        print("Looking for post with ID of "+str(_id))
        return cls.query.filter_by(post_id=_id).first()
    @classmethod
    def find_user_posts(cls, _id):
        print("Looking for user posts")
        return cls.query.filter_by(user_id=_id).all()
    @classmethod
    def find_all_posts(cls):
        print("Getting all posts")
        return cls.query.all()
    # Find Posts you can make offers on
    @classmethod
    def find_nearby_posts(cls,town,qry_offset=0):
        query=cls.query.filter_by(town=town).offset(qry_offset*10)
        #query=cls.query.filter_by(town=town).all()
        return query