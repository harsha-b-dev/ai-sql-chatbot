import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()


def get_connection_config():
    config = {
        "host": os.getenv("MYSQL_HOST"),
        "port": int(os.getenv("MYSQL_PORT", "3306")),
        "user": os.getenv("MYSQL_USER"),
        "password": os.getenv("MYSQL_PASSWORD"),
        "database": os.getenv("MYSQL_DB"),
    }

    if os.getenv("MYSQL_SSL_DISABLED", "").lower() in {"1", "true", "yes"}:
        config["ssl_disabled"] = True

    return config


def get_connection():
    return mysql.connector.connect(**get_connection_config())


def run_query(sql):

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(sql)

    columns = [col[0] for col in cursor.description]
    rows = cursor.fetchall()

    cursor.close()
    conn.close()

    return columns, rows


def list_tables():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("SHOW TABLES")
    tables = [row[0] for row in cursor.fetchall()]

    cursor.close()
    conn.close()

    return tables


def get_table_contents(table_name, limit=100):
    tables = list_tables()

    if table_name not in tables:
        raise ValueError("Invalid table name")

    safe_limit = min(max(int(limit), 1), 500)
    escaped_table = table_name.replace("`", "``")

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(f"SELECT * FROM `{escaped_table}` LIMIT {safe_limit}")

    columns = [col[0] for col in cursor.description]
    rows = cursor.fetchall()

    cursor.close()
    conn.close()

    return columns, rows
