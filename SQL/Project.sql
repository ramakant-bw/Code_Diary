--Project 1

-- Creating Tables For Importing Datasets


-- 1st Table Cheese Production

	CREATE TABLE cheese_production (Year INTEGER,Period TEXT,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Domain TEXT,Value INTEGER
	);



-- 2nd Table Honye Production

	CREATE TABLE honey_production (
    Year INTEGER,
    Geo_Level TEXT,
    State_ANSI INTEGER,
    Commodity_ID INTEGER,
    Value INTEGER
	);


-- 3rd Table Milk Production
	
	CREATE TABLE milk_production (
    Year INTEGER,
    Period TEXT,
    Geo_Level TEXT,
    State_ANSI INTEGER,
    Commodity_ID INTEGER,
    Domain TEXT,
    Value INTEGER
  );


-- 4rd Table coffee_production


	CREATE TABLE coffee_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Value INTEGER
	);


-- 5ft Table egg_production


	CREATE TABLE egg_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Value INTEGER
	);



-- 6th Table state_lookup


	CREATE TABLE state_lookup (
	    State TEXT,
	    State_ANSI INTEGER
	);



-- 7th Table yogurt_production


	CREATE TABLE yogurt_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Domain TEXT,
	    Value INTEGER
	);

--------------------------------------------------------------------

-- Inserting data from datasets 


copy cheese_production from 'D:\DA20\Git_hub\Diary-SQL\cheese_production.csv' Delimiter ',' CSV Header;


-- 1. Problem
-- ERROR: value "2460538000" is out of range for type integer
-- Solution
-- We need to change int data type with bigint

alter table cheese_production 
alter column Value 
type BIGINT

-- 2. Problem
-- ERROR:  column "value" of relation "cheese_production" does not exist 
-- Due to column name 'value' it create error because it is reserve keyword in sql
-- Solution 
-- we need to rename it first

alter table cheese_production 
rename column value to c_value

-- ERROR:  column "value" does not exist 

-- we need to delete and recreate our tables

Drop Table cheese_production, honey_production, milk_production, coffee_production, egg_production, state_lookup, yogurt_production  

-- Now we create table with changed column name and data type BIGINT

-- 1st Table Cheese Production

	CREATE TABLE cheese_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Domain TEXT,
	    Quantity BIGINT
	);



-- 2nd Table Honye Production

	CREATE TABLE honey_production (
    Year INTEGER,
    Geo_Level TEXT,
    State_ANSI INTEGER,
    Commodity_ID INTEGER,
    Quantity BIGINT
	);


-- 3rd Table Milk Production
	
	CREATE TABLE milk_production (
    Year INTEGER,
    Period TEXT,
    Geo_Level TEXT,
    State_ANSI INTEGER,
    Commodity_ID INTEGER,
    Domain TEXT,
    Quantity BIGINT
  );


-- 4rd Table coffee_production


	CREATE TABLE coffee_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Quantity BIGINT
	);


-- 5ft Table egg_production


	CREATE TABLE egg_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Quantity BIGINT
	);



-- 6th Table state_lookup


	CREATE TABLE state_lookup (
	    State TEXT,
	    State_ANSI INTEGER
	);



-- 7th Table yogurt_production


	CREATE TABLE yogurt_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Domain TEXT,
	    Quantity BIGINT
	);

--------------------------------------------------------------------


-- Inserting data from CSV file

copy cheese_production from 'D:\DA20\Git_hub\Diary-SQL\cheese_production.csv' Delimiter ',' CSV Header;
copy coffee_production from 'D:\DA20\Git_hub\Diary-SQL\coffee_production.csv' Delimiter ',' CSV Header;
copy egg_production from 'D:\DA20\Git_hub\Diary-SQL\egg_production.csv' Delimiter ',' CSV Header;
copy honey_production from 'D:\DA20\Git_hub\Diary-SQL\honey_production.csv' Delimiter ',' CSV Header;
copy milk_production from 'D:\DA20\Git_hub\Diary-SQL\milk_production.csv' Delimiter ',' CSV Header;
copy state_lookup from 'D:\DA20\Git_hub\Diary-SQL\state_lookup.csv' Delimiter ',' CSV Header;
copy yogurt_production from 'D:\DA20\Git_hub\Diary-SQL\yogurt_production.csv' Delimiter ',' CSV Header;

select * from cheese_production
select * from milk_production


-- Let Take some question on this data
-- 1. Find the total milk production for the year 2023
select geo_level from cheese_production;


-- Same problem arise of reserved keyword with 'year' now we need to reapeat all process 

--Droping tables
Drop Table cheese_production, honey_production, milk_production, coffee_production, egg_production, state_lookup, yogurt_production  

--Creating table with new name

