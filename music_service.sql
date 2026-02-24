
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

INSERT INTO Genres (name) VALUES 
('Русский рок'),
('Русский рэп'),
('Поп-рок'),
('Хип-хоп'),
('Шансон');

INSERT INTO Artist (artist_name) VALUES 
('25/17'),
('7Б'),
('Гарик Сукачев'),
('Бэд Би Альянс'),
('Павел Пламенев'),
('Оксимирон');

INSERT INTO Albums (title_albums, release_year) VALUES 
('Время вернуться домой', 2019), -- 25/17
('Молодые ветра', 2015), -- 7Б
('Боцман и бродяга', 2018), -- Гарик Сукачев
('Альянс', 2020), -- Бэд Би Альянс
('Наизнанку', 2021), -- Павел Пламенев
('Красота и уродство', 2021); -- Оксимирон (всего 6 альбомов)

INSERT INTO Artist_Genres (artist_id, genre_id) VALUES 
(1, 2), -- 25/17 - Русский рэп
(1, 4), -- 25/17 - Хип-хоп
(2, 1), -- 7Б - Русский рок
(2, 3), -- 7Б - Поп-рок
(3, 1), -- Гарик Сукачев - Русский рок
(3, 5), -- Гарик Сукачев - Шансон
(4, 2), -- Бэд Би Альянс - Русский рэп
(4, 4), -- Бэд Би Альянс - Хип-хоп
(5, 3), -- Павел Пламенев - Поп-рок
(5, 1), -- Павел Пламенев - Русский рок
(6, 2), -- Оксимирон - Русский рэп
(6, 4); -- Оксимирон - Хип-хоп

INSERT INTO Artist_Albums (artist_id, albums_id) VALUES 
(1, 1), -- 25/17 - Время вернуться домой
(2, 2), -- 7Б - Молодые ветра
(3, 3), -- Гарик Сукачев - Боцман и бродяга
(4, 4), -- Бэд Би Альянс - Альянс
(5, 5), -- Павел Пламенев - Наизнанку
(6, 6); -- Оксимирон - Красота и уродство

INSERT INTO Track (title_track, album_id, duration_track) VALUES 
('Звезда', 1, 210), -- 3:30, 25/17
('Огонь', 1, 195), -- 3:15, 25/17
('Молодые ветра', 2, 240), -- 4:00, 7Б
('Осень', 2, 225), -- 3:45, 7Б
('Боцман', 3, 270), -- 4:30, Гарик Сукачев
('Бродяга', 3, 255), -- 4:15, Гарик Сукачев
('Наше движение', 4, 185), -- 3:05, Бэд Би Альянс
('Альянс', 4, 200), -- 3:20, Бэд Би Альянс
('Небо', 5, 215), -- 3:35, Павел Пламенев
('Наизнанку', 5, 230), -- 3:50, Павел Пламенев
('Кто убил Марка?', 6, 300), -- 5:00, Оксимирон
('Бездыханным', 6, 285); -- 4:45, Оксимирон (всего 12 треков)

INSERT INTO Collection (collection_name, release_year) VALUES 
('Лучший русский рок 2020', 2021),
('Русский рэп: новинки', 2022),
('Хиты русского рока', 2019),
('Андеграунд хип-хоп', 2021),
('Песни под гитару', 2020); -- 5 сборников

INSERT INTO Collection_track (collection_id, track_id) VALUES 
-- Лучший русский рок 2020
(1, 3), -- Молодые ветра (7Б)
(1, 4), -- Осень (7Б)
(1, 5), -- Боцман (Гарик Сукачев)
(1, 6), -- Бродяга (Гарик Сукачев)
(1, 9), -- Небо (Павел Пламенев)

-- Русский рэп: новинки
(2, 1), -- Звезда (25/17)
(2, 2), -- Огонь (25/17)
(2, 7), -- Наше движение (Бэд Би Альянс)
(2, 8), -- Альянс (Бэд Би Альянс)
(2, 11), -- Кто убил Марка? (Оксимирон)
(2, 12), -- Бездыханным (Оксимирон)

-- Хиты русского рока
(3, 3), -- Молодые ветра (7Б)
(3, 4), -- Осень (7Б)
(3, 5), -- Боцман (Гарик Сукачев)
(3, 9), -- Небо (Павел Пламенев)

-- Андеграунд хип-хоп
(4, 1), -- Звезда (25/17)
(4, 7), -- Наше движение (Бэд Би Альянс)
(4, 8), -- Альянс (Бэд Би Альянс)
(4, 11), -- Кто убил Марка? (Оксимирон)

-- Песни под гитару
(5, 3), -- Молодые ветра (7Б)
(5, 4), -- Осень (7Б)
(5, 5), -- Боцман (Гарик Сукачев)
(5, 6), -- Бродяга (Гарик Сукачев)
(5, 9), -- Небо (Павел Пламенев)
(5, 10); -- Наизнанку (Павел Пламенев)

SELECT title_track AS "Самый длительный трек", duration_track AS "Длительность (сек)"
FROM Track
WHERE duration_track = (SELECT MAX(duration_track) FROM Track);

SELECT title_track AS "Трек ≥ 3.5 мин", 
       CONCAT(FLOOR(duration_track/60), ':', LPAD((duration_track % 60)::text, 2, '0')) AS "Длительность"
FROM Track
WHERE duration_track >= 210;

SELECT collection_name AS "Сборник", release_year AS "Год"
FROM Collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT artist_name AS "Исполнитель (одно слово)"
FROM Artist
WHERE artist_name NOT LIKE '% %';

-- Находит песню "Кто убил Марка"
SELECT title_track FROM Track 
WHERE 
    title_track ILIKE 'кто %'
    OR title_track ILIKE '% кто'
    OR title_track ILIKE '% кто %'
    OR title_track ILIKE 'кто'; 

SELECT g.name AS "Жанр", COUNT(ag.artist_id) AS "Исполнителей"
FROM Genres g
LEFT JOIN Artist_Genres ag ON g.genres_id = ag.genre_id
GROUP BY g.genres_id, g.name
ORDER BY COUNT(ag.artist_id) DESC;

-- Находит 4 трека, которые привязаны к альбомам 2019 г и 2020 г
SELECT COUNT(t.track_id) FROM Track t 
JOIN Albums a ON t.album_id = a.albums_id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.title_albums AS "Альбом", 
       COUNT(t.track_id) AS "Треков",
       ROUND(AVG(t.duration_track), 2) AS "Средняя длит. (сек)"
FROM Albums a
LEFT JOIN Track t ON a.albums_id = t.album_id
GROUP BY a.albums_id, a.title_albums;

SELECT ar.artist_name AS "Исполнитель"
FROM Artist ar
WHERE ar.artist_id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM Artist_Albums aa
    JOIN Albums a ON aa.albums_id = a.albums_id
    WHERE a.release_year = 2020
);

SELECT DISTINCT c.collection_name AS "Сборник", c.release_year AS "Год"
FROM Collection c
JOIN Collection_track ct ON c.collection_id = ct.collection_id
JOIN Track t ON ct.track_id = t.track_id
JOIN Artist_Albums aa ON t.album_id = aa.albums_id
JOIN Artist a ON aa.artist_id = a.artist_id
WHERE a.artist_name = '25/17';

