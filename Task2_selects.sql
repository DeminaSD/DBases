--task2

--1
SELECT track_name, track_time
FROM tracks
ORDER BY track_time DESC
LIMIT 1;

--2
SELECT track_name 
FROM tracks
WHERE track_time >= 210;

--3
SELECT collection_name
FROM collections
WHERE collection_year >= '01-01-2018' AND collection_year <= '31-12-2020';

--4
SELECT singer_name FROM singers
WHERE singer_name NOT LIKE '% %';

--5
SELECT track_name FROM tracks
WHERE track_name ILIKE 'my %' --начало строки
		OR track_name ILIKE '% my' --конец строки
		OR track_name ILIKE '% my %' --середина строки
		OR track_name ILIKE 'my'; --1 слово

