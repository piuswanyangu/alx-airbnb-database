Entity Relationship Diagram (ERD)

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
