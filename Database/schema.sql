CREATE TABLE book (
    id SERIAL PRIMARY KEY,
	publisher VARCHAR(100) ,
    cover_state VARCHAR(100)
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    color VARCHAR(100)
);

CREATE TABLE games(
    id serial PRIMARY KEY,
    multiplayer varchar(255),
    last_palayed_at DATE,
    publish_date Date,
    archived Boolean
);

CREATE TABLE authors(
    id serial PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255)
);

CREATE TABLE music_album(
    on_spotify Boolean,
    publish_date Date
);

CREATE TABLE genere(
    id serial PRIMARY KEY,
    name varchar(25)
);

CREATE TABLE movie (
    id BIGSERIAL PRIMARY KEY,
    silet boolean,
    published_date date
);

CREATE TABLE source (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255)
);
