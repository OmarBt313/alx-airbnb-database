SET profiling = 1;

SELECT * FROM bookings WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
SHOW PROFILES;
SHOW PROFILE FOR QUERY <query_id>;
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
