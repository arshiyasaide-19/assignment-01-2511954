 Use assignment_db;
 
 CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- ============================
-- FACT TABLE
-- ============================

CREATE TABLE fact_sales (
    transaction_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ============================
-- INSERT INTO DIM TABLES
-- ============================

INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-01-03', 3, 1, 2024);

INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi');

INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'T-Shirt', 'Clothing'),
(3, 'Milk', 'Groceries');

-- ============================
-- INSERT INTO FACT TABLE
-- ============================

INSERT INTO fact_sales VALUES
(101, 1, 1, 1, 2, 50000, 100000),
(102, 1, 2, 2, 3, 800, 2400),
(103, 2, 1, 3, 5, 50, 250),
(104, 2, 2, 1, 1, 50000, 50000),
(105, 3, 1, 2, 4, 800, 3200),
(106, 3, 2, 3, 6, 50, 300),
(107, 1, 1, 1, 1, 50000, 50000),
(108, 2, 2, 2, 2, 800, 1600),
(109, 3, 1, 3, 3, 50, 150),
(110, 1, 2, 1, 2, 50000, 100000);