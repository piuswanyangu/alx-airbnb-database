Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

CREATE INDEX idx_users_first_name_last_name
ON Users (first_name,last_name);

CREATE INDEX idx_bookings_user_id
ON Bookings (user_id);

CREATE INDEX idx_bookings_property_id
ON Bookings (property_id);

CREATE INDEX idx_properties_title
ON Properties (title);



EXPLAIN ANALYZE
SELECT *
FROM Users
WHERE first_name = 'James';

EXPLAIN ANALYZE
SELECT *
FROM Properties
WHERE title = 'Jaston Villa';
