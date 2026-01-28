-- 3A.5: Facilities seed (baseline per locality)

-- Schools
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' Public School'), 'school', id, latitude + 0.002, longitude + 0.002
FROM localities;

-- Hospitals
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' General Hospital'), 'hospital', id, latitude - 0.002, longitude - 0.002
FROM localities;

-- Transport
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' Metro / Bus Hub'), 'transport', id, latitude + 0.0015, longitude - 0.0015
FROM localities;

-- Lifestyle
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' Market / Mall'), 'lifestyle', id, latitude - 0.0015, longitude + 0.0015
FROM localities;


-- Schools (walkable)
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' Public School'), 'school', id,
       latitude + 0.002, longitude + 0.002
FROM localities;

-- Hospitals (nearby)
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' General Hospital'), 'hospital', id,
       latitude + 0.02, longitude - 0.02
FROM localities;

-- Transport (walkable)
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' Metro / Bus Hub'), 'transport', id,
       latitude + 0.0015, longitude - 0.0015
FROM localities;

-- Lifestyle (far)
INSERT INTO facilities (name, type, locality_id, latitude, longitude)
SELECT CONCAT(name, ' Market / Mall'), 'lifestyle', id,
       latitude + 0.05, longitude + 0.05
FROM localities;
