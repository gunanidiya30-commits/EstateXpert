-- 3A.1: Localities master table

CREATE TABLE IF NOT EXISTS localities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uniq_locality (name, city, state)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE localities
ADD COLUMN lqi DECIMAL(5,2) DEFAULT NULL;
