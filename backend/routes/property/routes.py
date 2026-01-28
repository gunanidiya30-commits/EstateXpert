from flask import Blueprint, request, jsonify, session, render_template, redirect, current_app
from backend.utils.db import get_db_connection
import os
from werkzeug.utils import secure_filename

property_bp = Blueprint("property", __name__, url_prefix="/properties")

# -------------------------------------------------
# IMAGE UPLOAD HELPER
# -------------------------------------------------
def get_upload_folder():
    upload_folder = os.path.join(
        current_app.root_path,
        "static",
        "images",
        "properties"
    )
    os.makedirs(upload_folder, exist_ok=True)
    return upload_folder

# -------------------------------------------------
# CREATE PROPERTY (HTML FORM → POST)
# -------------------------------------------------
@property_bp.route("", methods=["POST"])
def create_property():
    if "user_id" not in session:
        return jsonify({"error": "Authentication required"}), 401

    if session.get("role") != "seller":
        return jsonify({"error": "Only sellers can create properties"}), 403

    data = request.form
    required_fields = [
        "title", "description", "price", "area_sqft",
        "bhk", "property_type", "city", "locality"
    ]

    for field in required_fields:
        if not data.get(field):
            return jsonify({"error": f"{field} is required"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(
        """
        INSERT INTO properties
        (title, description, price, area_sqft, bhk, property_type,
         city, locality, latitude, longitude, owner_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """,
        (
            data["title"],
            data["description"],
            data["price"],
            data["area_sqft"],
            data["bhk"],
            data["property_type"],
            data["city"],
            data["locality"],
            data.get("latitude"),
            data.get("longitude"),
            session["user_id"]
        )
    )

    property_id = cursor.lastrowid

    # 🖼️ MULTIPLE IMAGE UPLOAD
    images = request.files.getlist("images")
    upload_folder = get_upload_folder()

    for image in images:
        if image and image.filename:
            filename = secure_filename(image.filename)
            file_path = os.path.join(upload_folder, filename)
            image.save(file_path)

            db_path = f"static/images/properties/{filename}"

            cursor.execute(
                """
                INSERT INTO property_images (property_id, image_path)
                VALUES (%s, %s)
                """,
                (property_id, db_path)
            )

    conn.commit()
    cursor.close()
    conn.close()

    return redirect("/properties/browse")

# -------------------------------------------------
# EDIT PROPERTY PAGE (HTML)
# -------------------------------------------------
@property_bp.route("/<int:property_id>/edit", methods=["GET"])
def edit_property_page(property_id):
    if "user_id" not in session or session.get("role") != "seller":
        return redirect("/dashboard")

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM properties WHERE id=%s AND owner_id=%s",
        (property_id, session["user_id"])
    )
    property = cursor.fetchone()

    cursor.close()
    conn.close()

    if not property:
        return redirect("/dashboard")

    return render_template("property_edit.html", property=property)

# -------------------------------------------------
# UPDATE PROPERTY (HTML FORM → POST)
# -------------------------------------------------
@property_bp.route("/<int:property_id>/update", methods=["POST"])
def update_property_form(property_id):
    if "user_id" not in session or session.get("role") != "seller":
        return redirect("/dashboard")

    data = request.form
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT owner_id FROM properties WHERE id=%s",
        (property_id,)
    )
    row = cursor.fetchone()

    if not row or row["owner_id"] != session["user_id"]:
        cursor.close()
        conn.close()
        return redirect("/dashboard")

    cursor.execute(
        """
        UPDATE properties
        SET title=%s, description=%s, price=%s,
            area_sqft=%s, bhk=%s, property_type=%s,
            city=%s, locality=%s
        WHERE id=%s
        """,
        (
            data.get("title"),
            data.get("description"),
            data.get("price"),
            data.get("area_sqft"),
            data.get("bhk"),
            data.get("property_type"),
            data.get("city"),
            data.get("locality"),
            property_id
        )
    )

    # 🖼️ ADD MORE IMAGES (append-only)
    images = request.files.getlist("images")
    upload_folder = get_upload_folder()

    for image in images:
        if image and image.filename:
            filename = secure_filename(image.filename)
            file_path = os.path.join(upload_folder, filename)
            image.save(file_path)

            db_path = f"static/images/properties/{filename}"

            cursor.execute(
                """
                INSERT INTO property_images (property_id, image_path)
                VALUES (%s, %s)
                """,
                (property_id, db_path)
            )

    conn.commit()
    cursor.close()
    conn.close()

    return redirect(f"/properties/{property_id}")

