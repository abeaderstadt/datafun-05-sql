# delete 1 or more records from a table.
-- Delete movies by title
DELETE FROM movies WHERE title IN ('Batman', 'Spiderman', 'Avatar');

-- Delete discontinued movies
DELETE FROM movies WHERE discontinued = 1;

-- Delete movies with a rating below 5.0
DELETE FROM movies WHERE rating < 5.0;