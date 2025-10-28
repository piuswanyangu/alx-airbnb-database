-- inner join querries on user and bookings
select *
from bookings inner join users
on booking.user_id = users.user_id;

-- Left join properties and reviews
select *
from properties left join reviews
on properties.property_id = reviews.property_id;

-- full outer join for users and bookings
select *
from users left join bookings
on users.user_id = bookings.user_id
union

select * 
from users right join bookings
on users.user_id = bookings.user_id;