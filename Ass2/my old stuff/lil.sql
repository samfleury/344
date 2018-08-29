DROP TABLE Move;
DROP TABLE Move_Effect;
DROP TABLE Known_By;
DROP TABLE Item;
DROP TABLE Item_Effect;
DROP TABLE Used_By;
DROP TABLE Trainer;
DROP TABLE Town;
DROP TABLE Route;
DROP TABLE PType;
DROP TABLE Gym;
DROP TABLE Pokemon;
DROP TABLE Pokemon_Is_Type;
DROP TABLE Goes_To;
DROP TABLE Is_Not_Eff;
DROP TABLE Is_Not_Vry_Eff;
DROP TABLE IS_Spr_Eff;

CREATE TABLE Town      
(town_name VARCHAR2(20) NOT NULL,
poke_marts INT NOT NULL,
poke_centres INT NOT NULL,
PRIMARY KEY(town_name));
INSERT INTO Town VALUES ('Pallet Town', 0, 0);
INSERT INTO Town VALUES ('Viridian City', 1, 1);
INSERT INTO Town VALUES ('Pewter City', 1, 1);
INSERT INTO Town VALUES ('Cerulean City', 1, 1);
INSERT INTO Town VALUES ('Vermilion City', 1, 1);
INSERT INTO Town VALUES ('Lavender Town', 1, 1);
INSERT INTO Town VALUES ('Celadon City', 5, 1);
INSERT INTO Town VALUES ('Fuschia City', 1, 1);
INSERT INTO Town VALUES ('Saffron City', 1, 1);
INSERT INTO Town VALUES ('Cinnabar Island', 1, 1);
COMMIT;

CREATE TABLE Route
(route_number INT NOT NULL,
PRIMARY KEY(route_number));

INSERT INTO Route VALUES (1);
INSERT INTO Route VALUES (2);
INSERT INTO Route VALUES (3);
INSERT INTO Route VALUES (4);
INSERT INTO Route VALUES (5);
INSERT INTO Route VALUES (6);
INSERT INTO Route VALUES (7);
INSERT INTO Route VALUES (8);
INSERT INTO Route VALUES (9);
INSERT INTO Route VALUES (10);
COMMIT;

CREATE TABLE GOES_TO
(route INT REFERENCES ROUTE(route_number),
Town VARCHAR2(20) REFERENCES TOWN(town_name));

INSERT INTO goes_to VALUES (1, 'Pallet Town');
INSERT INTO goes_to VALUES (1, 'Viridian City');
INSERT INTO goes_to VALUES (2, 'Viridian City');
INSERT INTO goes_to VALUES (2, 'Pewter City');
INSERT INTO goes_to VALUES (3, 'Pewter City');
INSERT INTO goes_to VALUES (3, 'Cerulean City');
INSERT INTO goes_to VALUES (3, 'Vermilion City');

CREATE TABLE PType
(name VARCHAR(20) NOT NULL,
PRIMARY KEY(name));

INSERT INTO PType VALUES ('Normal');
INSERT INTO PType VALUES ('Fire');
INSERT INTO PType VALUES ('Fighting');
INSERT INTO PType VALUES ('Water');
INSERT INTO PType VALUES ('Flying');
INSERT INTO PType VALUES ('Grass');
INSERT INTO PType VALUES ('Poison');
INSERT INTO PType VALUES ('Electric');
INSERT INTO PType VALUES ('Ground');
INSERT INTO PType VALUES ('Psychic');
INSERT INTO PType VALUES ('Rock');
INSERT INTO PType VALUES ('Ice');
INSERT INTO PType VALUES ('Bug');
INSERT INTO PType VALUES ('Dragon');
INSERT INTO PType VALUES ('Ghost');
INSERT INTO PType VALUES ('Dark');
INSERT INTO PType VALUES ('Steel');
INSERT INTO PType VALUES ('Fairy');
COMMIT;



SELECT * FROM town;
SELECT * FROM route;
SELECT * FROM goes_to;
SELECT * FROM ptype;
