# Database-movie-production-comapny
use movie_production_company;
go
create table  Movies (
    MoviesID INT PRIMARY KEY , 
    Title VARCHAR(100) NOT NULL,
    ReleaseYear INT,
    Director VARCHAR(100) NOT NULL,
    Genre VARCHAR(100),
);

Alter table Movies 
Add Writer VARCHAR(50) NOT NULL;
exec sp_rename 'Movies.Writer','WriterID','column';
alter table movies
drop cOLUMN director;
Alter table movies
add  DirectorID int;
alter table movies
drop column genre;
alter table movies
add Genre int;
CREATE TABLE Actors (
    ActorID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Nationality VARCHAR(100),
    Awards VARCHAR(100),
);
CREATE TABLE movie_actor(
movie_movieid int,
actor_actorid int,
PRIMARY KEY(movie_movieid,actor_actorid),
FOREIGN KEY (movie_movieid) REFERENCES Movies(MoviesID),
FOREIGN KEY (actor_actorid) REFERENCES Actors(ActorID),
);

CREATE TABLE ProductionCompanies (
    CompanyID INT PRIMARY KEY ,
    CompanyName VARCHAR(100) NOT NULL,
    FoundedYear INT,
    HeadquartersLocation VARCHAR(100),
);
CREATE TABLE MovieProduction (
    MovieID INT,
    CompanyID INT,
    Budget DECIMAL(25, 2),
    ReleaseDate DATE,
	);
ALTER TABLE MovieProduction
ADD CONSTRAINT PK_MovieCompany PRIMARY KEY (MovieID, CompanyID);

ALTER TABLE  MovieProduction
ADD CONSTRAINT FK_MovieID FOREIGN KEY (MovieID) REFERENCES Movies(MoviesID);

ALTER TABLE  MovieProduction
ADD CONSTRAINT FK_CompanyID FOREIGN KEY (CompanyID) REFERENCES ProductionCompanies(CompanyID);
CREATE TABLE Awards (
    AwardID INT PRIMARY KEY ,
    MovieID INT,
    ActorID INT,
    AwardName VARCHAR(100),
    Category VARCHAR(100),
    AwardYear INT,
    FOREIGN KEY (MovieID) REFERENCES Movies(MoviesID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
);
aLTER TABLE Awards
DROP CONSTRAINT FK__Awards__MovieID__3B75D760;
alter table awards
drop column movieid;

CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
	LastName Varchar(50) not null,
	Birthdate DATE,
    Nationality VARCHAR(50),
    Awards VARCHAR(100),
);
create table movie_directors(
movie_movieid int,
director_directorsid int,
PRIMARY KEY(movie_movieid,director_directorsid),
FOREIGN KEY (movie_movieid) REFERENCES Movies(MoviesID),
FOREIGN KEY (director_directorsid) REFERENCES Directors(DirectorID),
);
INSERT INTO MovieProduction (MovieID, CompanyID, Budget)
VALUES
(2, 3, 63000000),
(3, 3, 33000000),
(4, 4, 25000000),
(5, 4, 13000000),
(6, 4, 18000000),
(7, 5, 25000000),
(8, 2, 4400000),
(9, 5, 37000000),
(10, 4, 100000000),
(11, 3, 70000000),
(12, 5, 40000000),
(13, 4, 31000000),
(14, 5, 8500000),
(15, 5, 15000000),
(16, 2, 13000000),
(17, 2, 30000000),
(18, 5, 135000000),
(19, 5, 13000000),
(20, 3, 50000000);
INSERT INTO Awards (AwardID,MovieID, ActorID, AwardName, Category, AwardYear)
VALUES
(1,1,4, 'Academy Award', 'Best Picture', 1973),
(2,2, 11, 'Saturn Award', 'Best Actor', 2000),
(3,3, 11, 'Saturn Award', 'Best Thriller Film', 1998),
(4,4, 17, 'Academy Award', 'Best Supporting Actor', 1991),
(5,5, 1, 'Palme d''Or', 'Best Actor', 1976),
(6,6, 1 , 'Academy Award', 'Best Actor', 1981),
(7,7, 6, 'Academy Award', 'Best Actor', 2008),
(8,8, 5, 'Academy Award', 'Best Picture', 1976),
(9,9,18 , 'Golden Globe', 'Best Supporting Actor', 2000),
(10,10, 2, 'Golden Globe', 'Best Actor', 2014),
(11,11, 12, 'Academy Award', 'Best Actor', 2020),
(12,12, 8, 'Academy Award', 'Best Cinematography', 2007),
(13,13,4 , 'Academy Award', 'Best Actor', 1993),
(14,14, 13, 'Saturn Award', 'Best Thriller Film', 2015),
(15,15,3 , 'Empire Award', 'Best Director', 2012),
(16,16, 1, 'Academy Award', 'Best Supporting Actor', 1975),
(17,17,14 , 'Academy Award', 'Best Actress', 2017),
(18,18,2, 'Academy Award', 'Best Actor', 2016),
(19,19, 15, 'Academy Award', 'Best Actress', 2011),
(20,20, 10, 'Saturn Award', 'Best Actor', 2008);
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL,
 
);
create table movie_genre(
movie_movie_id int,
genre_genre_id int,
PRIMARY KEY(movie_movie_id,genre_genre_id),
FOREIGN KEY (movie_movie_id) REFERENCES Movies(MoviesID),
FOREIGN KEY (genre_genre_id) REFERENCES genres(GenreID),
);
alter table genres
drop column Description ;
INSERT INTO Genres (GenreID, GenreName)
VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror'),
(5, 'Crime');
insert into Genres(GenreID,GenreName)
values
(6, 'Biography');
insert into Genres(GenreID,GenreName)
values
(7,'Romance');

