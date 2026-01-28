from flask import Blueprint, jsonify
from backend.utils.db import get_db_connection
from backend.utils.geo import classify_distance, haversine_distance

locality_facilities_bp = Blueprint(
    'locality_facilities',
    __name__,
    url_prefix='/api/locality'
)

@locality_facilities_bp.route('/<int:locality_id>/facilities', methods=['GET'])
def locality_facilities(locality_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # 1️⃣ Get locality coordinates
    cursor.execute(
        "SELECT latitude, longitude FROM localities WHERE id = %s",
        (locality_id,)
    )
    locality = cursor.fetchone()

    if not locality:
        return jsonify({})

    lat1, lon1 = locality['latitude'], locality['longitude']

    # 2️⃣ Fetch facilities WITHOUT distance_km
    cursor.execute("""
        SELECT name, type, latitude, longitude
        FROM facilities
        WHERE locality_id = %s
    """, (locality_id,))

    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    summary = {}

    for f in rows:
        distance = haversine_distance(
            lat1, lon1,
            f['latitude'], f['longitude']
        )
        band = classify_distance(distance)
        key = f"{f['type']} ({band})"
        summary[key] = summary.get(key, 0) + 1

    return jsonify(summary)
