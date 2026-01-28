def calculate_lqi(scores):
    """
    Deterministic Locality Quality Index calculator
    """
    return round(
        (scores.get('safety', 0) * 0.25) +
        (scores.get('connectivity', 0) * 0.20) +
        (scores.get('lifestyle', 0) * 0.20) +
        (scores.get('affordability', 0) * 0.15) +
        (scores.get('growth', 0) * 0.20)
    )
