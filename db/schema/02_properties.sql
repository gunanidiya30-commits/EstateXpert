CREATE TABLE properties (
    id INT AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,

    price DECIMAL(12,2) NOT NULL,
    area_sqft INT NOT NULL,
    bhk INT NOT NULL,

    property_type ENUM('residential', 'commercial', 'rental') NOT NULL,

    city VARCHAR(100) NOT NULL,
    locality VARCHAR(100) NOT NULL,

    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),

    owner_id INT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_properties_owner
        FOREIGN KEY (owner_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

ALTER TABLE properties
ADD COLUMN state VARCHAR(100) NOT NULL
AFTER property_type;

ALTER TABLE properties
ADD COLUMN locality_id INT NULL AFTER city;

UPDATE properties p
JOIN localities l
  ON p.city = l.city
SET p.locality_id = l.id;

