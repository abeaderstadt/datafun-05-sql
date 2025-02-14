import sqlite3

def run_sql_script(script_path):
    """Execute an SQL script from a file."""
    conn = sqlite3.connect("project.sqlite3")  # Ensure the correct database name is used
    cursor = conn.cursor()
    
    with open(script_path, "r") as file:
        cursor.executescript(file.read())

    conn.commit()
    conn.close()
    print(f"Executed: {script_path}")

if __name__ == "__main__":
    run_sql_script("sql_features/update_records.sql")
    run_sql_script("sql_features/delete_records.sql")
