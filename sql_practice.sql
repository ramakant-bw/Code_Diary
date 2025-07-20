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

-------------------------------------------------------------------------

-------------------------------------------------------------------------
