# Offer Resource- Link and processing
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
from models.offers import OfferModel
from schemas.offers import OfferSchema
from datetime import datetime
from flask import request

offer_schema=OfferSchema()

class OfferRegister(Resource):
    @classmethod
    @jwt_required
    def post(cls):
        try:
            #jti = get_raw_jwt()["jti"]  # jti is "JWT ID", a unique identifier for a JWT.
            uid = get_jwt_identity()
            print(request.get_json())
            print(request)
            
            offer=offer_schema.load(request.form)
            offer.offer_datetime=datetime.now()
            offer.drink_offer_user_id=uid
            

        except Exception as e:
            print(e)
            return "Failed"
        offer.save_to_db()
        return offer_schema.dump(offer)
       # return {"status":"success","msg":"Your offer has been posted!"}
