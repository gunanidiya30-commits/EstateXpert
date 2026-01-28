from flask import Blueprint, jsonify
from backend.utils.db import get_db_connection
from backend.utils.geo import haversine_distance

localities_bp = Blueprint(
    'localities',
    __name__,
    url_prefix='/api/localities'
)

@localities_bp.route('', methods=['GET'])
def get_localities():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # 1️⃣ Fetch localities
    cursor.execute("""
        SELECT
            l.id,
            l.name,
            l.latitude,
            l.longitude,
            l.lqi
        FROM localities l
        WHERE l.latitude IS NOT NULL
          AND l.longitude IS NOT NULL
    """)
    localities = cursor.fetchall()

    # 2️⃣ Fetch facilities
    cursor.execute("""
        SELECT
            id,
            name,
            type,
            latitude,
            longitude
        FROM facilities
    """)
    facilities = cursor.fetchall()

    # 3️⃣ Compute nearest facility distances (≤ 5 km)
    for loc in localities:
        distances = {
            'school': None,
            'hospital': None,
            'metro': None
        }

        for f in facilities:
            d = haversine_distance(
                loc['latitude'],
                loc['longitude'],
                f['latitude'],
                f['longitude']
            )

            if d is not None and d <= 5:
                key = f['type']
                if key in distances:
                    if distances[key] is None or d < distances[key]:
                        distances[key] = d

        loc['distances'] = distances

    cursor.close()
    conn.close()

    return jsonify(localities)
