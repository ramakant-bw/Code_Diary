-- Creating Artist Table Using Csv File 

Create Table Artists ( 
	ArtistID Int,
	Name Varchar
    );

Copy Artists from 'D:\DA20\Artist.csv' DELIMITER ',' CSV HEADER;

Select * from Artists;

-- Adding primary key as we forgot to add we need to use alter to add now 

ALTER TABLE Artists
ADD PRIMARY KEY (ArtistID);

Select * from Artists;

-------------------------------------------------------------------------

-- Creating Albums Table From Csv File

Create Table Albums ( 
	AlbumID Int,
	Title Varchar,
	ArtistID Int,
	Primary Key (AlbumID),
    Foreign Key  (ArtistID) References Artists(ArtistID)
);

Copy Albums from 'D:\DA20\Album.csv' DELIMITER ',' CSV HEADER;

Select * from Albums;

-------------------------------------------------------------------------

-- Creating Albums Table From Csv File

Create Table Tracks( 
	TrackID Int,
	Name Varchar,
	AlbumID Int,
	Composer Varchar,
	Minutes time,
	UnitPrice Int,
	Primary Key (TrackID),
    Foreign Key  (AlbumID) References Albums(AlbumID)
);

Copy Tracks from 'D:\DA20\Tracks.csv' DELIMITER ',' CSV HEADER;

Select * from Tracks;

-------------------------------------------------------------------------
-- Applying Inner Join On Three Tables 

Select A.Name as Singer, AL.Title, T.Name as Track, T.Composer From Artists as A
Inner Join Albums as AL on A.ArtistID = AL.ArtistID
Inner Join Tracks as T On AL.AlbumID = T.AlbumID;

-------------------------------------------------------------------------

select * from Tracks

-- Now we solve some questions based on this data 

-- 1. Run Query: Find all the tracks that have a length of 2 minutes or more.
  select a.name, t.minutes from Artists as a  inner join tracks as t on a.ArtistID = t.AlbumID  where t.minutes>= '00:02:00';


-- 2. Run Query: Find all the tracks whose composer starts with 'Ed'.
select name from Tracks where composer Like 'Ed%'


-- 3. Find the albums with 5 or more tracks.

select A.Title, Count(T.TrackID) from Albums as A inner join Tracks as T 
on A.AlbumID = T.AlbumID Group by A.Title having Count(T.TrackID) >= 5 Order By Count(T.TrackID) Desc


-------------------------------------------------------------------------
-- Chinook Database is installed for practice

-- Dew to old tables we had created using csv their are complecations are arise we need to solve that first

-------------------------------------------------------------------------
-- Dropping Older Artists, Albums, Track Table of old data as we installed chinnok db 

drop table tracks;
drop table albums;
drop table artists;
------------------------------
-- Giving origional name to chinnok databse tables as old table are deleted

alter table artist rename to artists;
alter table track rename to tracks;
alter table album rename to albums;

---------------------------------
-- Now Changing column name to origenal one as chinnok db has 
alter table artists rename artist_id to artistId;
alter table albums rename artist_id to artistId;
alter table albums rename album_id to albumId;
alter table tracks rename album_id to albumId;
alter table tracks rename unit_price to unitPrice;

-------------------------------------------------------------------------

-- Practice Questions

-- 1. How many albums does the artist Led Zeppelin have? 

select AR.Name, Count(AL.Title) as NumberOfTitles from artist as AR inner join album as AL On 
AR.artist_Id = AL.artist_Id group by AR.Name having AR.Name = 'Led Zeppelin';
Ans - "Led Zeppelin"	14

--------------------------------------------------------------------------
-- 2. Create a list of album titles and the unit prices for the artist "Audioslave".
-- How many records are returned?

select ar.name, al.title, tr.Unit_Price from artist as ar 
inner join album as al on ar.artist_id = al.artist_id
inner join track as tr on al.album_id = tr.album_id
where ar.name = 'Audioslave';

-- Ans - Total rows: 40

----------------------------------------------------------------------------
--3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  

select * from customer

select c.first_Name, c.last_Name from customer as c left join invoice as i 
on c.customer_Id = i.customer_Id where i.invoice_Id is null

-- Ans- No

-----------------------------------------------------------------------------
--4. Creating View using Subquery to Find Invoices for Customers in Paris


Create View Paris_invoice As	
	SELECT *
	FROM invoice
	WHERE customer_id IN (SELECT customer_id FROM customer WHERE city = 'Paris');

