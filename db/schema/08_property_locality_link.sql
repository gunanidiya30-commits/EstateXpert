-- 08_property_locality_link.sql
-- Property ↔ Locality linkage

ALTER TABLE properties
ADD COLUMN locality_id INT NOT NULL AFTER city,
ADD CONSTRAINT fk_property_locality
    FOREIGN KEY (locality_id)
    REFERENCES localities(id)
    ON DELETE RESTRICT;

CREATE INDEX idx_property_locality ON properties(locality_id);
