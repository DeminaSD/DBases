--task1

INSERT INTO singers (singer_id, singer_name)
VALUES (1, 'Placebo'),
		(2, 'Crystal Castles'),
		(3, 'Summoning'),
		(4, 'Depeche Mode');

INSERT INTO genres(genre_id, genre_name)
VALUES (1, 'Alternative'),
		(2, 'Witch house'),
		(3, 'Dungeon synth');

INSERT INTO albums(album_id, album_name, album_year)
VALUES (1, 'Without You I''m nothing', '1998-01-01'),
		(2, 'Alice Practice', '2006-01-01'),
		(3, 'Minas Morgul', '1995-01-01');

INSERT INTO albums(album_id, album_name, album_year)
VALUES (4, 'Test for my-s', '2026-02-15');

INSERT INTO tracks(track_id, track_name, album_id, track_time)
VALUES (1, 'Pure Morning', 1, 255),
		(2, 'My Sweet Prince', 1, 345),
		(3, 'Every You Every Me', 1, 213),
		(4, 'The Crawl', 1, 179),
		(5, 'Lugburz', 3, 434),
		(6, 'Morthond', 3, 403);

INSERT INTO tracks(track_id, track_name, album_id, track_time)
VALUES (7, 'myself', 4, 1),
		(8, 'by myself', 4, 1),
		(9, 'bemy self', 4, 1),
		(10, 'by myself by', 4, 1);


INSERT INTO collections(collection_id, collection_name, collection_year)
VALUES (1, 'For DND', '01-01-2021'),
		(2, 'For problem solving', '01-01-2016'),
		(3, 'For walking', '01-01-2019'),
		(4, 'For crying', '01-01-2022');

INSERT INTO genres_singers(singer_id, genre_id)
VALUES (1, 1),
		(2, 1),
		(2, 2),
		(3, 3),
		(4, 1);

INSERT INTO albums_singers(singer_id, album_id)
VALUES (1, 1),
		(2, 2),
		(3, 3);

INSERT INTO tracks_collections(track_id, collection_id)
VALUES (1, 2),
		(1, 3),
		(2, 4),
		(3, 2),
		(3, 3),
		(4, 4),
		(5, 1),
		(6, 1);