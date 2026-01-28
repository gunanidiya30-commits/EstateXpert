from flask import Flask, render_template
from backend.routes.auth import auth_bp
from backend.routes.pages import pages_bp
from backend.routes.property.routes import property_bp
from backend.routes.dashboard import dashboard_bp
from backend.routes.locality_analytics import locality_analytics_bp
from backend.routes.maps import maps_bp
from backend.routes.localities import localities_bp
from backend.routes.locality_facilities import locality_facilities_bp
from backend.routes.locality_profile import locality_profile_bp




def create_app():
    app = Flask(__name__)

    app.config.from_object('backend.config.Config')
    app.secret_key = app.config['SECRET_KEY']

    app.register_blueprint(auth_bp)
    app.register_blueprint(pages_bp)
    app.register_blueprint(property_bp)
    app.register_blueprint(dashboard_bp)
    app.register_blueprint(locality_analytics_bp)
    app.register_blueprint(maps_bp)
    app.register_blueprint(localities_bp)
    app.register_blueprint(locality_facilities_bp)
    app.register_blueprint(locality_profile_bp)

    
    @app.route('/')
    def home():
        return render_template('home.html')

    
    return app

if __name__ == "__main__":
    app = create_app()
    app.run(debug=True)
