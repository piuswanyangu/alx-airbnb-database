nsert Users
INSERT INTO users (first_name, last_name, email, phone, password)
VALUES
('Alice', 'Otieno', 'alice@gmail.com', '0712345678', 'password123'),
('Brian', 'Mutua', 'brian@yahoo.com', '0798765432', 'securepass'),
('Cynthia', 'Wambui', 'cynthia@gmail.com', '0709123456', 'mypassword');

-- Insert Properties
INSERT INTO properties (host_id, title, description, address, city, country, price_per_night)
VALUES
(1, 'Cozy Apartment', 'A peaceful apartment near CBD.', 'Kilimani, Nairobi', 'Nairobi', 'Kenya', 5000.00),
(2, 'Beachfront Villa', 'A beautiful villa facing the ocean.', 'Diani Beach', 'Mombasa', 'Kenya', 15000.00),
(3, 'Mountain Cabin', 'A quiet escape near Mt. Kenya.', 'Nanyuki', 'Laikipia', 'Kenya', 8000.00);

-- Insert Bookings
INSERT INTO bookings (user_id, property_id, check_in_date, check_out_date, total_price, booking_status)
VALUES
(2, 1, '2025-11-10', '2025-11-12', 10000.00, 'confirmed'),
(3, 2, '2025-12-05', '2025-12-08', 45000.00, 'pending');

-- Insert Payments
INSERT INTO payments (booking_id, payment_date, amount, payment_method)
VALUES
(1, CURRENT_TIMESTAMP, 10000.00, 'M-Pesa'),
(2, CURRENT_TIMESTAMP, 45000.00, 'Credit Card');

-- Insert Reviews
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Amazing experience, highly recommended!'),
(3, 2, 4, 'Beautiful location and view, but quite pricey.');
📁 database-script-0x02/README.md
markdown
Copy code
# Airbnb Database Seeding Script

This directory contains SQL scripts for populating the Airbnb database with realistic sample data.

## 📂 Files
- **seed.sql** — Inserts sample records into all tables (users, properties, bookings, payments, reviews).

## 🎯 Purpose
To simulate real-world Airbnb data for testing, visualization, and query performance analysis.

## 🧾 Entities Covered
- Users (hosts and guests)
- Properties (listings)
- Bookings (reservations)
- Payments (transactions)
- Reviews (feedback)
