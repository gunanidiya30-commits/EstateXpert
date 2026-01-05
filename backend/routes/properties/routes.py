from flask import request, session, jsonify, abort
from . import properties_bp
from .services import create_property



@properties_bp.route("/create", methods=["POST"])
def create():
    if "user_id" not in session:
        abort(401)

    if session.get("role") != "seller":
        abort(403)

    data = request.get_json()
    owner_id = session["user_id"]

    property_id = create_property(owner_id, data)

    return jsonify({
        "message": "Property created",
        "property_id": property_id
    }), 201

