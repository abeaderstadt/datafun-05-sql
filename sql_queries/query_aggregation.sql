-- use aggregation functions including COUNT, AVG, SUM.

-- count all rows in the authors table
SELECT COUNT(*) FROM authors;

-- get average retail price of books
SELECT AVG(retail_price) FROM books;

-- get the total retail price of all books
SELECT SUM(retail_price) FROM books;
