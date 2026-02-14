--1
SELECT COUNT(s.singer_name), g.genre_name  FROM singers s 
LEFT JOIN genres_singers gs ON s.singer_id = gs.singer_id 
LEFT JOIN genres g ON gs.genre_id =g.genre_id 
GROUP BY g.genre_name;

--2
SELECT count(t.track_name) FROM tracks t
LEFT JOIN albums a ON t.album_id = a.album_id 
WHERE a.album_year >= '01-01-2019' AND a.album_year <= '31-12-2020';

--3
SELECT a.album_name, AVG(t.track_time)  FROM tracks t 
LEFT JOIN albums a ON t.album_id = a.album_id 
GROUP BY a.album_name;

--4
SELECT singer_name FROM singers 
WHERE singer_name NOT IN (
							SELECT singer_name FROM singers s
							LEFT JOIN albums_singers als ON s.singer_id = als.singer_id 
							LEFT JOIN albums a ON als.album_id =a.album_id
							WHERE a.album_year = '01-01-2020')


/*SELECT ... /* Получаем имена исполнителей */
FROM ...  /* Из таблицы исполнителей */
WHERE ... NOT IN ( /* Где имя исполнителя не входит в вложенную выборку */
    SELECT ... /* Получаем имена исполнителей */
    FROM ... /* Из таблицы исполнителей */
    JOIN ... ON ... = ... /* Объединяем с промежуточной таблицей */
    JOIN ... ON ... = ... /* Объединяем с таблицей альбомов */
    WHERE ... = ... /* Где год альбома равен 2020 */
);*/

--5
SELECT DISTINCT c.collection_name FROM collections c 
LEFT JOIN tracks_collections tc ON c.collection_id = tc.collection_id 
LEFT JOIN tracks t ON tc.track_id = t.track_id 
LEFT JOIN albums a ON t.album_id = a.album_id 
LEFT JOIN albums_singers als ON a.album_id = als.album_id 
LEFT JOIN singers s ON als.singer_id = s.singer_id 
WHERE s.singer_name = 'Placebo'