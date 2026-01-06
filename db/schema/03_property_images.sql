CREATE TABLE property_images (
    id INT AUTO_INCREMENT PRIMARY KEY,

    property_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_property_images_property
        FOREIGN KEY (property_id)
        REFERENCES properties(id)
        ON DELETE CASCADE
);
