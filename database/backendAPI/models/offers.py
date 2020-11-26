# Offer Model
from db import db
from models.user import UserModel
from models.posts import PostModel

from flask import jsonify
import json as js
from sqlalchemy import cast

class OfferModel(db.Model):
    __tablename__ = "offers"
    drink_offer_id =db.Column(db.Integer,primary_key=True)
    drink_request_id =db.Column(db.Integer,db.ForeignKey("posts.user_id")) # Foreign Key to post offer made on- user who made post
    drink_offer_user_id =db.Column(db.Integer,db.ForeignKey("users.user_id")) # Foreign Key to User making offer
    drink_offer_msg =db.Column(db.String(80))
    drink_offer_bid_amount =db.Column(db.Integer)
    offer_datetime=db.Column(db.DateTime) # Datetime of when 
    
    # def __init__(self):
    #     pass
    # def __init__(drink_request_id,drink_offer_user_id,drink_offer_msg,drink_offer_bid_amount):
    #     self.drink_request_id=drink_request_id
    #     self.drink_offer_user_id=drink_offer_user_id
    #     self.drink_offer_msg=drink_offer_msg
    #     self.drink_offer_bid_amount=drink_offer_bid_amount
    @classmethod
    def find_by_offer_id(cls, _id):
        return cls.query.filter_by(drink_offer_id=_id).first()
    @classmethod
    def find_by_post_id(cls, _id):
        print("Looking for user posts")
        return cls.query.filter_by(drink_request_id=_id).all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()