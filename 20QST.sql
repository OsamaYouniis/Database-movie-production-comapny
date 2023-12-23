use movie_production_company;
go
--1
SELECT Movies.title, movie_genre.genre_genre_id,Genres.GenreName
FROM Movies
INNER JOIN movie_genre ON Movies.genre = movie_genre.genre_genre_id
INNER JOIN Genres ON movie_genre.genre_genre_id = Genres.GenreID
group by Movies.title, movie_genre.genre_genre_id,Genres.GenreName
Order by Genres.GenreName;


--2
SELECT Movies.Title, Movies.MoviesID,movie_actor.movie_movieid, Actors.FirstName, Actors.LastName, Actors.ActorID
FROM Movies
INNER JOIN movie_actor ON Movies.MoviesID = movie_actor.movie_movieid
INNER JOIN Actors ON movie_actor.actor_actorid = Actors.ActorID
order by firstname desc;
--3
SELECT Movies.Title, Movies.MoviesID,movie_actor.movie_movieid, Actors.FirstName, Actors.LastName, Actors.ActorID
FROM Movies
RIGHT OUTER JOIN movie_actor ON Movies.MoviesID = movie_actor.movie_movieid
RIGHT OUTER JOIN Actors ON movie_actor.actor_actorid = Actors.ActorID
order by firstname desc;
--4
SELECT Awards.awardid, Awards.category, Actors.FirstName,Actors.LastName
FROM Awards
INNER JOIN Actors ON Awards.actorid = Actors.ActorID;
--5
SELECT Awards.AwardID, Awards.Category, Movies.title
FROM Awards
INNER JOIN Movies ON Awards.AwardID = Movies.MoviesID;
--6
SELECT Actors.ActorID,Actors.Nationality,Actors.FirstName,Actors.LastName
FROM Actors
group by Actors.Nationality ,Actors.ActorID,Actors.FirstName,Actors.LastName
order by Actors.Nationality desc;
--7
SELECT Movies.Title,Movies.MoviesID,MOVIES.ReleaseYear
FROM Movies
GROUP BY Movies.Title,Movies.MoviesID,MOVIES.ReleaseYear
HAVING MOVIES.ReleaseYear>2010;
--8
  SELECT Movies.MoviesID,Movies.Title,MovieProduction.CompanyID,ProductionCompanies.CompanyName
FROM Movies
LEft OUTER JOIN MovieProduction ON Movies.MoviesID=MovieProduction.MovieID
Left OUTER JOIN ProductionCompanies ON MovieProduction.CompanyID=ProductionCompanies.CompanyID
 group by Movies.MoviesID,Movies.Title,MovieProduction.CompanyID,ProductionCompanies.CompanyName;