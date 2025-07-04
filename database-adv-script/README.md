SELECT 
    bookings.id AS booking_id,
    bookings.booking_date,
    bookings.total_price,
    users.id AS user_id,
    users.name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;


    SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    bookings.id AS booking_id,
    bookings.booking_date,
    bookings.total_price
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;