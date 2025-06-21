/*use the new schema*/
use testdb;
/* Bulk Inserted new records in table users */
insert into users (username, firstName, lastName, age)
values
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

/* single Insert new records in table users */

insert into users (username, firstName, lastName, age)
values
 ('Deeps', 'Deepa', 'Ingole', 28);

/* update existing record in table users */

update users set firstName = 'Jane', lastName = 'Doe' where id =1;

/* delete the records in table users */

delete from users where username = 'Deeps';

 /* select all records from table users */

select * from users;

 /* select all records from table users for first 10 */

select * from users limit 10;

 /* show fullname as new column  from table users  c with conditions*/
select concat(firstName, ' ', lastName) as fullName from users where age >20