# User Model
from db import db
from dataclasses import dataclass
from flask import jsonify

class UserModel(db.Model):
    __tablename__ = "users"
    user_id=db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(64),unique=True)
    password=db.Column(db.String(80))
    name=db.Column(db.String(100))
    # Mohammed requested additions
    email=db.Column(db.String(80))
    age=db.Column(db.Integer)
    phone=db.Column(db.String(11))
    sex_orientation=db.Column(db.String(80)) # sexual orientation -> DB values (striaght, gey, bi, prefer not to say)
    address=db.Column(db.String(500)) # a string of format "260 Manning Blvd, Albany New York,  USA 12206"
                                      # street, town, city, country, zipcode
    interests=db.Column(db.String(80)) # (Male, Female, Both)


    def __init__(self):
        pass
    def __init__(self,username,password,name):
        self.username=username
        self.password=password
        self.name=name
        self.email="Not Specified"
        self.age=0
        self.phone="None"
        self.sex_orientation="Not Specified"
        self.address="Not Specified"
        self.interests="Not Specified"

    def __init__(self,username,password,name,email,age,phone,sex_orientation,address,interests):
        self.username=username
        self.password=password
        self.name=name
        self.email=email if email else "Not Specified"
        self.age=age if age else 0
        self.phone=phone if phone else "None"
        self.sex_orientation=sex_orientation if sex_orientation else "Not Specified"
        self.address=address if address else "Not Specified"
        self.interests=interests if interests else "Not Specified"
    def json(self):
        #ufixed={c.name:getattr(user,c.name) for c in user.__table__.columns}
        return {"id": self.user_id, 
        "username": self.username,
        "name":self.name,
        "email":self.email,
        "age":self.age,
        "phone":self.phone,
        "sex_orientation":self.sex_orientation,
        "address":self.address,
        "interests":self.interests}
    @classmethod
    def alljson(cls):
        return jsonify(cls.asdict())
    @classmethod
    def find_by_username(cls,username):
        return cls.query.filter_by(username=username).first()
    
    @classmethod
    def find_by_id(cls, _id):
        return cls.query.filter_by(user_id=_id).first()

    @classmethod
    def find_by_name(cls, _name):
        return cls.query.filter_by(name=_name).first()

    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
    @classmethod
    def find_all(cls):
        return cls.query.all()
    @classmethod
    def checkusername(cls,username):
        exists = cls.query.filter_by(username=username).scalar()
        return exists