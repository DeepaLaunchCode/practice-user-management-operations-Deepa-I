/* Switch to the target database */
USE testdb;

/* Task 1: Bulk insert new records into the users table */
INSERT INTO users (username, firstName, lastName, age)
VALUES
    ('asmith', 'Alice', 'Smith', 20),
    ('bdoe', 'Bob', 'Doe', 33),
    ('cjohnson', 'Charlie', 'Johnson', 41),
    ('dlee', 'David', 'Lee', 19),
    ('ejones', 'Eve', 'Jones', 30),
    ('fkim', 'Frank', 'Kim', 15),
    ('gwhite', 'Grace', 'White', 22),
    ('hwang', 'Henry', 'Wang', 19),
    ('ijones', 'Ivy', 'Jones', 50),
    ('jdoe', 'John', 'Doe', 65),
    ('klee', 'Kevin', 'Lee', 62),
    ('lchen', 'Linda', 'Chen', 24),
    ('mlee', 'Michael', 'Lee', 29),
    ('nkim', 'Nancy', 'Kim', 18),
    ('ojohnson', 'Oscar', 'Johnson', 40),
    ('pchen', 'Peter', 'Chen', 55),
    ('qwang', 'Quincy', 'Wang', 28),
    ('rjones', 'Rachel', 'Jones', 37),
    ('slee', 'Sam', 'Lee', 21),
    ('tkim', 'Tina', 'Kim', 26);

/* Task 2: Single insert of a new record into the users table */
INSERT INTO users (username, firstName, lastName, age)
VALUES ('Deeps', 'Deepa', 'Ingole', 28);

/* Task 3: Update an existing record in the users table */
UPDATE users 
SET firstName = 'Jane', lastName = 'Doe' 
WHERE id = 1;

/* Task 4: Delete a specific record from the users table */
DELETE FROM users 
WHERE username = 'Deeps';

/* Task 5: Select all records from the users table */
SELECT * FROM users;

/* Task 6: Select the first 10 records from the users table */
SELECT * FROM users 
LIMIT 10;

/* Task 7: Select full names of users with age greater than 20 */
SELECT 
    CONCAT(firstName, ' ', lastName) AS fullName
FROM
    users
WHERE
    age > 20;