-- update 1 or more records in a table.

-- Update the genre of a book
UPDATE books
SET genre = 'Fantasy'
WHERE title = 'Twilight';

-- Correct the retail price of a book
UPDATE books
SET retail_price = 9.99
WHERE title = 'Harry Potter and the Sorcerer’s Stone';

-- Add page count collumn
ALTER TABLE books ADD COLUMN page_count INTEGER;

-- Set the page count for specific books
UPDATE books
SET page_count = 498
WHERE title = 'Twilight';

UPDATE books
SET page_count = 309
WHERE title = 'Harry Potter and the Sorcerer’s Stone';
