CREATE TABLE movie (
    id BIGSERIAL PRIMARY KEY,
    silet boolean,
    published_date date
);

CREATE TABLE source (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255)
)