# EstateXpert — Module 3 Seed Data Rules

## 1. Localities (MANDATORY)
- Every locality MUST map to at least one existing property
- locality_name MUST exactly match property.locality
- country, state, city MUST match property values
- latitude & longitude MUST be real (no placeholders)
- Scores must be realistic (30–90 range preferred)

## 2. Facilities (MANDATORY)
- Every locality MUST have at least one facility
- facility.locality_id MUST exist in localities.id
- facility_type must be one of:
  - school
  - hospital
  - transport
  - lifestyle
- importance_level range: 1 (low) → 5 (high)

## 3. Zero Orphan Rule (CRITICAL)
- No property without a locality
- No locality without a property
- No facility without a locality

If this rule is violated:
→ STOP development
→ Fix data first
→ Resume only after validation

## 4. Read‑Only Contract
- Facilities are NOT editable via UI
- Localities are NOT editable via UI
- All changes happen via controlled seed updates

## 5. Analytics Safety
- Seed data must support:
  - Distance calculations
  - Aggregation
  - Human-readable insights
- No random or extreme values

This contract applies to:
- Module 3
- All future modules
