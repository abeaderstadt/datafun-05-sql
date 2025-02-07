# use WHERE to filter data based on conditions.
-- Select movies of a specific genre
SELECT * FROM movies WHERE genre = 'Action';

-- Select movies released after a certain year
SELECT * FROM movies WHERE release_year > 2000;

-- Select movies directed by a specific director
SELECT * FROM movies WHERE director = 'Quentin Tarantino';

-- Use distinct and combine conditions
SELECT DISTINCT director FROM movies WHERE Year > 2000 AND Year < 2020;