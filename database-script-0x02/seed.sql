Table User {
  user_id UUID [pk]
  first_name VARCHAR(255) [not null]
  last_name VARCHAR(255) [not null]
  email VARCHAR(255) [unique, not null]
  password_hash VARCHAR(255) [not null]
  phone_number VARCHAR(20)
  role ENUM('guest', 'host', 'admin') [not null]
  created_at TIMESTAMP [default: `now()`]
}

Table Property {
  property_id UUID [pk]
  host_id UUID [not null]
  name VARCHAR(255) [not null]
  description TEXT [not null]
  location VARCHAR(255) [not null]
  pricepernight DECIMAL [not null]
  created_at TIMESTAMP [default: `now()`]
  updated_at TIMESTAMP [default: `now()`]
}

Table Booking {
  booking_id UUID [pk]
  property_id UUID [not null]
  user_id UUID [not null]
  start_date DATE [not null]
  end_date DATE [not null]
  total_price DECIMAL [not null]
  status ENUM('pending', 'confirmed', 'canceled') [not null]
  created_at TIMESTAMP [default: `now()`]
}

Table Payment {
  payment_id UUID [pk]
  booking_id UUID [not null, unique]
  amount DECIMAL [not null]
  payment_date TIMESTAMP [default: `now()`]
  payment_method ENUM('credit_card', 'paypal', 'stripe') [not null]
}

Table Review {
  review_id UUID [pk]
  property_id UUID [not null]
  user_id UUID [not null]
  rating INTEGER [not null]
  comment TEXT [not null]
  created_at TIMESTAMP [default: `now()`]
}

Table Message {
  message_id UUID [pk]
  sender_id UUID [not null]
  recipient_id UUID [not null]
  message_body TEXT [not null]
  sent_at TIMESTAMP [default: `now()`]
}

Ref: User.user_id < Property.host_id
Ref: Property.property_id < Booking.property_id
Ref: User.user_id < Booking.user_id
Ref: Booking.booking_id - Payment.booking_id
Ref: Property.property_id < Review.property_id
Ref: User.user_id < Review.user_id
Ref: User.user_id < Message.sender_id
Ref: User.user_id < Message.recipient_id

// Additional constraints
Ref: Booking {
  start_date < end_date [delete: cascade]
}

Ref: Review {
  rating >= 1
  rating <= 5
}

Ref: Message {
  sender_id != recipient_id
}