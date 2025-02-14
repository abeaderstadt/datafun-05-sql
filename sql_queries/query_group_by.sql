-- use GROUP BY clause (and optionally with aggregation)

-- select books of a specific genre
SELECT * FROM books WHERE genre = 'Fantasy';

-- count books per genre
SELECT genre, COUNT(*) AS book_count
FROM books
WHERE genre IS NOT NULL  -- To ensure you don't include books with no genre
GROUP BY genre
HAVING COUNT(*) > 5;
