CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  password VARCHAR(255) NOT NULL,
  date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE properties (
  property_id SERIAL PRIMARY KEY,
  host_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  address VARCHAR(200),
  city VARCHAR(100),
  country VARCHAR(100),
  price_per_night DECIMAL(10,2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  property_id INT REFERENCES properties(property_id) ON DELETE CASCADE,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  total_price DECIMAL(10,2),
  booking_status VARCHAR(20) DEFAULT 'pending'
);

CREATE TABLE payments (
  payment_id SERIAL PRIMARY KEY,
  booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  amount DECIMAL(10,2),
  payment_method VARCHAR(50),
  payment_status VARCHAR(20) DEFAULT 'completed'
);

CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  property_id INT REFERENCES properties(property_id) ON DELETE CASCADE,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance optimization
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_property_city ON properties(city);
CREATE INDEX idx_booking_status ON bookings(booking_status);
📁 database-script-0x01/README.md
markdown
Copy code
# Airbnb Database Schema

This directory contains SQL scripts to define the database schema for the Airbnb-like application.

## 📂 Files
- **schema.sql** — Contains SQL statements to create tables, define constraints, and add indexes.

## 📘 Description
The schema defines the following entities:
- `users` — stores information about hosts and guests.
- `properties` — details of listings hosted by users.
- `bookings` — reservation records between users and properties.
- `payments` — transaction details for completed bookings.
- `reviews` — feedback left by users after stays.

## 🧩 Relationships
- Users ↔ Properties (1:N)
- Users ↔ Bookings (1:N)
- Bookings ↔ Payments (1:1)
- Users ↔ Reviews (1:N)