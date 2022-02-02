-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE artis
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  song_id INTEGER NOT NULL
);

CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  song_id INTEGER NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL,
  song_id INTEGER NOT NULL
)