# -------------------------------------------------
# LIST PROPERTIES (API)
# -------------------------------------------------
@property_bp.route("", methods=["GET"])
def list_properties():
    city = request.args.get("city")
    min_price = request.args.get("min_price")
    max_price = request.args.get("max_price")
    bhk = request.args.get("bhk")
    property_type = request.args.get("property_type")

    query = """
        SELECT id, title, price, area_sqft, bhk,
               property_type, city, locality, created_at
        FROM properties WHERE 1=1
    """
    params = []

    if city:
        query += " AND city=%s"
        params.append(city)
    if property_type:
        query += " AND property_type=%s"
        params.append(property_type)
    if bhk:
        query += " AND bhk=%s"
        params.append(bhk)
    if min_price:
        query += " AND price >= %s"
        params.append(min_price)
    if max_price:
        query += " AND price <= %s"
        params.append(max_price)

    query += " ORDER BY created_at DESC"

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query, tuple(params))
    properties = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(properties), 200

# -------------------------------------------------
# BROWSE PAGE (HTML)
# -------------------------------------------------
@property_bp.route("/browse", methods=["GET"])
def browse_properties():
    city = request.args.get("city")
    min_price = request.args.get("min_price")
    max_price = request.args.get("max_price")
    bhk = request.args.get("bhk")
    property_type = request.args.get("property_type")

    query = """
        SELECT id, title, price, bhk, property_type, city, locality
        FROM properties WHERE 1=1
    """
    params = []

    if city:
        query += " AND city=%s"
        params.append(city)
    if property_type:
        query += " AND property_type=%s"
        params.append(property_type)
    if bhk:
        query += " AND bhk=%s"
        params.append(bhk)
    if min_price:
        query += " AND price >= %s"
        params.append(min_price)
    if max_price:
        query += " AND price <= %s"
        params.append(max_price)

    query += " ORDER BY created_at DESC"

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query, tuple(params))
    properties = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("property_list.html", properties=properties)

