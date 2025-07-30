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


	

