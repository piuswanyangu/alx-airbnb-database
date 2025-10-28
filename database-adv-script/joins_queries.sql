Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

select *
from bookings inner join users
on bookings.user_id = users.user_id;

Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.



select *
from properties left join reviews
on properties.property_id = reviews.property_id;


Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

select *
from users left join bookings
on users.user_id = bookings.user_id
union

select * 
from users right join bookings
on users.user_id = bookings.user_id;