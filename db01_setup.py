import sqlite3
import pandas as pd
import pathlib
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

# Define database path
db_file = "project.sqlite3"  

# Define the folder containing CSV files
data_folder = pathlib.Path("data")

# Define the folder containing SQL files 
sql_folder = pathlib.Path("sql_create") 
sql_files = [
    sql_folder / "01_drop_tables.sql",
    sql_folder / "02_create_tables.sql",
    sql_folder / "03_insert_records.sql"
]

def create_database():
    """Creates the SQLite database file if it doesn't exist."""
    try:
        conn = sqlite3.connect(db_file)  
        conn.close()  
        logging.info(f"Database '{db_file}' created successfully.")
    except sqlite3.Error as e:
        logging.error(f"SQLite error while creating database: {e}")

def execute_sql_file(cursor, filename):
    """ Reads an SQL file and executes its commands. """
    sql_path = sql_folder / filename.name  # Correct
    if sql_path.exists():
        with open(sql_path, 'r', encoding='utf-8') as file:
            sql_script = file.read()
            cursor.executescript(sql_script)
        logging.info(f"Executed SQL file: {filename}")
    else:
        logging.warning(f"Warning: {filename} not found in {data_folder}")

def setup_database():
    """ Connects to SQLite, executes SQL files, and sets up the database. """
    try:
        create_database()  # Ensure the database exists first
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()

        logging.info("Connected to database successfully.")

        # Execute SQL files in order
        for sql_file in sql_files:
            logging.info(f"Executing {sql_file}...")
            execute_sql_file(cursor, sql_file)

        conn.commit()
        logging.info("Database setup completed successfully.")

    except sqlite3.Error as e:
        logging.error(f"SQLite error: {e}")

    finally:
        conn.close()
        logging.info("Database connection closed.")

# Main function to run the setup
def main():
    setup_database() 

if __name__ == "__main__":
    main()
