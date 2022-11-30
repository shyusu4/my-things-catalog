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