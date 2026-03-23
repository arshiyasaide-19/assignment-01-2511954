## Anomaly Analysis

### Insert Anomaly
In the orders_flat table, product information such as product_id, product_name, category, and unit_price only appears when an order is recorded.

If the company wants to add a new product before any customer has ordered it, it cannot be inserted without also creating an order record.

### Update Anomaly
Customer and sales representative details appear multiple times in the dataset. If information such as the sales representative's office address changes, it must be updated in many rows.

### Delete Anomaly
If an order row is deleted and that order was the only record containing information about a product, then all product information will also be lost.


## Normalization Justification

The original dataset stored all information such as customer details, product details, sales representative details, and order information in a single table called orders_flat. This structure caused several data anomalies including insert anomalies, update anomalies, and delete anomalies.

To solve these issues, the database was normalized into multiple related tables: customers, products, sales_reps, orders, and order_items.

The customers table stores customer-related information separately so that customer data does not repeat for every order. The products table stores product details independently so new products can be added without requiring an order. The sales_reps table keeps sales representative information separate to avoid repeating their details across multiple orders.

The orders table stores transaction-level data and connects customers and sales representatives through foreign keys. The order_items table stores the relationship between orders and products and records the quantity of each product in an order.

This normalization follows Third Normal Form (3NF) because each table stores data about a single entity, non-key attributes depend only on the primary key, and there are no transitive dependencies. This structure improves data integrity, reduces redundancy, and makes the database easier to maintain and query.