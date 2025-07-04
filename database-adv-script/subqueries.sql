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
