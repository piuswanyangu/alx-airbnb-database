# Index Performance Report (Updated)

This report analyzes and improves indexing based on high‑usage columns
identified in the **Users**, **Bookings**, and **Properties** tables.

---

##  High‑Usage Columns Identified
These columns are used frequently in:
- `WHERE` filters
- `JOIN` operations
- Sorting (`ORDER BY`)

| Table | Column | Purpose |
|--------|--------|---------|
| Users | user_name | Filtering user lookups |
| Bookings | user_id | Foreign key join with Users |
| Bookings | property_id | Foreign key join with Properties |
| Properties | title | Searching properties by title |

---

##  SQL Index Commands

```sql
CREATE INDEX idx_users_user_name
ON Users (user_name);

CREATE INDEX idx_bookings_user_id
ON Bookings (user_id);

CREATE INDEX idx_bookings_property_id
ON Bookings (property_id);

CREATE INDEX idx_properties_title
ON Properties (title);
```

These indexes optimize join and search efficiency. 🚀

---

## Performance Verification Queries

```sql
EXPLAIN ANALYZE
SELECT *
FROM Users
WHERE user_name = 'James';

EXPLAIN ANALYZE
SELECT *
FROM Properties
WHERE title = 'Jaston Villa';
```



### Important Notes
- Indexes improve SELECT performance but can slow **INSERT / UPDATE**
