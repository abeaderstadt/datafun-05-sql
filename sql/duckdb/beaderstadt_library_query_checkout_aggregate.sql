-- sql/duckdb/beaderstadt_library_query_checkout_aggregate.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Summarize overall checkout activity across ALL branches.
--
-- This query answers:
-- - "How many total checkouts occurred?"
-- - "What is the total fine amount collected?"
-- - "What is the average fine per checkout?"
--
-- WHY:
-- - Establishes system-wide library usage
-- - Provides a baseline before breaking results down by branch
-- - Helps understand:
--   "Are fine collection trends increasing or decreasing over time?"

SELECT
  COUNT(*) AS checkout_count,
  ROUND(SUM(fine_amount), 2) AS total_fine_amount,
  ROUND(AVG(fine_amount), 2) AS avg_fine_amount
FROM checkout;
