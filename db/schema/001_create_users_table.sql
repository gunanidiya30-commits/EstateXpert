CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Identity
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,

    -- Authentication
    password_hash VARCHAR(255) NOT NULL,

    -- Role management
    role ENUM('buyer', 'seller', 'investor', 'admin') NOT NULL DEFAULT 'buyer',

    -- User preferences
    preferred_city VARCHAR(100),
    budget_min DECIMAL(15,2),
    budget_max DECIMAL(15,2),
    purpose ENUM('buy', 'sell', 'invest', 'rent'),

    -- Metadata
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
