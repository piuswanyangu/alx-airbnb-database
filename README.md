# Entity Relationship Diagram (ERD)

This ERD represents the Airbnb-like relational database design for the **ALX Airbnb Database Module**.  
It includes five main entities — `User`, `Property`, `Booking`, `Payment`, and `Review` — with their relationships clearly defined.

## 🧱 Entities and Attributes

### User
- user_id (PK)
- first_name
- last_name
- email
- phone
- password
- date_joined

### Property
- property_id (PK)
- host_id (FK → User.user_id)
- title
- description
- address
- city
- country
- price_per_night
- created_at

### Booking
- booking_id (PK)
- user_id (FK → User.user_id)
- property_id (FK → Property.property_id)
- check_in_date
- check_out_date
- total_price
- booking_status

### Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- payment_date
- amount
- payment_method
- payment_status

### Review
- review_id (PK)
- user_id (FK → User.user_id)
- property_id (FK → Property.property_id)
- rating
- comment
- created_at

## 🔗 Relationships
- One **User** can host many **Properties** (1:N)
- One **User** can make many **Bookings** (1:N)
- One **Booking** belongs to one **Property** and one **User**
- One **Booking** has one **Payment** (1:1)
- One **User** can leave many **Reviews** for different **Properties**

## 🛠 Tool Used
Created using [[Draw.io](https://app.diagrams.net/](https://app.diagrams.net/#G1WMuhco1OCp0r9yr1eRNnhtaM7Z43mDe6#%7B%22pageId%22%3A%2291Sv5s3--Qozor6agku1%22%7D))  

## 🧩 Normalization Level
Database normalized up to **Third Normal Form (3NF)**.
📄 normalization.md
markdown
Copy code
# Database Normalization

This document outlines the normalization process applied to the Airbnb database design to ensure data integrity and eliminate redundancy.

## 1️⃣ First Normal Form (1NF)
- All columns contain atomic values.
- No repeating groups or arrays.
- Example: `first_name` and `last_name` are stored separately instead of a single `full_name`.

## 2️⃣ Second Normal Form (2NF)
- All non-key attributes fully depend on the entire primary key.
- No partial dependencies.
- Example: In `Property`, all attributes depend on `property_id`.

## 3️⃣ Third Normal Form (3NF)
- No transitive dependencies.
- Example: `User.city` is not stored in `Booking`; it can be derived via `User.user_id`.

✅ Final Design: The database schema achieves **3NF** with no redundancy or update anomalies.
📁 database-script-0x01/schema.sql
sql
Copy code
-- Airbnb Database Schema Definition
-- Created by: Pius Ndubi

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
📁 database-script-0x02/seed.sql
sql
Copy code
-- Airbnb Database Seed Script
-- Created by: Pius Ndubi

-- Insert Users
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
