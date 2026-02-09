--CREATE DATABASE my_music;

CREATE TABLE IF NOT EXISTS genres(
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40));

CREATE TABLE IF NOT EXISTS singers(
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(40));

CREATE TABLE IF NOT EXISTS genres_singers(
	singer_id SERIAL REFERENCES singers(singer_id),
	genre_id SERIAL REFERENCES genres(genre_id),
	CONSTRAINT pk PRIMARY KEY (singer_id, genre_id));

CREATE TABLE IF NOT EXISTS albums(
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80),
	album_year DATE);

CREATE TABLE IF NOT EXISTS albums_singers(
	singer_id SERIAL REFERENCES singers(singer_id),
	album_id SERIAL REFERENCES albums(album_id),
	CONSTRAINT pk_1 PRIMARY KEY (singer_id, album_id));

CREATE TABLE IF NOT EXISTS tracks(
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(80),
	album_id SERIAL REFERENCES albums(album_id),
	track_time INT);

CREATE TABLE IF NOT EXISTS collections(
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80),
	collection_year DATE);

CREATE TABLE IF NOT EXISTS tracks_collections(
	track_id SERIAL REFERENCES tracks(track_id),
	collection_id SERIAL REFERENCES collections(collection_id),
	CONSTRAINT pk_2 PRIMARY KEY (track_id, collection_id));