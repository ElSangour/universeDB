CREATE DATABASE universe;
\c universe;
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    size INT NOT NULL,
    type TEXT,
    has_black_hole BOOLEAN NOT NULL,
    num_stars INT
);
INSERT INTO galaxy (name, size, type, has_black_hole, num_stars)
VALUES
    ('Milky Way', 100000, 'Spiral', TRUE, 200),
    ('Andromeda', 120000, 'Spiral', FALSE, 250),
    ('Messier 87', 200000, 'Elliptical', TRUE, 150),
    ('Triangulum', 50000, 'Spiral', FALSE, 100),
    ('Centaurus A', 150000, 'Elliptical', TRUE, 180),
    ('Whirlpool', 70000, 'Spiral', FALSE, 120);
CREATE TABLE fictional_galaxy (
    fictional_galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    size INT NOT NULL,
    type TEXT,
    has_black_hole BOOLEAN NOT NULL,
    num_stars INT
);
INSERT INTO fictional_galaxy (name, size, type, has_black_hole, num_stars)
VALUES
    ('Milky Way', 100000, 'Spiral', TRUE, 200),
    ('Andromeda', 120000, 'Spiral', FALSE, 250),
    ('Messier 87', 200000, 'Elliptical', TRUE, 150),
    ('Triangulum', 50000, 'Spiral', FALSE, 100),
    ('Centaurus A', 150000, 'Elliptical', TRUE, 180),
    ('Whirlpool', 70000, 'Spiral', FALSE, 120);
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    type VARCHAR NOT NULL,
    luminosity NUMERIC,
    is_black_hole BOOLEAN NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);
INSERT INTO star (name, type, luminosity, is_black_hole, galaxy_id)
VALUES
    ('Sun', 'G-type', 1, FALSE, 1),
    ('Sirius', 'A-type', 25.4, FALSE, 1),
    ('Proxima Centauri', 'M-type', 0.0017, FALSE, 6),
    ('Betelgeuse', 'M-type', 98000, FALSE, 2),
    ('Polaris', 'F-type', 46.6, FALSE, 1),
    ('VY Canis Majoris', 'M-type', 300000, FALSE, 3);
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    type VARCHAR NOT NULL,
    distance_from_star NUMERIC,
    has_life BOOLEAN NOT NULL,
    star_id INT REFERENCES star(star_id)
);
INSERT INTO planet (name, type, distance_from_star, has_life, star_id)
VALUES
    ('Earth', 'Terrestrial', 1, TRUE, 1),
    ('Mars', 'Terrestrial', 1.5, FALSE, 1),
    ('Venus', 'Terrestrial', 0.7, FALSE, 1),
    ('Jupiter', 'Gas Giant', 5.2, FALSE, 1),
    ('Saturn', 'Gas Giant', 9.5, FALSE, 1),
    ('Uranus', 'Ice Giant', 19.2, FALSE, 1),
    ('Neptune', 'Ice Giant', 30.1, FALSE, 1),
    ('Mercury', 'Terrestrial', 0.4, FALSE, 1),
    ('Kepler-22b', 'Exoplanet', 0.85, TRUE, 6),
    ('HD 209458 b', 'Exoplanet', 0.0475, FALSE, 6),
    ('Gliese 581c', 'Exoplanet', 0.073, TRUE, 6),
    ('Proxima Centauri b', 'Exoplanet', 0.0485, TRUE, 3);
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    type VARCHAR NOT NULL,
    radius NUMERIC NOT NULL,
    is_inhabited BOOLEAN NOT NULL,
    planet_id INT REFERENCES planet(planet_id)
);

INSERT INTO moon (name, type, radius, is_inhabited, planet_id)
VALUES
    ('Moon', 'Natural Satellite', 1737.5, FALSE, 1),
    ('Phobos', 'Natural Satellite', 11.1, FALSE, 2),
    ('Deimos', 'Natural Satellite', 6.2, FALSE, 2),
    ('Europa', 'Natural Satellite', 1560.8, FALSE, 4),
    ('Titan', 'Natural Satellite', 2575, FALSE, 5),
    ('Ganymede', 'Natural Satellite', 2634.1, FALSE, 4),
    ('Callisto', 'Natural Satellite', 2410.3, FALSE, 4),
    ('Triton', 'Natural Satellite', 1353.4, FALSE, 8),
    ('Enceladus', 'Natural Satellite', 252.1, FALSE, 5),
    ('Charon', 'Natural Satellite', 606, FALSE, 9),
    ('Titania', 'Natural Satellite', 788.9, FALSE, 7),
    ('Rhea', 'Natural Satellite', 763.8, FALSE, 5),
    ('Iapetus', 'Natural Satellite', 734.5, FALSE, 5),
    ('Dione', 'Natural Satellite', 561.4, FALSE, 5),
    ('Ariel', 'Natural Satellite', 578.9, FALSE, 7),
    ('Umbriel', 'Natural Satellite', 584.7, FALSE, 7),
    ('Miranda', 'Natural Satellite', 235.8, FALSE, 7),
    ('Tethys', 'Natural Satellite', 536.3, FALSE, 5),
    ('Luna', 'Natural Satellite', 1737.5, FALSE, 1),
    ('Phobos', 'Natural Satellite', 22, FALSE, 2);

SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
SELECT * FROM fictional_galaxy;
