# Post Model- for Posts/Requests made
from db import db
from models.user import UserModel
from flask import jsonify
import json as js
class PostModel(db.Model):
    __tablename__ = "posts"
    
    post_id=db.Column(db.Integer,primary_key=True)
    user_id=db.Column(db.Integer,db.ForeignKey("users.user_id"))#Foreign Key to users
    #location_id=db.Column(db.Integer)# Undefined for now
    title=db.Column(db.String(1000))
    body=db.Column(db.Text)
    start_date=db.Column(db.DateTime)
    end_date=db.Column(db.DateTime)
    active=db.Column(db.Integer)
    request_status=db.Column(db.Text)
    
    def __init__(self,user_id,title,body,start_date,end_date,active,request_status):
        self.user_id=user_id
        self.title=title
        self.body=body
        self.start_date=start_date
        self.end_date=end_date
        self.active=active
        self.request_status=request_status
    
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
        "request status":self.request_status}
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

    