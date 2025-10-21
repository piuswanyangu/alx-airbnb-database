1. ERD/requirements.md
# Entity Relationship Diagram (ERD) - ALX Airbnb Database

##  Objective
This document defines all entities, attributes, and relationships for the ALX Airbnb Database project. It serves as the foundation for normalization and schema creation.

---

## Entities and Attributes

### 1. User
| Attribute | Description |
|------------|--------------|
| user_id (PK) | Unique identifier for each user |
| first_name | User's first name |
| last_name | User's last name |
| email | User's email address (unique) |
| phone | Contact phone number |
| password_hash | Encrypted user password |
| created_at | Timestamp when the user was created |

---

### 2. Property
| Attribute | Description |
|------------|--------------|
| property_id (PK) | Unique identifier for each property |
| user_id (FK) | References the property owner (User) |
| title | Property title |
| description | Property description |
| address | Physical address |
| city | City location |
| country | Country location |
| price_per_night | Cost per night |
| created_at | Timestamp when the property was added |

---

### 3. Booking
| Attribute | Description |
|------------|--------------|
| booking_id (PK) | Unique identifier for each booking |
| user_id (FK) | References the guest (User) |
| property_id (FK) | References the booked property |
| check_in_date | Booking start date |
| check_out_date | Booking end date |
| status | Booking status (pending, confirmed, cancelled) |
| total_price | Total cost for the booking |
| created_at | Timestamp when booking was made |

---

### 4. Payment
| Attribute | Description |
|------------|--------------|
| payment_id (PK) | Unique payment identifier |
| booking_id (FK, UNIQUE) | References booking |
| amount | Payment amount |
| payment_date | Date payment was made |
| payment_method | Payment method (Credit Card, PayPal, etc.) |
| status | Payment status (completed, failed, pending) |

---

### 5. Review
| Attribute | Description |
|------------|--------------|
| review_id (PK) | Unique review identifier |
| booking_id (FK, UNIQUE) | References booking |
| rating | Rating value (1–5) |
| comment | Review text |
| created_at | Timestamp when review was added |

---

## 🔗 Relationships

| Relationship | Type | Description |
|---------------|------|--------------|
| User → Property | 1:N | A user can list many properties |
| User → Booking | 1:N | A user can make many bookings |
| Property → Booking | 1:N | A property can have multiple bookings |
| Booking → Payment | 1:1 | Each booking has one payment |
| Booking → Review | 1:1 | Each booking can have one review |

---

## 🧭 ER Diagram Representation



User (1) ───< (N) Property
User (1) ───< (N) Booking >───(N) Property
Booking (1) ─── (1) Payment
Booking (1) ─── (1) Review


---

##  ER Diagram Tool
https://drive.google.com/file/d/1WMuhco1OCp0r9yr1eRNnhtaM7Z43mDe6/view?usp=sharing

🧠 2. normalization.md
# Database Normalization - ALX Airbnb Database

## 1️⃣ First Normal Form (1NF)
**Rules:**
- Each column holds atomic (single) values.
- No repeating groups or arrays.
- Each record is unique.

✅ Applied:
- All attributes have single values.
- Every table has a unique primary key.
- No repeating columns.

---

## 2️⃣ Second Normal Form (2NF)
**Rules:**
- Must be in 1NF.
- All non-key attributes depend on the whole primary key.

✅ Applied:
- Each table has a single-column primary key.
- No partial dependencies exist.

---

## 3️⃣ Third Normal Form (3NF)
**Rules:**
- Must be in 2NF.
- No transitive dependencies (non-key attributes only depend on the primary key).

✅ Applied:
- Non-key attributes depend directly on their table’s primary key.
- No attribute depends on another non-key attribute.
- Example: `email` exists only in the **User** table, not repeated in **Booking**.

---

## 🏁 Result
The database is fully normalized to **3NF**, ensuring:
- Minimal redundancy  
- Data consistency  
- High scalability and easier maintenance

🧱 3. database-script-0x01/schema.sql
-- =========================================================
-- Airbnb Database Schema (DDL)
-- =========================================================

-- 1. Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Properties Table
CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    address VARCHAR(150),
    city VARCHAR(50),
    country VARCHAR(50),
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Bookings Table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    property_id INT REFERENCES properties(property_id) ON DELETE CASCADE,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Payments Table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT UNIQUE REFERENCES bookings(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'completed'
);

-- 5. Reviews Table
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    booking_id INT UNIQUE REFERENCES bookings(booking_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Indexes for performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_bookings_status ON bookings(status);

📘 4. database-script-0x01/README.md
# Database Schema (DDL) - ALX Airbnb Database

## 🎯 Objective
Define the SQL schema for the ALX Airbnb Database including tables, attributes, data types, and constraints.

---

## 🗂️ Files
- `schema.sql` — Contains all SQL CREATE TABLE statements.

---

## 🧱 Tables Overview

### 1. `users`
Stores user account and profile information.

### 2. `properties`
Stores property listings owned by users.

### 3. `bookings`
Stores reservation details made by users.

### 4. `payments`
Stores payment records linked to bookings.

### 5. `reviews`
Stores ratings and feedback for completed stays.

---

## ⚙️ Constraints & Features
- **Primary Keys** — ensure unique records.
- **Foreign Keys** — maintain data integrity.
- **Unique Constraints** — prevent duplicate emails/bookings.
- **Check Constraints** — enforce valid ratings.
- **Indexes** — improve query performance.

---

## 🧩 ER Diagram Reference
Refer to `ERD/requirements.md` for full entity relationships and visual representation.

---

## 🚀 How to Run
1. Open your SQL client.
2. Run:
   ```bash
   psql -f schema.sql
