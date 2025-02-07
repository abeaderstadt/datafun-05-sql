# update 1 or more records in a table.
-- Update the genre of a movie
UPDATE movies
SET genre = 'Adventure'
WHERE title = 'The Dark Knight';

-- Correct the release year of a movie
UPDATE movies
SET release_year = 2008
WHERE title = 'Pulp Fiction';