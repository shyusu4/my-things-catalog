CREATE TABLE games(
    id serial PRIMARY KEY,
    multiplayer varchar(255),
    last_palayed_at DATE,
    publish_date Date,
    archived Boolean,
);

CREATE TABLE authors(
    id serial PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
);
