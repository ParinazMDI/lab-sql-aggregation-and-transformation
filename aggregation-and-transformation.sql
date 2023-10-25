-- Lab | SQL Data Aggregation and Transformation
-- Challenge 1
-- 1.1   #Shortest and longest movie durations
USE sakila;
SELECT MIN(length) AS min_duration FROM film;
SELECT MAX(length) AS max_duration FROM film;
-- 1.2   #Average movie duration in hours and minutes
SELECT CONCAT(FLOOR(AVG(length) / 60), ' hours ', FLOOR(AVG(length) % 60), ' minutes') AS "movie duration in hours and minutes" FROM film;
-- 2.1   #Number of days that the company has been operating
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) AS operating_days FROM rental;
-- 2.2   #Month and weekday of the rental
SELECT rental_date, 
MONTHNAME(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday FROM rental LIMIT 20;
-- 2.3   #Bonus
SELECT*,
CASE
WHEN DAYOFWEEK(rental_date) = 7 OR DAYOFWEEK(rental_date) = 1 THEN 'weekend'
ELSE 'workday'
END AS DAY_TYPE
FROM rental;
-- 3   # Null value
SELECT title, IFNULL(rental_duration, 'NA') AS rental_duration FROM film
ORDER BY title ASC;

-- Challenge 2
-- 1.1   #Total number of the film
SELECT COUNT(film_id) AS 'Total number of the film' FROM film ;
-- 1.2 & 1.3  #To better understand the popularity of different film ratings
SELECT rating , COUNT(film_id) AS 'Total number of the film'
FROM film
GROUP BY rating
ORDER BY rating ASC;
-- 2.1  #Identify popular movie lengths for each category
SELECT rating , ROUND(AVG(length),2) AS 'film duration'
FROM film
GROUP BY rating
ORDER BY rating ASC;
-- 2.2  #Customers who prefer longer movies
SELECT rating , ROUND(AVG(length),2) AS 'film_duration'
FROM film
GROUP BY rating
HAVING film_duration >=120;
--



