Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.


select count(*), user_id as total_bookings
from bookings
group by user_id;

Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num_rank,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank_order
FROM properties p
JOIN bookings b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name;
