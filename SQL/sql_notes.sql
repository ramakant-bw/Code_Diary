-- 1. CREATE DATABASE: Creates a new database.
-- Example:
CREATE DATABASE mydatabase;

 

-- 2. CREATE TABLE: Creates a new table within a database.
-- Example:
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    join_date DATE
);



-- 3. INSERT INTO: Inserts new rows into a table.
-- Example:
INSERT INTO users (username, email, join_date) VALUES ('john_doe', 'john.doe@example.com', '2023-01-15');



-- 4. SELECT: Retrieves data from one or more tables.
-- Example:
SELECT * FROM users;



-- 5. WHERE: Filters the rows returned by a SELECT statement.
-- Example:
SELECT * FROM users WHERE join_date > '2023-01-01';



-- 6. UPDATE: Modifies existing data in a table.
-- Example:
UPDATE users SET email = 'john.new@example.com' WHERE username = 'john_doe';



-- 7. DELETE: Removes rows from a table.
-- Example:
DELETE FROM users WHERE username = 'john_doe';



-- 8. ALTER TABLE: Modifies the structure of an existing table.
-- Example:
ALTER TABLE users ADD COLUMN last_login TIMESTAMP;



-- 9. DROP TABLE: Deletes a table from the database.
-- Example:
DROP TABLE users;



-- 10. CREATE INDEX: Creates an index on a column to improve query performance.
-- Example:
CREATE INDEX idx_username ON users (username);



-- 11. DROP INDEX: Removes an index.
-- Example:
DROP INDEX idx_username;



-- 12. JOIN: Combines rows from two or more tables based on a related column.
-- Example:
SELECT users.username, orders.order_date FROM users JOIN orders ON users.id = orders.user_id;



-- 13. GROUP BY: Groups rows with the same values in one or more columns into a summary row.
-- Example:
SELECT join_date, COUNT(*) FROM users GROUP BY join_date;



-- 14. ORDER BY: Sorts the result set of a query.
-- Example:
SELECT * FROM users ORDER BY join_date DESC;



-- 15. LIMIT: Limits the number of rows returned by a query.
-- Example:
SELECT * FROM users LIMIT 10;



-- 16. COUNT: Returns the number of rows that match a specified criterion.
-- Example:
SELECT COUNT(*) FROM users;



-- 17. AVG: Calculates the average value of a numeric column.
-- Example:
SELECT AVG(order_total) FROM orders;



-- 18. SUM: Calculates the sum of values in a numeric column.
-- Example:
SELECT SUM(order_total) FROM orders;



-- 19. MAX: Returns the maximum value in a column.
-- Example:
SELECT MAX(order_total) FROM orders;



-- 20. MIN: Returns the minimum value in a column.
-- Example:
SELECT MIN(order_total) FROM orders;



-- Trigger Function in PostgreSQL
CREATE OR REPLACE FUNCTION update_user_last_login()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_login = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_user_last_login
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_user_last_login();


---------------------------------------------------
Example

-- ============================================
-- Example 1: Audit salary changes in employees
-- ============================================

-- Step 1: Create the employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    salary NUMERIC NOT NULL
);

-- Step 2: Create the audit log table
CREATE TABLE employee_audit (
    audit_id SERIAL PRIMARY KEY,
    employee_id INT,
    old_salary NUMERIC,
    new_salary NUMERIC,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Create the trigger function to log salary changes
CREATE OR REPLACE FUNCTION log_salary_change()
RETURNS TRIGGER AS $$
BEGIN
    -- Only log the change if the salary was modified
    IF NEW.salary <> OLD.salary THEN
        INSERT INTO employee_audit (employee_id, old_salary, new_salary)
        VALUES (OLD.id, OLD.salary, NEW.salary);
    END IF;
    RETURN NEW; -- Return the updated row
END;
$$ LANGUAGE plpgsql;

-- Step 4: Attach the trigger to the employees table
CREATE TRIGGER trg_log_salary_change
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_salary_change();

-- ============================================
-- Example 2: Prevent deletion of VIP customers
-- ============================================

-- Step 1: Create the customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    is_vip BOOLEAN DEFAULT FALSE
);

-- Step 2: Create the trigger function to block VIP deletion
CREATE OR REPLACE FUNCTION prevent_vip_deletion()
RETURNS TRIGGER AS $$
BEGIN
    -- Raise an error if the customer is marked as VIP
    IF OLD.is_vip THEN
        RAISE EXCEPTION 'Cannot delete VIP customer: %', OLD.name;
    END IF;
    RETURN OLD; -- Return the row to be deleted (if allowed)
END;
$$ LANGUAGE plpgsql;

-- Step 3: Attach the trigger to the customers table
CREATE TRIGGER trg_prevent_vip_deletion
BEFORE DELETE ON customers
FOR EACH ROW
EXECUTE FUNCTION prevent_vip_deletion();

---------------------------------------------------------------------------------------------------------
-- 📦 Create a sample table to store product information
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,       -- Unique ID for each product
    name VARCHAR(100) NOT NULL,          -- Product name
    price NUMERIC(10, 2) NOT NULL,       -- Product price
    stock INT DEFAULT 0                  -- Quantity in stock
);

