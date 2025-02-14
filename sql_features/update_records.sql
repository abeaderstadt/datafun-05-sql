-- update 1 or more records in a table.

-- Update the genre of a book
UPDATE books
SET genre = 'Fantasy'
WHERE title = 'Twilight';

-- Correct the retail price of a book
UPDATE books
SET retail_price = 9.99
WHERE title = 'Harry Potter and the Sorcerer’s Stone';
