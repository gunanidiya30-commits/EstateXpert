from flask import Blueprint

properties_bp = Blueprint(
    "properties",
    __name__,
    url_prefix="/properties"
)

from . import routes
