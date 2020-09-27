connection_string='mysql://root:root@localhost/buyherdrink'

SQLALCHEMY_DATABASE_URI=connection_string
SQLALCHEMY_TRACK_MODIFICATIONS= False

# For API and auth tokens
PROPAGATE_EXCEPTIONS = True
JWT_BLACKLIST_ENABLED = True  # enable blacklist feature
JWT_BLACKLIST_TOKEN_CHECKS = [
    "access",
    "refresh",
]  # allow blacklisting for access and refresh tokens
JWT_SECRET_KEY='TestingMagic'
JWT_TOKEN_LOCATION = ['cookies']
JWT_COOKIE_CSRF_PROTECT = False
