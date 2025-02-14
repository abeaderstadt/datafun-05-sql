import sqlite3
import pandas as pd
import pathlib
import matplotlib.pyplot as plt 

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
    
    cursor.execute(query)
    rows = cursor.fetchall()

    conn.close()
    return pd.DataFrame(rows, columns=[description[0] for description in cursor.description])

def execute_sql_files():
    """Reads SQL files, executes them, and prints the results."""
    for sql_file in sql_files:
        print(f"\nExecuting SQL file: {sql_file}")
        try:
            with open(sql_file, 'r', encoding='utf-8') as file:
                sql_script = file.read()
                queries = [query.strip() for query in sql_script.split(';') if query.strip()]
                
                for query in queries:
                    result_df = execute_query(query)
                    print(f"Query Results for:\n{query}\n")
                    print(result_df)

                    # Create a bar chart of 'genre' and 'book_count' 
                    if 'genre' in result_df.columns and 'book_count' in result_df.columns:
                        # Plotting the bar chart for the results
                        result_df.plot(kind='bar', x='genre', y='book_count', title="Books Per Genre", legend=False)
                        plt.xlabel("Genre")
                        plt.ylabel("Book Count")
                        plt.show()

        except FileNotFoundError:
            print(f"Error: {sql_file} not found.")

def main():
    execute_sql_files()  # Execute the queries and display results

if __name__ == "__main__":
    main()
