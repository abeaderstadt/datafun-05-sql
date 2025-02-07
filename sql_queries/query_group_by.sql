# use GROUP BY clause (and optionally with aggregation)

-- Get the total sales and average sales amount by a salesperson
SELECT salesperson_id, SUM(amount), AVG(amount) 
FROM sales 
GROUP BY salesperson_id;