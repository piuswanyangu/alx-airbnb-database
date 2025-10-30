# Database Performance Monitoring Report

## Objective
I aimed to continuously monitor and improve the performance of my database queries using tools like `EXPLAIN ANALYZE` and `SHOW PROFILE`. This helped me understand how queries are executed and identify areas that needed optimization.

## Queries Tested
1. I tested a query to fetch bookings by user ID.  
2. I tested a query to fetch properties by city.  
3. I tested a query to fetch users by email.

## Observations (Before Optimization)
Before making any changes, I noticed the following:
- Most queries were performing **full table scans**, which slowed down execution.  
- The `EXPLAIN` results showed **“Using where”** and **“Using temporary”**, meaning the queries weren’t using indexes effectively.  
- The number of **rows examined** was very high.  

## Changes Implemented
To address these issues, I made several improvements:
- I created indexes on the columns that were used most frequently in WHERE and JOIN clauses:
  ```sql
  CREATE INDEX idx_user_id ON Bookings(user_id);
  CREATE INDEX idx_city ON Properties(city);
  CREATE INDEX idx_email ON Users(email);


<!-- EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
); -->
