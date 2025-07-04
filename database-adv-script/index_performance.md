-- Query before creating indexes:
EXPLAIN ANALYZE
SELECT u.id, u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

-- After running database_index.sql, run the same:
EXPLAIN ANALYZE
SELECT u.id, u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;
