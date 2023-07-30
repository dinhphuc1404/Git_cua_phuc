CREATE
DEFINER=`root`@`localhost` PROCEDURE `getCategoryStatisBy1WeeksAgo`(
daysAgo int)
BEGIN
DROP
TEMPORARY TABLE IF EXISTS table2;
CREATE
TEMPORARY TABLE table2 AS (SELECT category.*,
 count(category.category_id) as 'num_of_booking'
from booking
 inner join ticket
 inner join movie
 inner join movie_category
 inner join category
on movie_category.category_id = category.category_id
and booking.ticket_id = ticket.ticket_id
and ticket.movie_id = movie.movie_id
and movie_category.movie_id = movie.movie_id
and booking.time >= DATE(NOW() - INTERVAL daysAgo DAY)
group by category.category_id
order by num_of_booking desc);
DROP
TEMPORARY TABLE IF EXISTS table3;
CREATE
TEMPORARY TABLE table3(select category_id
from table2);
select table2.*
from table2
union
select category.*, 0
from category
where category.category_id not in (select category_id from table3);
END