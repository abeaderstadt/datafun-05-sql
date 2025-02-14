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

def create_database():
    """Creates the SQLite database file if it doesn't exist."""
    try:
        conn = sqlite3.connect(db_file)  
        conn.close()  
        print(f"Database '{db_file}' created successfully.")
    except sqlite3.Error as e:
        print(f"SQLite error while creating database: {e}")

def execute_sql_file(cursor, filename):
    """ Reads an SQL file and executes its commands. """
    sql_path = filename
    if sql_path.exists():
        with open(str(sql_path), 'r', encoding='utf-8') as file:
            sql_script = file.read()
            cursor.executescript(sql_script)
    else:
        print(f"Warning: {filename} not found in {sql_queries_folder}")

def fetch_query_results(cursor, query):
    """Executes a query and fetches the results."""
    cursor.execute(query)
    return cursor.fetchall()

def setup_database():
    """ Connects to SQLite, executes SQL files, and sets up the database. """
    try:
        create_database()  # Ensure the database exists first
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        print("Connected to database successfully.")

        # Execute SQL files in order
        for sql_file in sql_files:
            print(f"Executing {sql_file}...")
            execute_sql_file(cursor, sql_file)

        conn.commit()
        print("Database setup completed successfully.")

        # Fetch and display query results
        query = "SELECT * FROM books WHERE genre = 'Fantasy';"  
        results = fetch_query_results(cursor, query)
        print(f"Query results:\n{results}")

        # Create a DataFrame to summarize a query
        df = pd.read_sql_query("SELECT genre, COUNT(*) as book_count FROM books GROUP BY genre;", conn)
        print(df)

        # Plot a bar chart of books per genre
        df.plot(kind='bar', x='genre', y='book_count', title="Books Per Genre", legend=False)
        plt.xlabel("Genre")
        plt.ylabel("Book Count")
        plt.show()

    except sqlite3.Error as e:
        print(f"SQLite error: {e}")

    finally:
        conn.close()
        print("Database connection closed.")

# Main function to run the setup
def main():
    setup_database() 

if __name__ == "__main__":
    main()