Select * From Paris_invoice;

------------------------------------------------------------------------------

--5. Creating View For Top 10 Track Sold Most Using - 'Join with Group By And Order By'

Create View Top_10 As 
	Select t.name as Track_name,  count(i.invoice_line_id) as Times_sold from track as t 
	inner join invoice_line as i on t.track_id = i.track_id
	Group By t.name 
	Order BY Times_sold Desc Limit 10;

Select * From Top_10

------------------------------------------------------------------------------


-- 6. Creating View For Customer Who Buy More Then 1 Tracks Using - 'Join with Group By and Having' Having comes after where if where is present and having applied after group by statement 

Create View frequent_buyer As
	 select c.First_name as customer_name, count(t.track_id) as Total_track
	 from customer as c inner join track as t on c.customer_id = t.Track_id
	 group by customer_name 
	 having count(t.track_id) > 1;

Select * From frequent_buyer;

------------------------------------------------------------------------------
-- Changing column name

alter table frequent_buyer rename total_track to total_song;

Select * From frequent_buyer;



------------------------------------------------------------------------------

-- 29-07-2025 practice


--Creating new Table for practice

--Creating table of kaggle top spotify tracks of 2023 dataset 

-- Creating table and headers of table

Create table Spotify_hits (
track_id int Primary Key,
track_name varchar,
artist_name varchar,
artist_count int,
released_date date,
in_spotify_playlists varchar,
in_spotify_charts varchar,
streams varchar,
in_apple_playlists varchar,
in_apple_charts varchar,
delete_column varchar
);

Select * from Spotify_hits;

-- Removing extra column

alter table Spotify_hits Drop delete_column;

-- Importing data from csv

Copy Spotify_hits From 'D:\DA20\Git_hub\Diary-SQL\spotify-2023.csv' Delimiter ',' CSV Header;

Select * from Spotify_hits ;


-- 1. Select Released Tracks which is between '2011-01-01' and '2023-01-01'

select * from Spotify_hits where released_date between '2011-01-01' and '2023-01-01';

-- 2 Which is 10 most streamed tracks are ?

select track_name, streams from Spotify_hits order by streams desc limit 10;

-- 3. Find vampire artist name

select artist_name from Spotify_hits where track_name = 'vampire'

-- Questions on Data Grouping

-- 4 Find the top 5 artists with the most tracks in your table.

select artist_name, count(track_name) as track_count from Spotify_hits group by artist_name order by track_count desc limit 5


--Date

-- 5 List tracks released in the last 6 months.

select track_name, released_date from Spotify_hits where released_date >= Date '01-01-2023' - Interval '6 months';



------------------------------------------------------------------------------

--Question on Employee-Customer-Invoice tables

--1. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering 
--your query in the following order: firstname, lastname, and invoiceID.

select (c.First_Name||c.Last_Name||i.invoice_Id) as Invoice_ID from customer as c
	inner join invoice as i on c.Customer_Id = i.Customer_Id order by Invoice_ID


--2. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

 select last_name, (current_date - hire_date) from employee order by 

 --------------------------------------------------------------------------------

 select * from employee;

select first_name, salary from employee group by first_name, salary having salary = max(salary)

select * , sum(salary) over(partition by position) from employee

---------------------------------------------------------------------------------------
-- Row Number in windows function

select *, row_number() over() from employee;

select * , Row_number() over(partition by position) from employee;

--------------------------------------------------------------------------

--2nd Highest with 'with' clause


with max_salary (max_sal) as (
	select max(salary) from employee;
)
select first_name, salary from employee as em, max_salary as ms where em.salary < ms.max_sal order by salary desc;


--2nd Highest with 'order by' , 'limit' and 'offset'
select  first_name, salary from employee order by salary desc limit 1 offset 1;

--2nd Highest with subquery
select first_name, salary from employee where salary < (select max(salary) from employee) order by salary desc limit 1;

--2nd highest by view
 create view max_sal as select max(salary) from employee;

 select first_name, salary from employee ,max_sal as mx where salary < mx.max_sal order by salary desc limit 1;



------------------------------------------------------------------------------



-- Using Chinook Database
-- 1. Find the total number of invoices per customer and sort the results by the total number of invoices in descending order.	
select c.first_name, c.last_name, count(i.invoice_id) as total_invoices from customer as c
inner join invoice as i on c.customer_id = i.customer_id
group by c.first_name, c.last_name
order by total_invoices desc;		


----------------------------------------------------------------------------------