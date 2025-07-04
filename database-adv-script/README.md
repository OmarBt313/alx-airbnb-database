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
 ORDER BY AFTER 
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


    SELECT 
    properties.id,
    properties.name,
    properties.location
FROM 
    properties
WHERE 
    properties.id IN (
        SELECT 
            reviews.property_id
        FROM 
            reviews
        GROUP BY 
            reviews.property_id
        HAVING 
            AVG(reviews.rating) > 4.0
    );

SELECT 
    u.id,
    u.name,
    u.email
FROM 
    users u
WHERE 
    (
        SELECT COUNT(*) 
        FROM bookings b 
        WHERE b.user_id = u.id
    ) > 3;



SELECT 
    users.id AS user_id,
    users.name,
    users.email,
    COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id, users.name, users.email;



SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    booking_rank;
