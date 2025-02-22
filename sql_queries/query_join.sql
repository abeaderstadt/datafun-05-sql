-- use INNER JOIN operation and optionally include LEFT JOIN, RIGHT JOIN, etc.

-- Inner join between authors and books tables
SELECT authors.first_name, authors.last_name, books.title, books.year_published
FROM authors
INNER JOIN books ON authors.author_id = books.author_id;