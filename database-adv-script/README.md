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
