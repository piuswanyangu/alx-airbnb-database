

SELECT *
FROM bookings INNER JOIN users
ON bookings.user_id = users.user_id;





SELECT *
FROM properties RIGHT JOIN reviews
ON properties.property_id = reviews.property_id;

SELECT *
FROM properties LEFT JOIN reviews
ON properties.property_id = reviews.property_id
ORDER BY DESC;




SELECT *
FROM users LEFT JOIN bookings
ON users.user_id = bookings.user_id
UNION

SELECT * 
FROM  users RIGHT JOIN bookings
ON users.user_id = bookings.user_id;

SELECT *
FROM users FULL OUTER JOIN bookings
ON users.user_id = bookings.user_id;