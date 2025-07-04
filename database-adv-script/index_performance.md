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

-- File: database_index.sql

-- Users table
CREATE INDEX idx_users_id ON users(id);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Properties table
CREATE INDEX idx_properties_id ON properties(id);

-- Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);
