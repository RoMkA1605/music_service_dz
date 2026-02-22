
CREATE TABLE Genres (
    genres_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Artist (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(200) NOT NULL
);

CREATE TABLE Albums (
    albums_id SERIAL PRIMARY KEY,
    title_albums VARCHAR(200) NOT NULL,
    release_year INTEGER
);

CREATE TABLE Collection (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(200) NOT NULL,
    release_year INTEGER
);

CREATE TABLE Track (
    track_id SERIAL PRIMARY KEY,
    title_track VARCHAR(200) NOT NULL,
    album_id INTEGER,
    duration_track INTEGER,
    FOREIGN KEY (album_id) REFERENCES Albums(albums_id) ON DELETE SET NULL
);

CREATE TABLE Artist_Genres (
    artist_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genres_id) ON DELETE CASCADE
);

CREATE TABLE Artist_Albums (
    artist_id INTEGER,
    albums_id INTEGER,
    PRIMARY KEY (artist_id, albums_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (albums_id) REFERENCES Albums(albums_id) ON DELETE CASCADE
);

CREATE TABLE Collection_track (
    collection_id INTEGER,
    track_id INTEGER,
    PRIMARY KEY (collection_id, track_id),
    FOREIGN KEY (collection_id) REFERENCES Collection(collection_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Track(track_id) ON DELETE CASCADE
);

