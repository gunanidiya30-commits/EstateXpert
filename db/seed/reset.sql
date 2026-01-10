-- ===============================
-- MODULE 2E — DATA RESET
-- Removes ALL non-user data
-- ===============================

-- Favorites (depends on properties)
DELETE FROM favorites;

-- Property images (depends on properties)
DELETE FROM property_images;

-- Properties
DELETE FROM properties;

-- USER 
DELETE FROM users;

-- OPTIONAL: reset auto-increment counters (MySQL)
-- Uncomment ONLY if you want clean IDs (safe)
ALTER TABLE favorites AUTO_INCREMENT = 1;
ALTER TABLE property_images AUTO_INCREMENT = 1;
ALTER TABLE properties AUTO_INCREMENT = 1;
ALTER TABLE users AUTO_INCREMENT = 1;



