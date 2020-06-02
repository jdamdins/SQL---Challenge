---tables
Select * FROM film;
Select * FROM inventory;

---Used subquery to get the film titles of 7 copies of a film 
CREATE VIEW title_count AS 
SELECT COUNT( inventory_id)
AS number_of_copies,(select title from film
WHERE film.film_id = inventory.film_id) from inventory   
GROUP BY film_id
HAVING count( inventory_id)=7
order by title ASC
limit 8

--Query the View created

SELECT * FROM title_count
