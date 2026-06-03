-- sql/duckdb/beaderstadt_library_query_checkout_count.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Answer a basic activity question:
-- "How many checkout events have occurred?"
--
-- This query operates on the dependent/child table.
--
-- WHY:
-- - Volume and revenue are different signals
-- - A branch may have many checkouts or few checkouts, but each pattern tells us something different about usage
-- - Analysts often start by understanding event counts
--   before analyzing impact

SELECT
  COUNT(*) AS checkout_count
FROM checkout;