INSERT INTO movie_actor (movie_movieid,actor_actorid)
VALUES
(1, 4),
(2, 11),
(3, 11),
(4, 17),
(4,1),
(5, 1),
(6, 1),
(6,6),
(7, 6),
(8, 5),
(9, 18),
(10, 2),
(11, 12),
(12, 8),
(13, 4),
(14, 13),
(15, 3),
(16, 4),
(17, 14),
(17,3),
(18, 2),
(19, 15),
(20, 10);

INSERT INTO movie_genre (movie_movie_id, genre_genre_id)
VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 3),
(6, 6),
(7, 3),
(8, 3),
(9, 3),
(10, 6),
(11, 5),
(12, 3),
(13, 3),
(14, 5),
(15, 5),
(16, 5),
(17, 7),
(18, 6),
(19, 4),
(20, 4);



INSERT INTO movie_directors(movie_movieid, director_directorsid)
VALUES
(1, 3),
(2, 4),
(3, 4),
(4, 1),
(5, 1),
(6, 1),
(7, 5),
(8, 6),
(9, 5),
(10, 1),
(11, 8),
(12, 7),
(13, 9),
(14, 10),
(15, 11),
(16, 3),
(17, 13),
(18, 12),
(19, 2),
(20, 14);
INSERT INTO Actors (ActorID, FirstName, LastName, DateOfBirth, Nationality, Awards)
VALUES 
    (1, 'Robert', 'De Niro', '1943-08-17', 'Italian', '2 Oscars, 1 Golden Globes'),
    (2, 'Leonardo', 'DiCaprio', '1974-11-11', 'American', '1 Oscars, 3 Golden Globes'),
    (3, 'Ryan', 'Gosling', '1980-11-12', 'Canadian', '0 Oscars, 1 Golden Globes'),
    (4, 'AL', 'Pacino', '1940-04-25', 'Italian', '1 Oscars, 2 Golden Globes'),
    (5, 'Jack', 'Nicholson', '1937-04-22', 'American', '3 Oscars, 6 Golden Globes'),
    (6, 'Daniel', 'Day Lewis', '1957-04-29', 'British', '3 Oscars, 2 Golden Globes'),
    (7, 'Hugh', 'Jackman', '1968-10-12', 'Australian', '0 Oscars, 0 Golden Globes'),
    (8, 'Christian', 'Bale', '1974-01-30', 'British', '1, 2'),
    (9, 'Willem', 'Dafoe', '1955-07-22', 'American', '0, 0'),
    (10, 'Johnny', 'Depp', '1963-06-09', 'American', '0, 1'),
    (11, 'Brad', 'Pitt', '1963-12-18', 'American', '2, 2'),
    (12, 'Joaquin', 'Phoenix', '1974-10-28', 'American', '1, 2'),
    (13, 'Jake', 'Gyllenhaal', '1980-12-19', 'American', '0, 0'),
    (14, 'Emma', 'Stone', '1987-11-06', 'American', '1, 1'),
    (15, 'Natalie', 'Portman', '1981-06-09', 'American', '1, 2'),
    (16, 'Matt', 'Damon', '1970-10-08', 'American', '0, 0'),
    (17, 'Joe', 'Pesci', '1943-02-09', 'Italian', '1, 0'),
    (18, 'Tom', 'Cruise', '1962-07-02', 'American', '0, 2'),
    (19, 'Margot', 'Robbie', '1990-07-02', 'American', '0, 0'),
    (20, 'Edward', 'Norton', '1969-08-18', 'American', '0, 1'),
    (21, 'Robert', 'Pattinson', '1986-05-13', 'British', '0 Oscars, 0 Golden Globes'),
    (22, 'Christopher', 'Waltz', '1960-01-12', 'German', '2, 2'),
    (23, 'Anthony', 'Hopkins', '1948-12-25', 'British', '2, 2');
