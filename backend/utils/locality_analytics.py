# 3E.5: Locality analytics utility (DB → R → PNG)

from backend.utils.db import get_db_connection
from backend.utils.r_analytics import generate_price_trend_chart
import os

def get_last_3_year_prices(locality_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        """
        SELECT year, avg_price
        FROM locality_price_trends
        WHERE locality_id = %s
        ORDER BY year ASC
        LIMIT 3
        """,
        (locality_id,)
    )

    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    if len(rows) < 3:
        return None

    return [row['avg_price'] for row in rows]


def build_locality_price_chart(locality_id):
    prices = get_last_3_year_prices(locality_id)
    if not prices:
        return None

    output_dir = os.path.join(
        os.path.dirname(__file__),
        "..",
        "static",
        "images"
    )
    output_dir = os.path.abspath(output_dir)

    return generate_price_trend_chart(locality_id, prices, output_dir)
