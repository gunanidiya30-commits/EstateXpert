-- 3E.1: Locality price trends table

CREATE TABLE IF NOT EXISTS locality_price_trends (
    id INT AUTO_INCREMENT PRIMARY KEY,
    locality_id INT NOT NULL,
    year YEAR NOT NULL,
    avg_price BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_price_trend_locality
        FOREIGN KEY (locality_id) REFERENCES localities(id)
        ON DELETE CASCADE,
    UNIQUE KEY uniq_locality_year (locality_id, year)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
