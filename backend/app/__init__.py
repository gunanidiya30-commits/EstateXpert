from flask import Flask

def create_app():
    app = Flask(__name__)

    # Basic configuration placeholder
    app.config.from_object('backend.app.config.Config')

    # Blueprint registrations will be added here in later modules
    from backend.app.routes import register_blueprints
    register_blueprints(app)

    return app
