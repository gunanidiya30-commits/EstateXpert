INSERT INTO users (name, email, password, role, preferences) VALUES
(
  'Riya Sharma',
  'buyer@estatexpert.com',
  'buyer123',
  'buyer',
  JSON_OBJECT('budget', 5000000, 'city', 'Bangalore', 'purpose', 'buy')
),
(
  'Amit Verma',
  'seller@estatexpert.com',
  'seller123',
  'seller',
  JSON_OBJECT('budget', NULL, 'city', 'Mumbai', 'purpose', 'sell')
),
(
  'Neha Kapoor',
  'investor@estatexpert.com',
  'investor123',
  'investor',
  JSON_OBJECT('budget', 15000000, 'city', 'Delhi', 'purpose', 'invest')
),
(
  'Admin User',
  'admin@estatexpert.com',
  'admin123',
  'admin',
  JSON_OBJECT('budget', NULL, 'city', NULL, 'purpose', 'manage')
);