-- 1st Table Cheese Production

	CREATE TABLE cheese_production (
	    Years INTEGER,
	    Periods TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Domains TEXT,
	    Quantity BIGINT
	);



-- 2nd Table Honye Production

	CREATE TABLE honey_production (
    Years INTEGER,
    Geo_Level TEXT,
    State_ANSI INTEGER,
    Commodity_ID INTEGER,
    Quantity BIGINT
	);


-- 3rd Table Milk Production
	
	CREATE TABLE milk_production (
    Years INTEGER,
    Periods TEXT,
    Geo_Level TEXT,
    State_ANSI INTEGER,
    Commodity_ID INTEGER,
    Domains TEXT,
    Quantity BIGINT
  );


-- 4rd Table coffee_production


	CREATE TABLE coffee_production (
	    Years INTEGER,
	    Periods TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Quantity BIGINT
	);


-- 5ft Table egg_production


	CREATE TABLE egg_production (
	    Years INTEGER,
	    Periods TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Quantity BIGINT
	);



-- 6th Table state_lookup


	CREATE TABLE state_lookup (
	    States TEXT,
	    State_ANSI INTEGER
	);



-- 7th Table yogurt_production


	CREATE TABLE yogurt_production (
	    Years INTEGER,
	    Periods TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Domains TEXT,
	    Quantity BIGINT
	);

--------------------------------------------------------------------
-- Inserting data from CSV file

copy cheese_production from 'D:\DA20\Git_hub\Diary-SQL\cheese_production.csv' Delimiter ',' CSV Header;
copy coffee_production from 'D:\DA20\Git_hub\Diary-SQL\coffee_production.csv' Delimiter ',' CSV Header;
copy egg_production from 'D:\DA20\Git_hub\Diary-SQL\egg_production.csv' Delimiter ',' CSV Header;
copy honey_production from 'D:\DA20\Git_hub\Diary-SQL\honey_production.csv' Delimiter ',' CSV Header;
copy milk_production from 'D:\DA20\Git_hub\Diary-SQL\milk_production.csv' Delimiter ',' CSV Header;
copy state_lookup from 'D:\DA20\Git_hub\Diary-SQL\state_lookup.csv' Delimiter ',' CSV Header;
copy yogurt_production from 'D:\DA20\Git_hub\Diary-SQL\yogurt_production.csv' Delimiter ',' CSV Header;

select Periods from cheese_production;

select * from milk_production limit 10

-- Still problem not solved let's look for another solution

-- We can run bellow query in sql to look table schema info
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'milk_production';

-- we can use bellow command in psql query tool to look table column name in detail 
\d milk_production

--Problem Spoted due to extra spaces created in column name this error is come to solve this we can alter column name
ALTER TABLE milk_production RENAME COLUMN "    years" TO years;

-- or we can drop all table and taking care of this issue while recreating table

--Droping tables
Drop Table cheese_production, honey_production, milk_production, coffee_production, egg_production, state_lookup, yogurt_production  

--Creating table with care of no space created

-- 1st Table Cheese Production

  CREATE TABLE cheese_production (Years INTEGER,Periods TEXT,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Domains TEXT,Quantity BIGINT);

	
-- 2nd Table Honye Production

	CREATE TABLE honey_production (Years INTEGER,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Quantity BIGINT);


-- 3rd Table Milk Production
	
	CREATE TABLE milk_production (Years INTEGER,Periods TEXT,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Domains TEXT,Quantity BIGINT);


-- 4rd Table coffee_production

	CREATE TABLE coffee_production (Years INTEGER,Periods TEXT,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Quantity BIGINT);


-- 5ft Table egg_production


	CREATE TABLE egg_production (Years INTEGER,Periods TEXT,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Quantity BIGINT);


-- 6th Table state_lookup


	CREATE TABLE state_lookup (States TEXT,State_ANSI INTEGER);



-- 7th Table yogurt_production


	CREATE TABLE yogurt_production (Years INTEGER,Periods TEXT,Geo_Level TEXT,State_ANSI INTEGER,Commodity_ID INTEGER,Domains TEXT,Quantity BIGINT);

--------------------------------------------------------------------
-- Inserting data from CSV file

copy cheese_production from 'D:\DA20\Git_hub\Diary-SQL\cheese_production.csv' Delimiter ',' CSV Header;
copy coffee_production from 'D:\DA20\Git_hub\Diary-SQL\coffee_production.csv' Delimiter ',' CSV Header;
copy egg_production from 'D:\DA20\Git_hub\Diary-SQL\egg_production.csv' Delimiter ',' CSV Header;
copy honey_production from 'D:\DA20\Git_hub\Diary-SQL\honey_production.csv' Delimiter ',' CSV Header;
copy milk_production from 'D:\DA20\Git_hub\Diary-SQL\milk_production.csv' Delimiter ',' CSV Header;
copy state_lookup from 'D:\DA20\Git_hub\Diary-SQL\state_lookup.csv' Delimiter ',' CSV Header;
copy yogurt_production from 'D:\DA20\Git_hub\Diary-SQL\yogurt_production.csv' Delimiter ',' CSV Header;