# -------------------------------------------------
# PROPERTY DETAIL (HTML)
# -------------------------------------------------
@property_bp.route("/<int:property_id>", methods=["GET"])
def property_detail(property_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Fetch property
    cursor.execute(
        "SELECT * FROM properties WHERE id=%s",
        (property_id,)
    )
    property = cursor.fetchone()

    if not property:
        cursor.close()
        conn.close()
        return "Property not found", 404

    # Fetch property images
    cursor.execute(
        """
        SELECT image_url
        FROM property_images
        WHERE property_id = %s
        ORDER BY id ASC
        """,
        (property_id,)
    )
    images = cursor.fetchall()

    # Favorite state
    is_favorite = False
    if "user_id" in session:
        cursor.execute(
            """
            SELECT id FROM favorites
            WHERE user_id = %s AND property_id = %s
            """,
            (session["user_id"], property_id)
        )
        is_favorite = cursor.fetchone() is not None

    # -------------------------------------------------
    # MODULE 3 — LOCALITY SNAPSHOT (SCHEMA SAFE)
    # -------------------------------------------------
    locality = None

    if property.get("locality_id"):
        # Fetch locality
        cursor.execute(
            """
            SELECT id, name, lqi
            FROM localities
            WHERE id = %s
            """,
            (property["locality_id"],)
        )
        loc = cursor.fetchone()

        if loc:
            # Facility count
            cursor.execute(
                """
                SELECT COUNT(*) AS cnt
                FROM facilities
                WHERE locality_id = %s
                """,
                (loc["id"],)
            )
            facility_count = cursor.fetchone()["cnt"]

            # LQI label (derived, NOT stored)
            lqi = loc["lqi"] or 0
            if lqi >= 75:
                label = "Excellent"
            elif lqi >= 50:
                label = "Average"
            else:
                label = "Poor"

            locality = {
                "id": loc["id"],
                "name": loc["name"],
                "lqi_score": float(lqi),
                "lqi_label": label,
                "facility_count": facility_count
            }

    cursor.close()
    conn.close()

    return render_template(
        "property_detail.html",
        property=property,
        images=images,
        is_favorite=is_favorite,
        locality=locality
    )


# -------------------------------------------------
# CREATE PAGE (HTML)
# -------------------------------------------------
@property_bp.route("/create", methods=["GET"])
def create_property_page():
    if "user_id" not in session or session.get("role") != "seller":
        return redirect("/dashboard")
    return render_template("property_create.html")

# -------------------------------------------------
# DELETE PROPERTY (API)
# -------------------------------------------------
@property_bp.route("/<int:property_id>", methods=["DELETE"])
def delete_property_api(property_id):
    if "user_id" not in session or session.get("role") != "seller":
        return jsonify({"error": "Unauthorized"}), 403

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT owner_id FROM properties WHERE id=%s",
        (property_id,)
    )
    row = cursor.fetchone()

    if not row or row["owner_id"] != session["user_id"]:
        cursor.close()
        conn.close()
        return jsonify({"error": "Unauthorized"}), 403

    cursor.execute("DELETE FROM properties WHERE id=%s", (property_id,))
    conn.commit()

    cursor.close()
    conn.close()

    return jsonify({"message": "Property deleted"}), 200

# -------------------------------------------------
# DELETE PROPERTY (HTML FORM)
# -------------------------------------------------
@property_bp.route("/<int:property_id>/delete", methods=["POST"])
def delete_property_form(property_id):
    if "user_id" not in session or session.get("role") != "seller":
        return redirect("/dashboard")

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(
        "DELETE FROM properties WHERE id=%s AND owner_id=%s",
        (property_id, session["user_id"])
    )

    conn.commit()
    cursor.close()
    conn.close()

    return redirect("/properties/browse")

# -------------------------------------------------
# CONTACT OWNER
# -------------------------------------------------
@property_bp.route("/<int:property_id>/contact", methods=["POST"])
def contact_property_owner(property_id):
    if "user_id" not in session:
        return jsonify({"error": "Authentication required"}), 401

    message = request.form.get("message")
    if not message:
        return jsonify({"error": "Message required"}), 400

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT owner_id FROM properties WHERE id=%s",
        (property_id,)
    )
    row = cursor.fetchone()

    if not row:
        cursor.close()
        conn.close()
        return jsonify({"error": "Property not found"}), 404

    cursor.execute(
        """
        INSERT INTO property_contacts
        (property_id, sender_id, owner_id, message)
        VALUES (%s, %s, %s, %s)
        """,
        (property_id, session["user_id"], row["owner_id"], message)
    )

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"message": "Inquiry sent"}), 201

# -------------------------------------------------
# COMPARE PROPERTY (FORM HANDLER → REDIRECT)
# -------------------------------------------------
@property_bp.route("/compare", methods=["POST"])
def compare_properties_redirect():
    compare_ids = request.form.getlist("compare_ids")

    if len(compare_ids) < 2 or len(compare_ids) > 4:
        return redirect("/properties/favorites")

    ids_param = ",".join(compare_ids)
    return redirect(f"/properties/compare?ids={ids_param}")

# -------------------------------------------------
# COMPARE PROPERTY (HTML FORM)
# -------------------------------------------------

