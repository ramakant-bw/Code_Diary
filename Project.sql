--Project 1

-- Creating Tables For Importing Datasets


-- 1st Table Cheese Production

	CREATE TABLE cheese_production (
	    Year INTEGER,
	    Period TEXT,
	    Geo_Level TEXT,
	    State_ANSI INTEGER,
	    Commodity_ID INTEGER,
	    Domain TEXT,
	    Value INTEGER
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
-- we need to change it first





select * from cheese_production
	
copy honey_production

copy milk_production

copy coffee_production

copy egg_production

copy state_lookup

copy yogurt_production
