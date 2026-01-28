# 3E.6: Locality analytics blueprint

from flask import Blueprint, jsonify
from backend.utils.locality_analytics import build_locality_price_chart

locality_analytics_bp = Blueprint(
    'locality_analytics',
    __name__,
    url_prefix='/api/locality'
)

@locality_analytics_bp.route('/<int:locality_id>/price-trend', methods=['GET'])
def locality_price_trend(locality_id):
    chart_path = build_locality_price_chart(locality_id)

    if not chart_path:
        return jsonify({
            'status': 'error',
            'message': 'Insufficient price data'
        }), 400

    return jsonify({
        'status': 'success',
        'chart': chart_path.replace('\\', '/')
    })
