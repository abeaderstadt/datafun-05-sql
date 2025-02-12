-- drop tables to restart
-- Start by deleting any tables if the exist already
-- We want to be able to re-run this script as needed.
-- DROP tables in reverse order of creation 
-- DROP dependent tables (with foreign keys) first
-- Makes the script idempotent (rerunnable) using the most current statements each time we run

-- Drop the books table if it exists
DROP TABLE IF EXISTS books;

-- Drop the authors table if it exists
DROP TABLE IF EXISTS authors;
