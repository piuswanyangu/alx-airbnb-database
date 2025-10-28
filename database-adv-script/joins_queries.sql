

select *
from bookings inner join users
on bookings.user_id = users.user_id;





select *
from properties left join reviews
on properties.property_id = reviews.property_id;




select *
from users left join bookings
on users.user_id = bookings.user_id
union

select * 
from users right join bookings
on users.user_id = bookings.user_id;