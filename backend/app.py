from flask import Flask, render_template
from backend.routes.auth import auth_bp
from backend.routes.pages import pages_bp

def create_app():
    app = Flask(__name__)

    app.config.from_object('backend.config.Config')
    app.secret_key = app.config['SECRET_KEY']

    app.register_blueprint(auth_bp)
    app.register_blueprint(pages_bp)


    
    @app.route('/')
    def health_check():
        return "EstateXpert backend running"

    return app
