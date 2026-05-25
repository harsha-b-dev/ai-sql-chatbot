import mysql.connector
import os
from dotenv import load_dotenv
from database import get_connection_config

load_dotenv()

def load_schema():

    conn = mysql.connector.connect(**get_connection_config())

    cursor = conn.cursor()

    cursor.execute("""
        SELECT table_name, column_name
        FROM information_schema.columns
        WHERE table_schema=%s
    """, (os.getenv("MYSQL_DB"),))

    schema = {}

    for table, column in cursor.fetchall():
        schema.setdefault(table, []).append(column)

    docs = []

    for table, cols in schema.items():
        docs.append(f"Table {table}: {', '.join(cols)}")

    # 🔥 RELATIONSHIPS (VERY IMPORTANT)
    relationships = [
        "customers.customer_id = orders.customer_id",
        "orders.order_id = order_items.order_id",
        "order_items.product_id = products.product_id",
        "orders.order_id = payments.order_id",
        "orders.order_id = shipments.order_id"
    ]

    table_descriptions = [
        "customers: stores customer personal details",
        "orders: stores order info and payment_method column",
        "order_items: connects orders with products",
        "products: product catalog",
        "payments: payment status only (not payment_method)",
        "shipments: shipment tracking"
    ]

    docs.append("Relationships:")
    docs.extend(relationships)

    docs.append("Table Descriptions:")
    docs.extend(table_descriptions)

    return docs
