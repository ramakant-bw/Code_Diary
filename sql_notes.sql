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