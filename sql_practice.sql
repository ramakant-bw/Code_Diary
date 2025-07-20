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

-------------------------------------------------------------------------

-------------------------------------------------------------------------

-------------------------------------------------------------------------
