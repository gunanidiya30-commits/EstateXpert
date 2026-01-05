from flask import Flask
from backend.routes.auth import auth_bp

def create_app():
    app = Flask(__name__)

    app.config.from_object('backend.config.Config')
    app.secret_key = app.config['SECRET_KEY']

    app.register_blueprint(auth_bp)

    @app.route('/')
    def health_check():
        return "EstateXpert backend running"

    return app
