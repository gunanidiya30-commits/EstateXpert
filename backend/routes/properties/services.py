# Property business logic will live here
from backend.db import get_db_connection

def create_property(owner_id, data):
    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        INSERT INTO properties
        (owner_id, title, price, city, area, type, bhk, description)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """

    values = (
        owner_id,
        data["title"],
        data["price"],
        data["city"],
        data["area"],
        data["type"],
        data["bhk"],
        data.get("description")
    )

    cursor.execute(query, values)
    conn.commit()

    property_id = cursor.lastrowid

    cursor.close()
    conn.close()

    return property_id
