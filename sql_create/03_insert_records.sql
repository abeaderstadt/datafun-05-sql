-- insert at least 10 additional records into each table.

-- Insert authors data
INSERT INTO authors (author_id, first_name, last_name, birth_year) VALUES
('6aed3dd6-e047-4d07-bd0e-06c37b4f165e', 'Sarah J', 'Maas', '1986'),
('0b56aad8-90bf-422c-adb6-c8717392b72e', 'Julia', 'Quinn', '1970'),
('ed3a588b-edf7-4f6f-b32a-18b2b2e735cd', 'Stephenie', 'Meyer', '1973'),
('2e71ee9f-8893-4bad-9d04-f86a083cacee', 'Veronica', 'Roth', '1988'),
('8b32495a-ae32-49d5-aac2-06c437cd24b6', 'Suzanne', 'Collins', '1962'),
('72eab301-1d4c-463d-ae74-c0f8be4b9b29', 'J.K.', 'Rowling', '1965'),
('f3d3c2a9-55a6-4f44-b9ae-3c97f9466b32', 'George', 'Orwell', '1903'),
('a65c85d2-e1b5-4235-b974-6a64a4d6fd90', 'Harper', 'Lee', '1926'),
('dce49b15-40b7-4c74-b10f-72db29adf7ab', 'Margaret', 'Atwood', '1939'),
('b43b5599-9df4-43ea-b66e-2140e5f967d0', 'Toni', 'Morrison', '1931');

-- Insert books data
INSERT INTO books (book_id, title, genre, year_published, retail_price, author_id) VALUES
('1a2b3c4d-5678-90ab-cdef-1234567890ab', 'A Court of Thorns and Roses', 'Fantasy', 2015, 15.99, '6aed3dd6-e047-4d07-bd0e-06c37b4f165e'),
('2b3c4d5e-6789-01bc-def2-3456789012cd', 'The Duke and I', 'Historical Romance', 2000, 12.99, '0b56aad8-90bf-422c-adb6-c8717392b72e'),
('3c4d5e6f-7890-12cd-ef34-5678901234de', 'Twilight', 'Romance', 2005, 9.99, 'ed3a588b-edf7-4f6f-b32a-18b2b2e735cd'),
('4d5e6f7g-8901-23de-f567-8901234567ef', 'Divergent', 'Dystopian', 2011, 13.99, '2e71ee9f-8893-4bad-9d04-f86a083cacee'),
('5e6f7g8h-9012-34ef-5678-9012345678gh', 'The Hunger Games', 'Dystopian', 2008, 11.99, '8b32495a-ae32-49d5-aac2-06c437cd24b6'),
('6f7g8h9i-0123-45fg-6789-2345678901ij', 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997, 10.99, '72eab301-1d4c-463d-ae74-c0f8be4b9b29'),
('7g8h9i0j-1234-56hi-7890-3456789012jk', '1984', 'Dystopian', 1949, 8.99, 'f3d3c2a9-55a6-4f44-b9ae-3c97f9466b32'),
('8h9i0j1k-2345-67ij-8901-4567890123kl', 'To Kill a Mockingbird', 'Fiction', 1960, 7.99, 'a65c85d2-e1b5-4235-b974-6a64a4d6fd90'),
('9i0j1k2l-3456-78jk-9012-5678901234lm', 'The Handmaid''s Tale', 'Dystopian', 1985, 6.99, 'dce49b15-40b7-4c74-b10f-72db29adf7ab'),
('a1j2k3l4-4567-89kl-0123-6789012345mn', 'Beloved', 'Historical Fiction', 1987, 14.99, 'b43b5599-9df4-43ea-b66e-2140e5f967d0');
