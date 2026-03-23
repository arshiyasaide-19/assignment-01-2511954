CREATE DATABASE IF NOT EXISTS retail_dw;
USE retail_dw;

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    calendar_date DATE NOT NULL,
    day_no INT,
    month_no INT,
    month_name VARCHAR(20),
    quarter_no INT,
    year_no INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30) NOT NULL
);

 CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    transaction_id VARCHAR(20) NOT NULL,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date (date_id, calendar_date, day_no, month_no, month_name, quarter_no, year_no) VALUES
(20230115, '2023-01-15', 15, 1, 'January', 1, 2023),
(20230205, '2023-02-05', 5, 2, 'February', 1, 2023),
(20230331, '2023-03-31', 31, 3, 'March', 1, 2023),
(20230428, '2023-04-28', 28, 4, 'April', 2, 2023),
(20230521, '2023-05-21', 21, 5, 'May', 2, 2023),
(20230604, '2023-06-04', 4, 6, 'June', 2, 2023),
(20230722, '2023-07-22', 22, 7, 'July', 3, 2023),
(20230809, '2023-08-09', 9, 8, 'August', 3, 2023),
(20231003, '2023-10-03', 3, 10, 'October', 4, 2023),
(20231118, '2023-11-18', 18, 11, 'November', 4, 2023),
(20231208, '2023-12-08', 8, 12, 'December', 4, 2023),
(20231029, '2023-10-29', 29, 10, 'October', 4, 2023);

INSERT INTO dim_store (store_id, store_name, store_city) VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

INSERT INTO dim_product (product_id, product_name, category) VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Grocery'),
(6, 'Biscuits', 'Grocery'),
(7, 'Jacket', 'Clothing'),
(8, 'Jeans', 'Clothing'),
(9, 'Milk 1L', 'Grocery'),
(10, 'Headphones', 'Electronics');

INSERT INTO fact_sales (sales_id, transaction_id, date_id, store_id, product_id, units_sold, unit_price, total_amount) VALUES
(1, 'TXN5000', 20230809, 1, 1, 3, 49262.78, 147788.34),
(2, 'TXN5001', 20231208, 1, 2, 11, 23226.12, 255487.32),
(3, 'TXN5002', 20230205, 1, 3, 20, 48703.39, 974067.80),
(4, 'TXN5004', 20230115, 1, 4, 10, 58851.01, 588510.10),
(5, 'TXN5005', 20230809, 3, 5, 12, 52464.00, 629568.00),
(6, 'TXN5006', 20230331, 4, 4, 6, 58851.01, 353106.06),
(7, 'TXN5008', 20231208, 3, 6, 9, 27469.99, 247229.91),
(8, 'TXN5010', 20230604, 1, 7, 15, 30187.24, 452808.60),
(9, 'TXN5012', 20230521, 3, 10, 13, 42343.15, 550460.95),
(10, 'TXN5013', 20230428, 5, 9, 10, 43374.39, 433743.90),
(11, 'TXN5014', 20231118, 2, 7, 5, 30187.24, 150936.20),
(12, 'TXN5033', 20231029, 5, 5, 8, 52464.00, 419712.00);