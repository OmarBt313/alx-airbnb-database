SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.total_price,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email,

    p.id AS property_id,
    p.name AS property_name,
    p.location,

    pay.id AS payment_id,
    pay.payment_date,
    pay.amount,
    pay.status

FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id;


    EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.total_price,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email,

    p.id AS property_id,
    p.name AS property_name,
    p.location,

    pay.id AS payment_id,
    pay.payment_date,
    pay.amount,
    pay.status

FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id;


    -- Indexing critical join columns:
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_properties_id ON properties(id);



-- Refactored version with indexes assumed in place

SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.total_price,
    
    u.name AS user_name,
    p.name AS property_name,
    
    pay.amount,
    pay.status

FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id;
