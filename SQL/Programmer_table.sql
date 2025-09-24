CREATE TYPE gender as ENUM ('Male', 'Female', 'Other')

Create Table user1 (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	gender VARCHAR,
	date_of_birth DATE,
	created_at TIMESTAMP 
);

SELECT * from user1;

insert into user1 (name, email, gender, date_of_birth) values ( 'sham', 'sham@gmail.com', 'Male', '01/05/2000');

alter table programmers alter column created_at set DEFAULT Now();

alter table user1 rename to programmers;

SELECT * from programmers;

insert into programmers (name, email, gender, date_of_birth) values ( 'sunder', 'sunder@gmail.com', 'Male', '04/08/2005');

update programmers set created_at = now() where id = 3

insert into programmers values ( 4,'Raju', 'raju@gmail.com', 'Male', '05/08/2008');

insert into programmers values ( 5,'Yogi', 'yogi@gmail.com', 'Male', '02/05/2010');


