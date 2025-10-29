#Optimization Report

Initial Query
```sql
SELECT *
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.payment_id = pay.payment_id;
```

## Performance Analysis Using EXPLAIN

### Identified Inefficiencies
- Full table scans likely if indexes on foreign keys are missing.
- SELECT * retrieves unnecessary columns.
- No WHERE clause means retrieving all rows, slowing down execution.
- Increased memory and I/O usage due to large dataset joins.

## Optimization Recommendations
- Add indexes on user_id, property_id, and payment_id in bookings table.
- Ensure primary keys in users, properties, and payments tables.
- Select only necessary columns instead of using SELECT *.
- Filter query with WHERE clause if only specific results are needed.

### Example of an Optimized Query
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);



SELECT 
    b.booking_id,
    u.user_name,
    p.property_name,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.payment_id = pay.payment_id;