@property_bp.route("/compare", methods=["GET"])
def compare_properties_page():
    ids = request.args.get("ids")

    if not ids:
        return redirect("/properties/browse")

    id_list = ids.split(",")

    placeholders = ",".join(["%s"] * len(id_list))

    query = f"""
        SELECT
            id,
            title,
            price,
            area_sqft,
            bhk,
            property_type,
            city,
            locality
        FROM properties
        WHERE id IN ({placeholders})
    """

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query, tuple(id_list))

    properties = cursor.fetchall()

    cursor.close()
    conn.close()

    if len(properties) < 2:
        return render_template(
        "property_compare.html",
        properties=[],
        error="Select at least two properties to compare."
    )

    return render_template("property_compare.html", properties=properties)

# -------------------------------------------------
# FAVORITES PROPERTY (HTML FORM)
# -------------------------------------------------
@property_bp.route("/favorites", methods=["GET"])
def favorites_page():
    if "user_id" not in session:
        return redirect("/login")

    city = request.args.get("city")
    min_price = request.args.get("min_price")
    max_price = request.args.get("max_price")
    bhk = request.args.get("bhk")
    property_type = request.args.get("property_type")

    query = """
        SELECT p.id, p.title, p.price, p.bhk,
               p.property_type, p.city, p.locality
        FROM favorites f
        JOIN properties p ON f.property_id = p.id
        WHERE f.user_id = %s
    """
    params = [session["user_id"]]

    if city:
        query += " AND p.city=%s"
        params.append(city)
    if property_type:
        query += " AND p.property_type=%s"
        params.append(property_type)
    if bhk:
        query += " AND p.bhk=%s"
        params.append(bhk)
    if min_price:
        query += " AND p.price >= %s"
        params.append(min_price)
    if max_price:
        query += " AND p.price <= %s"
        params.append(max_price)

    query += " ORDER BY p.created_at DESC"

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query, tuple(params))
    favorites = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("favorites.html", favorites=favorites)


@property_bp.route("/favorites/add/<int:property_id>", methods=["POST"])
def add_favorite(property_id):
    if "user_id" not in session:
        return redirect("/login")

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(
        """
        SELECT id FROM favorites
        WHERE user_id = %s AND property_id = %s
        """,
        (session["user_id"], property_id)
    )

    if not cursor.fetchone():
        cursor.execute(
            """
            INSERT INTO favorites (user_id, property_id)
            VALUES (%s, %s)
            """,
            (session["user_id"], property_id)
        )
        conn.commit()

    cursor.close()
    conn.close()

    return redirect(f"/properties/{property_id}")

@property_bp.route("/favorites/remove/<int:property_id>", methods=["POST"])
def remove_favorite(property_id):
    if "user_id" not in session:
        return redirect("/login")

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(
        """
        DELETE FROM favorites
        WHERE user_id = %s AND property_id = %s
        """,
        (session["user_id"], property_id)
    )

    conn.commit()
    cursor.close()
    conn.close()

    return redirect(f"/properties/{property_id}")

# -------------------------------------------------
# MY PROPERTIES (SELLER HTML)
# -------------------------------------------------
@property_bp.route("/mine", methods=["GET"])
def my_properties_page():
    if "user_id" not in session or session.get("role") != "seller":
        return redirect("/dashboard")

    city = request.args.get("city")
    min_price = request.args.get("min_price")
    max_price = request.args.get("max_price")
    bhk = request.args.get("bhk")
    property_type = request.args.get("property_type")

    query = """
        SELECT id, title, price, bhk,
               property_type, city, locality
        FROM properties
        WHERE owner_id = %s
    """
    params = [session["user_id"]]

    if city:
        query += " AND city=%s"
        params.append(city)
    if property_type:
        query += " AND property_type=%s"
        params.append(property_type)
    if bhk:
        query += " AND bhk=%s"
        params.append(bhk)
    if min_price:
        query += " AND price >= %s"
        params.append(min_price)
    if max_price:
        query += " AND price <= %s"
        params.append(max_price)

    query += " ORDER BY created_at DESC"

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query, tuple(params))
    properties = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("properties_mine.html", properties=properties)
