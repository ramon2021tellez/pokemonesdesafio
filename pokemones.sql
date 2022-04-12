\c daniela
DROP DATABASE pokemones;
CREATE DATABASE pokemones;
\c pokemones
CREATE TABLE pokemones(
pokedex SERIAL ,
nombre VARCHAR(30),
tipo1 VARCHAR(30),
tipo2 VARCHAR(30),
PRIMARY KEY (pokedex)
);
\copy pokemones FROM 'pokemoneskanto.csv' csv header;
SELECT * FROM pokemones LIMIT 10;

CREATE TABLE mis_pokemones(
pokedex INT ,
fecha_captura DATE,
lugar VARCHAR(30),
huevo BOOLEAN,
peso FLOAT,
estatura FLOAT,
FOREIGN KEY (pokedex) REFERENCES pokemones(pokedex)
);
\copy mis_pokemones FROM 'mis_pokemones.csv' csv header;
SELECT * FROM mis_pokemones LIMIT 5;

SELECT pokedex AS número FROM pokemones WHERE nombre = 'Eevee';

INSERT INTO mis_pokemones (pokedex, fecha_captura, lugar, huevo, peso, estatura)
VALUES (133, '2021-04-12', 'Puente Asalto', false, 15.6, 0.3);
INSERT INTO mis_pokemones (pokedex, fecha_captura, lugar, huevo, peso, estatura)
VALUES (134, '2021-04-12', 'La loma del toro', false, 25.6, 0.8);

SELECT * FROM mis_pokemones ORDER BY fecha_captura DESC LIMIT 3;
SELECT * FROM mis_pokemones WHERE EXTRACT(YEAR FROM fecha_captura) = 2021;
SELECT SUM(peso) AS total FROM mis_pokemones;

ALTER TABLE pokemones
ADD rocket BOOLEAN;
SELECT * FROM pokemones LIMIT 1;

INSERT INTO pokemones
(pokedex, nombre, tipo1, tipo2, rocket)
VALUES
(152, 'pichu', 'electrico','',false);

SELECT * FROM pokemones ORDER BY pokedex DESC LIMIT 1;

UPDATE pokemones SET rocket = false;

SELECT rocket AS capturado_por_los_malos FROM pokemones LIMIT 2;

--agrupar por tipo1
SELECT tipo1, COUNT(*) FROM pokemones GROUP BY tipo1;

--ejecutar consulta con order by peso maximos 5
SELECT * FROM mis_pokemones ORDER BY peso DESC LIMIT 5;

-- AGREGAR DOS INDICES A DOS COLUMNAS
CREATE INDEX index_pokedex_pokemones ON pokemones(pokedex); 
SELECT * FROM pg_indexes WHERE tablename = 'pokemones';
-- ELIMINAR INDICE DE LA COLUMNA
DROP INDEX index_pokedex_pokemones;
SELECT * FROM pg_indexes WHERE tablename = 'pokemones';
-- intentamos borrar el indice de la clave primaria spoiler no deja
DROP INDEX pokemones_pkey;
SELECT * FROM pg_indexes WHERE tablename = 'pokemones';


