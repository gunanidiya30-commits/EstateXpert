from flask import Blueprint, render_template

maps_bp = Blueprint(
    'maps',
    __name__,
    url_prefix='/maps'
)

@maps_bp.route('/localities')
def locality_map():
    return render_template('locality_map.html')
