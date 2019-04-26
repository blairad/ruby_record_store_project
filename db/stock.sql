DROP TABLE stock;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR (255)
);
CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR (255),
  stock INT8,
  artist_id INT8 REFERENCES artists(id) 
);
CREATE TABLE stock (
  id SERIAL8 PRIMARY KEY,
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  album_id INT8 REFERENCES albums(id) ON DELETE CASCADE
);
