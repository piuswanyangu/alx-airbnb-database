🧩 Normalization Level
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