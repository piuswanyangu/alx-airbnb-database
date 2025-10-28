SQL Joins Practice — Property Booking System

This project contains SQL queries demonstrating the use of different JOIN operations in a real-world database scenario.
The database represents a property rental system with the following main tables:

users — Stores user details

bookings — Stores booking information

properties — Stores property listings

reviews — Stores user reviews for properties

📌 Queries Included
✅ INNER JOIN

Retrieve all bookings and the respective users who made those bookings:

SELECT u.user_id, u.name, b.booking_id, b.property_id, b.booking_date
FROM users u
INNER JOIN bookings b
    ON u.user_id = b.user_id;


📝 Returns only users who have at least one booking.

✅ LEFT JOIN

Retrieve all properties and their reviews, including properties that have no reviews:

SELECT p.property_id, p.title, r.review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r
    ON p.property_id = r.property_id;


📝 Shows every property. Properties without reviews will return NULL review fields.

✅ FULL OUTER JOIN (Simulated in MySQL)

Retrieve all users and all bookings — even unmatched ones.

ℹ️ MySQL does not support FULL OUTER JOIN directly
✅ Achieved using LEFT JOIN + RIGHT JOIN + UNION

SELECT u.user_id, u.name, b.booking_id, b.property_id
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id

UNION

SELECT u.user_id, u.name, b.booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b
    ON u.user_id = b.user_id;