from flask import Blueprint, jsonify
from backend.utils.db import get_db_connection
from backend.utils.geo import haversine_distance

locality_profile_bp = Blueprint(
    'locality_profile',
    __name__,
    url_prefix='/api/locality'
)

@locality_profile_bp.route('/<int:locality_id>', methods=['GET'])
def get_locality_profile(locality_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # 1️⃣ Fetch locality
    cursor.execute("""
        SELECT id, name, latitude, longitude, lqi
        FROM localities
        WHERE id = %s
    """, (locality_id,))
    locality = cursor.fetchone()

    if not locality:
        cursor.close()
        conn.close()
        return jsonify({"error": "Locality not found"}), 404

    # 2️⃣ Fetch facilities
    cursor.execute("""
        SELECT type, latitude, longitude
        FROM facilities
        WHERE latitude IS NOT NULL AND longitude IS NOT NULL
    """)
    facilities = cursor.fetchall()

    # 3️⃣ Facility aggregation
    summary = {
        "school": {"count": 0, "nearest_km": None},
        "hospital": {"count": 0, "nearest_km": None},
        "metro": {"count": 0, "nearest_km": None}
    }

    if locality["latitude"] and locality["longitude"]:
        for f in facilities:
            f_type = f["type"]
            if f_type not in summary:
                continue

            summary[f_type]["count"] += 1

            d = haversine_distance(
                locality["latitude"], locality["longitude"],
                f["latitude"], f["longitude"]
            )

            if summary[f_type]["nearest_km"] is None or d < summary[f_type]["nearest_km"]:
                summary[f_type]["nearest_km"] = d

    # 4️⃣ LQI explanation (deterministic)
    if locality["lqi"] >= 80:
        lqi_label = "Excellent"
        lqi_reason = "High livability with strong infrastructure access"
    elif locality["lqi"] >= 60:
        lqi_label = "Good"
        lqi_reason = "Balanced locality with acceptable amenities"
    else:
        lqi_label = "Average"
        lqi_reason = "Limited access to amenities or infrastructure gaps"

    cursor.close()
    conn.close()

    return jsonify({
        "id": locality["id"],
        "name": locality["name"],
        "lqi": {
            "score": locality["lqi"],
            "label": lqi_label,
            "explanation": lqi_reason
        },
        "facilities": summary,
        "data_freshness": {
    "source": "localities + facilities tables",
    "note": "Scores are derived from latest available records"
}

    })
