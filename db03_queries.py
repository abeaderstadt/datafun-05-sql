import sqlite3
import pandas as pd
import pathlib
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

# Define database path
db_file = "project.sqlite3"

# Define the folder containing SQL files  
sql_queries_folder = pathlib.Path("sql_queries")
sql_files = [
    sql_queries_folder / "query_aggregation.sql",
    sql_queries_folder / "query_filter.sql",
    sql_queries_folder / "query_group_by.sql",
    sql_queries_folder / "query_join.sql",
    sql_queries_folder / "query_sorting.sql"
]

def execute_query(query):
    """Executes a given SQL query and returns the result as a DataFrame."""
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()
    
    try:
        cursor.execute(query)
        rows = cursor.fetchall()
        logging.info(f"Executed query: {query}")
    except sqlite3.Error as e:
        logging.error(f"SQLite error: {e}")
        rows = []

    conn.close()
    return pd.DataFrame(rows, columns=[description[0] for description in cursor.description])

def execute_sql_files():
    """Reads SQL files, executes them, and prints the results."""
    for sql_file in sql_files:
        logging.info(f"\nExecuting SQL file: {sql_file}")
        try:
            with open(sql_file, 'r', encoding='utf-8') as file:
                sql_script = file.read()
                # Split the script into individual queries (statements separated by semicolons)
                queries = [query.strip() for query in sql_script.split(';') if query.strip()]
                
                for query in queries:
                    result_df = execute_query(query)
                    if not result_df.empty:
                        logging.info(f"Query Results for:\n{query}\n")
                        logging.info(f"{result_df}")
                    else:
                        logging.info(f"No results for query: {query}")
        except FileNotFoundError:
            logging.error(f"Error: {sql_file} not found.")

def main():
    execute_sql_files()  # Execute the queries and display results

if __name__ == "__main__":
    main()
