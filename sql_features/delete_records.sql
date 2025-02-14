-- delete 1 or more records from a table.

-- Delete the book Divergent
DELETE FROM books WHERE book_id = '4d5e6f7g-8901-23de-f567-8901234567ef';

-- Delete author Veronica Roth
DELETE FROM authors WHERE author_id = '2e71ee9f-8893-4bad-9d04-f86a083cacee';

-- Delete books with a price above 10.99
DELETE FROM books WHERE retail_price > 10.99;