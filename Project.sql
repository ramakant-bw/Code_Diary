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





