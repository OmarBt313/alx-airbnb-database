-- 1. Rename existing bookings table (backup)
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create partitioned table by RANGE on start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price NUMERIC(10,2),
    -- other columns...
) PARTITION BY RANGE (start_date);

-- 3. Create partitions (example: yearly partitions)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Migrate data from old table to new partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, total_price)
SELECT id, user_id, property_id, start_date, end_date, total_price FROM bookings_old;

-- 5. (Optional) Drop old table after verification
-- DROP TABLE bookings_old;

-- 6. Create indexes on partitions as needed (example)
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023 (start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024 (start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);
