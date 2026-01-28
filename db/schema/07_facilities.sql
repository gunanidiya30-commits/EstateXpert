-- 3A.2: Facilities master table

CREATE TABLE IF NOT EXISTS facilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    type ENUM('school','hospital','transport','lifestyle') NOT NULL,
    locality_id INT NOT NULL,
    latitude DECIMAL(10,7) NOT NULL,
    longitude DECIMAL(10,7) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_facility_locality
        FOREIGN KEY (locality_id) REFERENCES localities(id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE facilities
ADD COLUMN distance_km DECIMAL(6,2) AFTER longitude;


UPDATE facilities f
JOIN localities l ON f.locality_id = l.id
SET f.distance_km = (
    6371 * ACOS(
        COS(RADIANS(l.latitude))
        * COS(RADIANS(f.latitude))
        * COS(RADIANS(f.longitude) - RADIANS(l.longitude))
        + SIN(RADIANS(l.latitude))
        * SIN(RADIANS(f.latitude))
    )
);