INSERT INTO Directors (DirectorID, LastName)
VALUES 
    (1, 'Scorsese'),
    (2, 'Aronofsky'),
    (3, 'Coppola'),
    (4, 'Fincher'),
    (5, 'Anderson'),
    (6, 'Forman'),
    (7, 'Nolan'),
    (8, 'Philips'),
    (9, 'Brest'),
    (10, 'Gilroy'),
    (11, 'Refn'),
    (12, 'Inaritu'),
    (13, 'Chazale'),
    (14, 'Burton');


INSERT INTO Movies (MoviesID, Title, ReleaseYear, WriterID, DirectorID, Genre)
VALUES 
    (1, 'The Godfather', 1972, 'Puzo', 3, 5),
    (2, 'Fight Club', 1999, 'Fincher', 4, 5),
    (3, 'Se7en', 1997, 'Fincher', 4, 5),
    (4, 'Goodfellas', 1990, 'Scorsese', 1, 5),
    (5, 'Taxi Driver', 1976, 'Schrader', 1, 3),
    (6, 'Raging Bull', 1980, 'Schrader', 1, 6),
    (7, 'There will be blood', 2007, 'Anderson', 5, 3),
    (8, 'One Flew Over The Cukoo''s Nest', 1975, 'Forman', 6, 3),
    (9, 'Magnolia', 1999, 'Anderson', 5, 3),
    (10, 'The Wolf Of Wall Street', 2013, 'Scorsese', 1, 6),
    (11, 'Joker', 2019, 'Philips', 8, 5),
    (12, 'The Prestige', 2006, 'Nolan', 7, 3),
    (13, 'Scent of a woman', 1992, 'Brest', 9, 3),
    (14, 'Nightcrawler', 2014, 'Gilroy', 10, 5),
    (15, 'Drive', 2011, 'Refn', 11, 5),
    (16, 'The Godfather Part 2', 1974, 'Puzo', 3, 5),
    (17, 'Lalaland', 2016, 'Chazale', 13, 7),
    (18, 'The Revanant', 2015, 'Inaritu', 12, 6),
    (19, 'Black Swan', 2010, 'Aronofosky', 2, 4),
    (20, 'Swennt Todd', 2007, 'Burton', 14, 4),
    (21, 'Avengers', 2012, 'Nolan', NULL, 1),
    (22, 'Silence', 2016, 'Scorsese', 1, 3),
    (23, 'Her', 2013, 'Philips', NULL, 3);
INSERT INTO ProductionCompanies (CompanyID, CompanyName, FoundedYear, HeadquartersLocation)
VALUES 
    (1, 'Disney', 1923, 'Los Angeles'),
    (2, 'Paramount', 1912, 'Los Angeles'),
    (3, 'Warner Bros', 1923, 'Los Angeles'),
    (4, '20th Century Fox', 1935, 'California'),
    (5, 'Universal', 1912, 'New Yorl');
