from flask import Blueprint, render_template
from flask import session, redirect


pages_bp = Blueprint("pages", __name__)

@pages_bp.route("/login")
def login_page():
    return render_template("login.html")


@pages_bp.route("/register")
def register_page():
    return render_template("register.html")

@pages_bp.route("/contact")
def contact():
    return render_template("contact.html")

