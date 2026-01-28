# 3C.1: Locality scoring engine (deterministic)

def score_safety(facilities):
    """
    Proxy safety score based on hospital + transport presence.
    """
    hospital_count = sum(1 for f in facilities if f['type'] == 'hospital')
    transport_count = sum(1 for f in facilities if f['type'] == 'transport')

    score = (hospital_count * 20) + (transport_count * 15)
    return min(score, 100)


def score_connectivity(facilities):
    """
    Connectivity based on transport proximity.
    """
    walkable = sum(1 for f in facilities if f['type'] == 'transport' and f['band'] == 'walkable')
    nearby = sum(1 for f in facilities if f['type'] == 'transport' and f['band'] == 'nearby')

    score = (walkable * 30) + (nearby * 15)
    return min(score, 100)


def score_lifestyle(facilities):
    """
    Lifestyle based on schools + lifestyle amenities.
    """
    schools = sum(1 for f in facilities if f['type'] == 'school')
    lifestyle = sum(1 for f in facilities if f['type'] == 'lifestyle')

    score = (schools * 15) + (lifestyle * 20)
    return min(score, 100)


def score_affordability(avg_price):
    """
    Affordability inverse to average price.
    """
    if avg_price is None:
        return 50

    if avg_price < 8000000:
        return 90
    if avg_price < 15000000:
        return 70
    if avg_price < 30000000:
        return 50
    return 30


def score_growth(price_trend_pct):
    """
    Growth score based on price appreciation.
    """
    if price_trend_pct is None:
        return 50

    if price_trend_pct >= 10:
        return 90
    if price_trend_pct >= 5:
        return 70
    if price_trend_pct >= 0:
        return 50
    return 30


def locality_quality_index(scores):
    """
    Normalize final LQI score (0–100).
    """
    values = list(scores.values())
    return round(sum(values) / len(values), 2)

# 3C.2: Aggregate locality scoring

def compute_locality_scores(facilities, avg_price=None, price_trend_pct=None):
    """
    Compute all locality scores deterministically.
    """
    scores = {
        'safety': score_safety(facilities),
        'connectivity': score_connectivity(facilities),
        'lifestyle': score_lifestyle(facilities),
        'affordability': score_affordability(avg_price),
        'growth': score_growth(price_trend_pct),
    }

    scores['lqi'] = locality_quality_index(scores)
    return scores

# 3D.1: Locality explanation generator

def explain_locality(scores):
    """
    Generate rule-based explanations for locality scores.
    """
    explanations = {}

    # Safety
    if scores['safety'] >= 80:
        explanations['safety'] = 'Strong safety indicators due to good hospital and transport coverage.'
    elif scores['safety'] >= 50:
        explanations['safety'] = 'Moderate safety supported by essential facilities.'
    else:
        explanations['safety'] = 'Limited safety indicators due to fewer nearby facilities.'

    # Connectivity
    if scores['connectivity'] >= 80:
        explanations['connectivity'] = 'Excellent connectivity with walkable public transport access.'
    elif scores['connectivity'] >= 50:
        explanations['connectivity'] = 'Reasonable connectivity with nearby transport options.'
    else:
        explanations['connectivity'] = 'Connectivity may be a concern due to distance from transport hubs.'

    # Lifestyle
    if scores['lifestyle'] >= 80:
        explanations['lifestyle'] = 'Rich lifestyle environment with schools and leisure amenities.'
    elif scores['lifestyle'] >= 50:
        explanations['lifestyle'] = 'Balanced lifestyle with basic amenities available.'
    else:
        explanations['lifestyle'] = 'Limited lifestyle amenities in close proximity.'

    # Affordability
    if scores['affordability'] >= 80:
        explanations['affordability'] = 'Highly affordable compared to typical market prices.'
    elif scores['affordability'] >= 50:
        explanations['affordability'] = 'Moderately priced for the city and locality.'
    else:
        explanations['affordability'] = 'Premium pricing may impact affordability.'

    # Growth
    if scores['growth'] >= 80:
        explanations['growth'] = 'Strong growth signals based on price appreciation trends.'
    elif scores['growth'] >= 50:
        explanations['growth'] = 'Stable growth with steady price movement.'
    else:
        explanations['growth'] = 'Limited or negative growth signals observed.'

    return explanations
