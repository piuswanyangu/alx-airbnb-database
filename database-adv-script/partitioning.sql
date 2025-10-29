alter table bookings_table
partition by range (year(start_date))(
    partition p2023 values less than (2023)
    partition p2024 values less than (2024)
    partition p_future values less than maxvalues
);


-- queery before partitioning 
EXPLAIN 
SELECT *
FROM bookings_table
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';


-- querry  after partitioning 
EXPLAIN
SELECT * 
FROM bookings_table
WHERE year(start_date)=2024;