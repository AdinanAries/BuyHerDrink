from ma import ma
from models.offers import OfferModel

class OfferSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model=OfferModel
        load_only=("offer_datetime",)
        #dump_only=("offer_datetime")
        load_instance = True 
        include_fk=True