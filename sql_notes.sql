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
