# Booking Table Partitioning Performance Report

## Objective
To improve query performance on the `bookings` table by applying table partitioning based on the `start_date` column.

## Method
- The table was partitioned by year using MySQL `RANGE` partitioning.
- Performance of common queries was measured using `EXPLAIN`.

## Queries Tested
- Fetch bookings within a specific date range.
- Fetch bookings for a particular year.

## Performance Comparison

| Query Type | Before Partitioning | After Partitioning | Improvement |
|-----------|-------------------|------------------|-------------|
| Date Range Query | Full table scan | Scans only relevant partitions | Significant ✔ |
| Year-based Query | Scans all records | Only scans 1 partition | Significant ✔ |

## Key Observations
- MySQL only scanned partitions that contained the relevant data.
- Reduced I/O operations and improved speed especially for large datasets.
- Indexes now perform more efficiently on partitioned data.

## Conclusion
Partitioning the `bookings` table based on the `start_date` column greatly optimized query execution, especially for date-range reporting and analytics queries.
