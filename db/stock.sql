DROP TABLE artists;
DROP TABLE albums;

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title (255),
  stock INT8,
  artist_id INT8 REFERENCES artists(id)
);
CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name (255)
);
