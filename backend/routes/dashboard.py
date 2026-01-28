# backend/routes/dashboard.py

from flask import Blueprint, render_template, session, redirect, url_for
from backend.utils.db import get_db_connection

dashboard_bp = Blueprint('dashboard', __name__)

@dashboard_bp.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('auth.login'))

    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
from flask import Blueprint, render_template, session, redirect, url_for
from backend.utils.db import get_db_connection

dashboard_bp = Blueprint('dashboard', __name__)

@dashboard_bp.route('/dashboard')
def dashboard():

    # ✅ AUTH GUARD (FIXED PROPERLY)
    if 'user_id' not in session:
        return redirect(url_for('pages.login_page'))

    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    user_id = session['user_id']
    user_name = session.get('user_name')
    user_role = session.get('role')

    # Safe, read-only counts
    cursor.execute("SELECT COUNT(*) AS count FROM properties")
    total_properties = cursor.fetchone()['count']

    my_properties_count = None
    favorites_count = None

    if user_role == 'seller':
        cursor.execute(
            "SELECT COUNT(*) AS count FROM properties WHERE owner_id = %s",
            (user_id,)
        )
        my_properties_count = cursor.fetchone()['count']

    if user_role in ('buyer', 'investor'):
        cursor.execute(
            "SELECT COUNT(*) AS count FROM favorites WHERE user_id = %s",
            (user_id,)
        )
        favorites_count = cursor.fetchone()['count']

    return render_template(
        'dashboard.html',
        user_name=user_name,
        user_role=user_role,
        total_properties=total_properties,
        my_properties_count=my_properties_count,
        favorites_count=favorites_count
    )

    user_id = session['user_id']
    user_name = session.get('user_name')
    user_role = session.get('role')

    # Safe, read-only counts
    cursor.execute("SELECT COUNT(*) AS count FROM properties")
    total_properties = cursor.fetchone()['count']

    my_properties_count = None
    favorites_count = None

    if user_role == 'seller':
        cursor.execute(
            "SELECT COUNT(*) AS count FROM properties WHERE owner_id = %s",
            (user_id,)
        )
        my_properties_count = cursor.fetchone()['count']

    if user_role in ('buyer', 'investor'):
        cursor.execute(
            "SELECT COUNT(*) AS count FROM favorites WHERE user_id = %s",
            (user_id,)
        )
        favorites_count = cursor.fetchone()['count']

    return render_template(
        'dashboard.html',
        user_name=user_name,
        user_role=user_role,
        total_properties=total_properties,
        my_properties_count=my_properties_count,
        favorites_count=favorites_count
    )
