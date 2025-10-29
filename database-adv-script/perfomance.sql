Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql


SELECT *
FROM bookings b
JOIN users u
    ON b.user_id = u.user_id
JOIN properties p
    ON b.property_id = p.property_id
JOIN payments pay
    ON b.payment_id = pay.payment_id;


EXPLAIN ANALYZE
SELECT *
FROM bookings b
JOIN users u
    ON b.user_id = u.user_id
JOIN properties p
    ON b.property_id = p.property_id
JOIN payments pay
    ON b.payment_id = pay.payment_id;


SELECT 
    b.booking_id,
    u.user_name,
    u.email,
    p.property_name,
    p.location,
    pay.amount,
    pay.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.payment_id = pay.payment_id;
