# Data Analytics Fundamentals

> Professional Python for Data Analytics

This project comes with professional documentation.

Explore the tabs and sidebars for content.

This is where we present our analytics work.

---

To customize, modify:

- `docs/` (folder with Markdown files)
- `mkdocs.yaml` (in the root project folder)
  - scroll to the end for the `nav` section

---

## Custom Project

### Dataset
I used the library dataset that includes two related tables: branch and checkout. The branch data contains information about each library location, and the checkout data tracks individual checkouts, including material type, duration, fine amount, and date.

### Signals
The main signals in this project came from checkout activity and fine amounts in the dataset. This included values like checkout_duration, fine_amount, and branch_location. I also created a derived field called fine_per_day, which normalizes fines by checkout duration. These signals were used to compare branch performance and understand differences in efficiency.

### Experiments
I updated all 7 SQL files and the Python pipeline script to use the library dataset instead of the original retail template data, ensuring the full ETL process worked end-to-end. Then I ran my custom SQL queries starting with basic counts and aggregations to explore the dataset. After that, I modified my KPI query by adding the derived metric fine_per_day, which allowed me to compare branches not just by total fines, but by how efficiently those fines are generated relative to checkout duration.

### Results
The pipeline ran successfully and returned consistent results across all queries. The Downtown Branch showed the highest total fines as well as the highest fine_per_day value at 0.0714. Other branches had lower totals and lower efficiency values, showing clear differences in performance.

### Interpretation
This shows that branch performance can look very different depending on how you measure it. Looking only at total fines makes the Downtown Branch stand out, but the fine_per_day metric adds more context by showing how efficiently those fines are generated. This really highlights how derived metrics can give a more complete picture of library activity and help identify which branches are performing more effectively.

### Terminal Output (Proof of Execution)
2026-06-02 20:17:12 | INFO | P05 | === RUN START ===
2026-06-02 20:17:12 | INFO | P05 | project=P05 Pipeline Example (DuckDB)
2026-06-02 20:17:12 | INFO | P05 | repo_dir=datafun-05-sql
2026-06-02 20:17:12 | INFO | P05 | python=3.14.3
2026-06-02 20:17:12 | INFO | P05 | os=Windows 11
2026-06-02 20:17:12 | INFO | P05 | shell=powershell
2026-06-02 20:17:12 | INFO | P05 | cwd=.
2026-06-02 20:17:12 | INFO | P05 | github_actions=False
2026-06-02 20:17:12 | INFO | P05 | START main()
2026-06-02 20:17:12 | INFO | P05 | ROOT_DIR: C:\Repos\datafun-05-sql
2026-06-02 20:17:12 | INFO | P05 | DATA_DIR: C:\Repos\datafun-05-sql\data\library
2026-06-02 20:17:12 | INFO | P05 | SQL_DIR: C:\Repos\datafun-05-sql\sql\duckdb
2026-06-02 20:17:12 | INFO | P05 | DB_PATH: C:\Repos\datafun-05-sql\artifacts\duckdb\library.duckdb
2026-06-02 20:17:12 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_clean.sql
2026-06-02 20:17:12 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_clean.sql
2026-06-02 20:17:12 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_bootstrap.sql
2026-06-02 20:17:12 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_bootstrap.sql
2026-06-02 20:17:12 | INFO | P05 |
2026-06-02 20:17:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_query_branch_count.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | beaderstadt_library_query_branch_count.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | branch_count
2026-06-02 20:17:12 | INFO | P05 | 3
2026-06-02 20:17:12 | INFO | P05 |
2026-06-02 20:17:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_query_checkout_count.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | beaderstadt_library_query_checkout_count.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | checkout_count
2026-06-02 20:17:12 | INFO | P05 | 5
2026-06-02 20:17:12 | INFO | P05 |
2026-06-02 20:17:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_query_checkouts_by_branch.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | beaderstadt_library_query_checkouts_by_branch.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | branch_name, branch_id, checkout_count, total_fine_amount, avg_fine_amount
2026-06-02 20:17:12 | INFO | P05 | Downtown Branch, B001, 2, 1.5, 0.75
2026-06-02 20:17:12 | INFO | P05 | East Side Branch, B002, 2, 0.5, 0.25
2026-06-02 20:17:12 | INFO | P05 | South Branch, B003, 1, 0.0, 0.0
2026-06-02 20:17:12 | INFO | P05 |
2026-06-02 20:17:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\beaderstadt_library_query_kpi_checkouts.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | beaderstadt_library_query_kpi_checkouts.sql
2026-06-02 20:17:12 | INFO | P05 | ====================================
2026-06-02 20:17:12 | INFO | P05 | branch_id, branch_name, city, system_name, checkout_count, total_fine_amount, avg_fine_amount, fine_per_day
2026-06-02 20:17:12 | INFO | P05 | B001, Downtown Branch, Duluth, Arrowhead Library System, 2, 1.5, 0.75, 0.0714
2026-06-02 20:17:12 | INFO | P05 | B002, East Side Branch, Ely, Arrowhead Library System, 2, 0.5, 0.25, 0.0179
2026-06-02 20:17:12 | INFO | P05 | B003, South Branch, Mankato, Regional Library Network, 1, 0.0, 0.0, 0.0
2026-06-02 20:17:12 | INFO | P05 | END main()
