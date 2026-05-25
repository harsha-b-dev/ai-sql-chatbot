import mysql.connector
import os
from dotenv import load_dotenv
from database import get_connection_config
load_dotenv()

def get_schema_rules():


    conn = mysql.connector.connect(**get_connection_config())
    cursor = conn.cursor()

    cursor.execute("""
        SELECT table_name, column_name
        FROM information_schema.columns
        WHERE table_schema=%s
        ORDER BY table_name
    """, (os.getenv("MYSQL_DB"),))

    tables = {}

    for table, column in cursor.fetchall():
        tables.setdefault(table, []).append(column)

    cursor.close()
    conn.close()

    # 🔥 build strict rule text
    rules = []

    for table, cols in tables.items():
        rules.append(f"{table} table columns: {', '.join(cols)}")

    return "\n".join(rules)
