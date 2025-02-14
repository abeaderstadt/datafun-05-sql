-- use WHERE to filter data based on conditions.

-- Select books of a specific genre
SELECT * FROM books WHERE genre = 'Fantasy';

-- Select books published after a certain year
SELECT * FROM books WHERE year_published > 2000;

-- Select books written by a specific autho
SELECT * FROM books WHERE author_id = 'b43b5599-9df4-43ea-b66e-2140e5f967d0';

-- Use distinct and combine conditions
SELECT DISTINCT authors.first_name, authors.last_name
FROM authors
INNER JOIN books ON authors.author_id = books.author_id
WHERE books.year_published > 2000 AND books.year_published < 2020;
