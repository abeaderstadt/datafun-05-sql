import sqlite3
import logging

# Define database path
db_file = "project.sqlite3"  # Database path

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

def get_db_connection():
    """Returns a connection to the SQLite database."""
    try:
        conn = sqlite3.connect(db_file)
        return conn
    except sqlite3.Error as e:
        logging.error(f"SQLite error: {e}")
        return None

def run_sql_script(script_path):
    """Execute an SQL script from a file."""
    conn = get_db_connection()
    if conn is None:
        logging.error("Database connection failed.")
        return

    cursor = conn.cursor()

    try:
        with open(script_path, "r") as file:
            cursor.executescript(file.read())
        conn.commit()
        logging.info(f"Executed: {script_path}")
    except sqlite3.Error as e:
        logging.error(f"SQLite error: {e}")
    except FileNotFoundError:
        logging.error(f"Error: The file {script_path} was not found.")
    finally:
        conn.close()

if __name__ == "__main__":
    run_sql_script("sql_features/update_records.sql")
    run_sql_script("sql_features/delete_records.sql")
