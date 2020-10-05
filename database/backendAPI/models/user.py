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
    def __init__(self):
        pass
    def __init__(self,username,password,name):
        self.username=username
        self.password=password
        self.name=name

    def json(self):
        #ufixed={c.name:getattr(user,c.name) for c in user.__table__.columns}
        return {"id": self.user_id, "username": self.username,"name":self.name}
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