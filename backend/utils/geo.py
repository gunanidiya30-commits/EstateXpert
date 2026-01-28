# 3B.1: Haversine distance utility (km)

import math

def haversine_distance(lat1, lon1, lat2, lon2):
    """
    Calculate great-circle distance between two points (km).
    """
    if None in (lat1, lon1, lat2, lon2):
        return None

    R = 6371  # Earth radius in km

    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    d_phi = math.radians(lat2 - lat1)
    d_lambda = math.radians(lon2 - lon1)

    a = (
        math.sin(d_phi / 2) ** 2
        + math.cos(phi1) * math.cos(phi2) * math.sin(d_lambda / 2) ** 2
    )

    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    return round(R * c, 3)


# 3B.2: Distance band classification

def distance_band(distance_km):
    """
    Classify distance into bands.
    """
    if distance_km is None:
        return 'unknown'
    if distance_km <= 1:
        return 'walkable'
    if distance_km <= 5:
        return 'nearby'
    return 'far'

# Alias for semantic clarity in later modules
classify_distance = distance_band

# 3B.3: Property to facility distance calculator

from backend.utils.geo import haversine_distance, distance_band

def compute_property_facility_distances(property_lat, property_lng, facilities):
    """
    facilities: list of dicts with keys -> id, name, type, latitude, longitude
    """
    results = []

    for f in facilities:
        dist = haversine_distance(
            property_lat,
            property_lng,
            f.get('latitude'),
            f.get('longitude')
        )

        results.append({
            'facility_id': f.get('id'),
            'name': f.get('name'),
            'type': f.get('type'),
            'distance_km': dist,
            'band': distance_band(dist)
        })

    return results


