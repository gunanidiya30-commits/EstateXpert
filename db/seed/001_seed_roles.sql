-- System Roles Seed
-- This table-less seed documents and validates allowed roles

INSERT INTO users (full_name, email, password_hash, role, is_active)
VALUES
('System Buyer Role', 'role_buyer@system.local', 'N/A', 'buyer', 0),
('System Seller Role', 'role_seller@system.local', 'N/A', 'seller', 0),
('System Investor Role', 'role_investor@system.local', 'N/A', 'investor', 0),
('System Admin Role', 'role_admin@system.local', 'N/A', 'admin', 0);
