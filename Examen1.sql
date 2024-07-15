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
-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos (vacio, darle vuelta al codigo )actor
SELECT title,length
FROM film
WHERE length > 120;
-- 5. Recupera los nombres de todos los actores. (Arreglar codigo, no es correcto quiero que me salgan los nombres y apellidos en una misma columna 
-- con un espacio entre ellos.
SELECT first_name , last_name 
FROM actor; -- hasta aqui  con el concat me salen los nombres y apellidos de todos los actores en columnas distintas.
SELECT CONCAT (first_name SUBSTRING_INDEX,full_name ' ', 1),(last_name SUBSTRING_INDEX , full_name ' ', -1) AS full_name;
 

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
-- Estudiar este codigo, no lo tengo claro y tuve que buscar en chatGPT)
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
-- 13. 






