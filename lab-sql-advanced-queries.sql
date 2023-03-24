-- Lab | SQL Advanced queries
 Use sakila;
 
-- For each film, list actor that has acted in more films.
 
WITH actors_movies as (
SELECT a.title, b.actor_id, c.first_name, c.last_name, b.film_id
FROM film as a
LEFT JOIN film_actor as b
USING (film_id)
LEFT JOIN actor as c
USING (actor_id)
)
SELECT film_id, title, actor_id, first_name, last_name
FROM actors_movies
WHERE actor_id in (SELECT COUNT(actor_id)
				   FROM film_actor
				   GROUP BY title
                   HAVING COUNT(actor_id)>1);