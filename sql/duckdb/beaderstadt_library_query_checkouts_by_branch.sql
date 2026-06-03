-- sql/duckdb/beaderstadt_library_query_checkouts_by_branch.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break overall checkout activity down by branch.
--
-- This query answers:
-- "How many checkouts and total fines collected by branch?"
--
-- WHY:
-- - Overall totals hide important differences.
-- - Grouping lets us compare parts of the system.
-- - This often reveals where action is needed:
--   * Which branches drive revenue?
--   * Which branches underperform?
--
-- IMPORTANT:
-- This query uses JOIN between branch (parent) and checkout (child)
-- to analyze checkout activity at the branch level.

SELECT
  b.branch_name,
  c.branch_id,
  COUNT(*) AS checkout_count,
  ROUND(SUM(c.fine_amount), 2) AS total_fine_amount,
  ROUND(AVG(c.fine_amount), 2) AS avg_fine_amount
FROM checkout c
JOIN branch b ON c.branch_id = b.branch_id
GROUP BY b.branch_name, c.branch_id
ORDER BY SUM(c.fine_amount) DESC;
