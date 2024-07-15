-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados
SELECT DISTINCT title
FROM film; 
-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title , rating
FROM film
WHERE rating = "PG-13";
-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción
SELECT title,description
FROM film
WHERE description LIKE "%amazing%";
-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos .
SELECT title,length
FROM film
WHERE length > 120;
-- 5. Recupera los nombres de todos los actores.
SELECT first_name , last_name 
FROM actor; 
SELECT CONCAT ;
-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "Gibson";
-- 7.  Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name, last_name,actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20;
 
-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title,rating
FROM film
WHERE rating NOT IN ('R', 'PG-13');
-- 9.Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT rating,COUNT(*) AS total_movies
FROM film
GROUP BY rating;
-- 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT customer.customer_id, customer.first_name, customer.last_name , COUNT(*) AS rental_total_movies
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name , customer.last_name ;
-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres
SELECT category.name AS categoria, COUNT(rental.rental_id) AS total_alquileres
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film_category ON inventory.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;
-- 12.Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT rating , AVG (length) AS duracion_promedio
FROM film
GROUP BY rating;
-- 13.Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT actor.first_name, actor.last_name
FROM actor
INNER JOIN film_actor ON actor_id = film_actor.actor_id
INNER JOIN film_actor ON actor_id.film_id = Película.ID
WHERE film.title = 'Indian Love'; -- (no se hacer esto, necesito darle algunas vueltas o colapso)

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title ,description
FROM film
WHERE description LIKE '%dog%' OR description LIKE '%cat%';
-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
SELECT a.actor_id, a.first_name, a.last_name
FROM actor AS a 
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.actor_id IS NULL;
-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year
FROM film 
WHERE release_year BETWEEN 2005 AND 2010;
-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT film.title -- (como puedo agregar la categoria)
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Family';
-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas
SELECT a.first_name, a.last_name,COUNT(fa.film_id) AS num_peliculas -- (para que me aparezca en numero de peliculas en que aparece)
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 10;
-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
SELECT title , rating , length
FROM film
WHERE rating = 'R' AND length > 120;

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos 
-- y muestra el nombre de la categoría junto con el promedio de duración.
SELECT c.name AS categoria, AVG(f.length) AS promedio_duracion
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
HAVING AVG(f.length) > 120;

-- 21.Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor 
-- junto con la cantidad de películas en las que han actuado.
SELECT actor_id, COUNT(*) AS film_id
FROM film_actor
GROUP BY actor_id
HAVING COUNT(*) >= 5;


-- 22.  Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración 
-- superior a 5 días y luego selecciona las películas correspondientes.
SELECT title
FROM film
WHERE film_id IN (SELECT film_id FROM rental WHERE DATEDIFF(return_date, rental_date) > 5);



-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror".
--  Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.


SELECT first_name , last_name
FROM actor
WHERE actor_id NOT IN (SELECT actor_id FROM film_actor WHERE film_id IN (SELECT film_id FROM film WHERE category) = 'Horror');
    
-- 24.Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
SELECT name
FROM category
WHERE category = 'Comedy' AND length > 180;




