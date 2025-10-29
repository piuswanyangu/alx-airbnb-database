Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

create index user_name_idx
on Users (user_name_idx);

create index booking_id_idx
on Bookings (booking_id_idx);

create index title_idx
on Properties (title_idx);

EXPLAIN ANALYZE
SELECT * FROM Users
WHERE User_name = 'James'
ORDER BY Bookings DESC;

EXPLAIN ANALYZE
SELECT * FROM Properties
WHERE title = "Jaston Villa";
