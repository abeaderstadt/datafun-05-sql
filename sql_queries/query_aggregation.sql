# use aggregation functions including COUNT, AVG, SUM.
-- count all rows
SELECT COUNT(*) FROM sales;

-- get average amount
SELECT AVG(amount) FROM sales;

-- combine functions
SELECT SUM(amount), AVG(amount), COUNT(*) FROM sales;