-- 🛠️ Create a stored procedure to add a new product
CREATE OR REPLACE PROCEDURE add_product(
    p_name VARCHAR,
    p_price NUMERIC,
    p_stock INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products (name, price, stock)
    VALUES (p_name, p_price, p_stock);
END;
$$;

-- 🛠️ Create a stored procedure to update stock for a product
CREATE OR REPLACE PROCEDURE update_stock(
    p_product_id INT,
    p_new_stock INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE products
    SET stock = p_new_stock
    WHERE product_id = p_product_id;
END;
$$;

-- 🛠️ Create a stored procedure to delete a product by ID
CREATE OR REPLACE PROCEDURE delete_product(
    p_product_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM products
    WHERE product_id = p_product_id;
END;
$$;

-- 🧪 Call the procedures to test them
-- Add a new product
CALL add_product('Laptop', 85000.00, 10);

-- Update stock
CALL update_stock(1, 15);

-- Delete a product
CALL delete_product(1);

-- 🔍 View remaining products
SELECT * FROM products;

-----------------------------------------------------------------------------------------------------------------------
--SQL CTE Example

-- Step 1: Create the 'employees' table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT NOT NULL,
    salary NUMERIC NOT NULL
);

-- Step 2: Insert sample data into 'employees'
INSERT INTO employees (name, department, salary) VALUES
('Alice', 'Engineering', 80000),
('Bob', 'Engineering', 85000),
('Carol', 'HR', 60000),
('Dave', 'HR', 62000),
('Eve', 'Marketing', 70000),
('Frank', 'Marketing', 72000),
('Grace', 'Engineering', 90000),
('Heidi', 'Sales', 75000),
('Ivan', 'Sales', 77000),
('Judy', 'Finance', 95000),
('Mallory', 'Finance', 97000);

-- Step 3: Use a CTE to compute average salary per department and get top 3 departments
WITH dept_avg_salary AS (
    -- Calculate average salary for each department
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM
        employees
    GROUP BY
        department
)

-- Select top 3 departments with highest average salary
SELECT
    department,
    avg_salary
FROM
    dept_avg_salary
ORDER BY
    avg_salary DESC
LIMIT 3;
-------------------------------------------------------------------------------------------------------------------------------

--In PostgreSQL, you can use IF...ELSE logic in two main contexts:

--Example 1: IF...ELSE inside a DO block (PL/pgSQL)

-- This is used for procedural logic, not in plain SQL queries.

-- This block checks a value and prints a message based on a condition
DO $$
DECLARE
    salary NUMERIC := 75000;  -- Declare a sample salary variable
BEGIN
    IF salary > 90000 THEN
        RAISE NOTICE 'High salary';
    ELSIF salary > 70000 THEN
        RAISE NOTICE 'Good salary';
    ELSE
        RAISE NOTICE 'Average or low salary';
    END IF;
END $$;



-- Explanation: IF ... ELSIF ... ELSE is used for conditional logic.

-- DO $$ ... $$; runs an anonymous code block.

-- DECLARE defines variables.

-- IF...ELSIF...ELSE handles branching logic.

-- RAISE NOTICE outputs a message to the console/log.


-- Example 2: Inline IF using CASE in a SELECT query

-- This is what you use when writing normal SQL.

-- Adds a column to categorize employees based on salary
SELECT
    name,
    salary,
    CASE
        WHEN salary > 90000 THEN 'High'
        WHEN salary > 70000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM
    employees;


-- Explanation:

-- CASE works like IF...ELSE but within a SELECT query.

-- You evaluate multiple conditions and return a value based on the first match.

-- The result is shown as a new column (salary_category here).

-- 💡 Use Which One?
-- Use case	Syntax to Use
-- In functions/procedural logic	IF...ELSE in PL/pgSQL
-- Inside SQL queries	CASE expression



------------------------------------------------------------------------------------------------------------------------------------

-- SQL Window Functions Example
-- Step 1: Create the 'sales' table
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    salesperson VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    amount NUMERIC NOT NULL,
    sale_date DATE NOT NULL
);
-- Step 2: Insert sample data into 'sales'
INSERT INTO sales (salesperson, region, amount, sale_date) VALUES
('Alice', 'North', 5000, '2023-01-10'),
('Bob', 'South', 7000, '2023-01-15'),
('Alice', 'North', 6000, '2023-02-10'),
('Bob', 'South', 8000, '2023-02-15'),
('Charlie', 'East', 4000, '2023-01-20'),
('Charlie', 'East', 4500, '2023-02-20'),
('Alice', 'North', 7000, '2023-03-10'),
('Bob', 'South', 9000, '2023-03-15'),
('Charlie', 'East', 5000, '2023-03-20');
-- Step 3: Use window functions to analyze sales data
SELECT
    salesperson,
    region,
    amount,
    sale_date,
    SUM(amount) OVER (PARTITION BY salesperson ORDER BY sale_date) AS running_total,
    AVG(amount) OVER (PARTITION BY region) AS avg_region_sales,
    RANK() OVER (PARTITION BY region ORDER BY amount DESC) AS sales_rank
FROM
    sales;
-- Explanation:
-- SUM() OVER (PARTITION BY ... ORDER BY ...): Calculates a running total of sales for each salesperson ordered by sale date.
-- AVG() OVER (PARTITION BY ...): Computes the average sales amount for each region.    
-- RANK() OVER (PARTITION BY ... ORDER BY ...): Assigns a rank to each sale within its region based on the amount, with the highest amount getting rank 1.
------------------------------------------------------------------------------------------------------------------------------------