select Periods from cheese_production;

------------------------------------------------------------------------
select * from milk_production;
select * from honey_production;
select * from state_lookup;


select * from coffee_production;


-- Let's take some quetions 

-- 1.Find the total milk production for the year 2023.
	select years, sum(quantity) as total_production from milk_production group by years having years = 2023;


--2. Show coffee production data for the year 2015. What is the total value?
	select years, sum(quantity) as total_production from coffee_production group by years having years = 2015;

--3. Find the average honey production for the year 2022.
	select years, avg(quantity) as avg_honey_production from honey_production group by years having years = 2022;

--4. Get the state names with their corresponding ANSI codes from the state_lookup table.What number is Iowa?
	select * from state_lookup where states = 'IOWA'

--5. Find the highest yogurt production value for the year 2022.
	select years, max(quantity) as highest_yogurt from yogurt_production group by years having years = 2022;

--6. Find states where both honey and milk were produced in 2022. Did State_ANSI "35" produce both honey and milk in 2022?
	select s.states, m.years, m.state_ansi, sum(m.quantity) as Total_milk_production, sum(h.quantity) as Total_honey_production from milk_production as m inner join honey_production as h on m.state_ansi = h.state_ansi 
	inner join state_lookup as s on h.state_ansi = s.state_ansi group by m.years, s.states, m.state_ansi having m.years = 2022 and m.state_ansi = 35;

--7. Find the total yogurt production for states that also produced cheese in 2022.
	SELECT sum(yp.quantity) FROM yogurt_production as yp WHERE yp.Years = 2022 AND yp.state_ansi IN (SELECT DISTINCT cp.state_ansi FROM cheese_production as cp WHERE cp.Years = 2022)


--Taking Some more Questios on this database


--1. Can you find out the total milk production for 2023? Your manager wants this information for the yearly report.
--What is the total milk production for 2023?
select years, sum(quantity) as total_milk_production from milk_production group by years having years = 2023
--91812000000

--2. Which states had cheese production greater than 100 million in April 2023? The Cheese Department wants to focus their marketing efforts there. 
--How many states are there?
select Years, Periods, State_ANSI, quantity from cheese_production where quantity > 100000000 and periods like 'APR' and Years = 2023;
--2

--3.Your manager wants to know how coffee production has changed over the years. What is the total value of coffee production for 2011?
select * from coffee_production where years = 2011;
--7600000

--4. There's a meeting with the Honey Council next week. Find the average honey production for 2022 so you're prepared.
select years, avg(quantity) from honey_production where years = 2022 group by years;
--3133275.000000000000

--5. The State Relations team wants a list of all states names with their corresponding ANSI codes. Can you generate that list? What is the State_ANSI code for Florida?
select * from state_lookup where states = 'FLORIDA';
--12

--6. For a cross-commodity report, can you list all states with their cheese production values, even if they didn't produce any cheese in April of 2023?What is the total for NEW JERSEY?
select c.periods, c.years, s.states, sum(c.quantity) as total_production from cheese_production as c inner join state_lookup as s on c.state_ansi = s.state_ansi group by c.years, c.periods, s.states having s.states = 'NEW JERSEY' order by c.years;
--4889000

--7. Can you find the total yogurt production for states in the year 2022 
----which also have cheese production data from 2023? 
----This will help the Dairy Division in their planning.
  select sum(quantity) from yogurt_production where years = 2022 and state_ansi in (select distinct state_ansi from cheese_production where years = 2023)
--1171095000

--8. List all states from state_lookup that are missing from milk_production in 2023.
---How many states are there?
   select count(state_ansi) from state_lookup where state_ansi not in (select distinct state_ansi from milk_production where years = 2023) 
--26

--9. List all states with their cheese production values, including states that didn't produce any cheese in April 2023.
---Did Delaware produce any cheese in April 2023?
	SELECT c.Years, c.Periods, c.State_ANSI, s.States, c.quantity FROM cheese_production as c INNER JOIN state_lookup as s ON c.State_ANSI  = s.State_ANSI WHERE c.Years = 2023 AND c.Periods LIKE 'APR';
--No

--10. Find the average coffee production for all years where the honey production exceeded 1 million.
  select avg(c.quantity) from coffee_production as c where c.Years IN (select h.Years from honey_production as h group by h.Years having sum(h.quantity) > 1000000);
--6426666.666666666667
  