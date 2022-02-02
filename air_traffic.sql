-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL,
  CONSTRAINT fk_passenger
    FOREIGN KEY(passenger_id)
      REFERENCES passenger(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
  CONSTRAINT fk_flight
    FOREIGN KEY(flight_id)
      REFERENCES flight(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_airport_id INTEGER NOT NULL,
  to_airport_id INTEGER NOT NULL,
  CONSTRAINT fk_from_aiport
    FOREIGN KEY(from_airport_id)
      REFERENCES from_airport(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
  CONSTRAINT fk_to_airport
    FOREIGN KEY(to_airport_id)
      REFERENCES to_airport(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE airport 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL
);