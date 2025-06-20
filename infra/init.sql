-- infra/init.sql

-- (Optional) enable PostGIS if desired:
-- CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  iso_code CHAR(3) UNIQUE NOT NULL
);

CREATE TABLE site (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT REFERENCES country(id),
  address TEXT,
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  site_type TEXT
);

-- add the rest of your tables per spec…
