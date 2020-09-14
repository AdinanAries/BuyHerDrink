from flask import Flask, jsonify, render_template, request, redirect
from flask_restful import Api
from flask_jwt_extended import JWTManager
from flask_sqlalchemy import SQLAlchemy
from db import connection_string

from blacklist import BLACKLIST

app = Flask(__name__)
#app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///data.db"
app.config['SQLALCHEMY_DATABASE_URI']=connection_string
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)
# For API and auth tokens
app.config["PROPAGATE_EXCEPTIONS"] = True
app.config["JWT_BLACKLIST_ENABLED"] = True  # enable blacklist feature
app.config["JWT_BLACKLIST_TOKEN_CHECKS"] = [
    "access",
    "refresh",
]  # allow blacklisting for access and refresh tokens
app.secret_key = "jose"  # could do app.config['JWT_SECRET_KEY'] if we prefer
api = Api(app)

@app.route('/')
@app.route("/index", methods=['GET','POST'])
def index():
    hello="Hello World"
    data={'Hello':'World'}
    test=db.engine.execute("SELECT COUNT(*) FROM posts;")
    print(test.fetchall())
    return render_template('index.html')



if __name__ == "__main__":
    #db.init_app(app)
    app.run(port=5000, debug=True)
