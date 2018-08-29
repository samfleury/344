DROP TABLE Move;
DROP TABLE Move_Effect;
DROP TABLE Known_By;
DROP TABLE Item;
DROP TABLE Item_Effect;
DROP TABLE Used_By;
DROP TABLE Trainer;
DROP TABLE Town;
DROP TABLE Route;
DROP TABLE Type;
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

INSERT INTO goes_to VALUES (1, ‘Pallet Town’);
INSERT INTO goes_to VALUES (1, ‘Viridian City’);
INSERT INTO goes_to VALUES (2, ‘Viridian City’);
INSERT INTO goes_to VALUES (2, ‘Pewter City’);
INSERT INTO goes_to VALUES (3, ‘Pewter City’);
INSERT INTO goes_to VALUES (3, ‘Cerulean City’);
INSERT INTO goes_to VALUES (3, ‘Vermilion City’);


CREATE TABLE PType;
(name VARCHAR(20) NOT NULL,
PRIMARY KEY(name));
All 19 types in the game ( not sure if we want to keep ‘???’ )
INSERT INTO PType VALUES (“Normal’);
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


CREATE TABLE Gym
(gym_name VARCHAR(20) NOT NULL,
town VARCHAR(20) NOT NULL,
leader VARCHAR(20) NOT NULL,
PRIMARY KEY (gym_name, town),
FOREIGN KEY(town) REFERENCES town(town_name),
FOREIGN KEY(leader) REFERENCES trainer(trainerID));

INSERT INTO Gym VALUES (‘Pewter Gym’, ‘Pewter Town’, 11);
INSERT INTO Gym VALUES (‘Cerulean Gym’, ‘Cerulean City’, 12);
INSERT INTO Gym VALUES (‘Vermilion Gym’, ‘Vermilion City’, 13);
INSERT INTO Gym VALUES (‘Celadon Gym’, ‘Celadon City’, 14);
INSERT INTO Gym VALUES (‘Fuchsia Gym’, ‘Fuchsia City’, 15);
INSERT INTO Gym VALUES (‘Saffron Gym’, ‘Saffron City’, 16);
INSERT INTO Gym VALUES (‘Cinnabar Gym’, ‘Cinnabar City’,17);
INSERT INTO Gym VALUES (‘Viridian Gym’, ‘Viridian City’, 004);
COMMIT 

CREATE TABLE Move
(name VARCHAR2(20) NOT NULL,
category VARCHAR2(20) NOT NULL,
power INT,
accuracy INT,
type VARCHAR(20) NOT NULL,
PRIMARY KEY(name),
FOREIGN KEY(type) REFERENCES Type(name),
CONSTRAINT category_check CHECK (category IN (‘physical’, ‘special’, ‘status’)));

There are ALOT of moves so picked a few, also aligned the moves with the types above
INSERT INTO Move VALUES (‘Bind’, ‘physical’, 15, 85, ‘Normal’);
INSERT INTO Move VALUES (‘Ember’, ‘special’, 40, 100, ‘Fire’);        
INSERT INTO Move VALUES (‘Counter’, ‘physical’, NULL, 100, ‘Fighting’);    
INSERT INTO Move VALUES (‘Bubble Beam’, ‘special’, 65, 100, ‘Water’);    
INSERT INTO Move VALUES ('Drill Peck', ‘physical’, 80, 100, ‘Flying’);    
INSERT INTO Move VALUES (‘Absorb’, ‘special’, 20, 100, ‘Grass’);    
INSERT INTO Move VALUES (‘Acid’, ‘special’, 40, 100, ‘Poison’);
INSERT INTO Move VALUES (‘Thunderpunch’, ‘physical’, 75, 100, ‘Electric’);    
INSERT INTO Move VALUES (‘Bone Club’, ‘physical’, 65, 85, ‘Ground’);    
INSERT INTO Move VALUES (‘Amnesia’, ‘status’, NULL, NULL, ‘Psychic’);    
INSERT INTO Move VALUES (‘Rock Slide’, ‘physical’, 75, 90, ‘Rock’);    
INSERT INTO Move VALUES (‘Ice Beam’, ‘special’, 90, 100, ‘Ice’);    
INSERT INTO Move VALUES (‘Pin Missile’, ‘physical’, 25, 95, ‘Bug’);    
INSERT INTO Move VALUES (‘Dragon Rage’, ‘special’, NULL, 100, ‘Dragon’);    
INSERT INTO Move VALUES (‘Lick’, ‘physical’, 30, 100, ‘Ghost’);    
INSERT INTO Move VALUES (‘Bite’, ‘physical’, 60, 100, ‘Dark’);    
INSERT INTO Move VALUES (‘Clamp’, ‘physical’, 35, 85, ‘Water’);    
COMMIT;

CREATE TABLE Move_Effect
(effect VARCHAR2(100) NOT NULL,
move_name VARCHAR(20) NOT NULL,
PRIMARY KEY(effect, move),
FOREIGN KEY(move_name) REFERENCES Move(name));

INSERT INTO Move_Effect VALUES(‘Multi turn attack’, ‘Bind’);
INSERT INTO Move_Effect VALUES(‘Chance of burning the target’, ‘Ember’);
INSERT INTO Move_Effect VALUES(‘Decreased priority’, ‘Counter’);
INSERT INTO Move_Effect VALUES(‘Doubled damage if user has been attacked’, ‘Counter’);
INSERT INTO Move_Effect VALUES(‘Chance of lowering target’s speed’, ‘Bubble Beam’);
INSERT INTO Move_Effect VALUES(‘Damage done is restored to the user’, ‘Absorb’);
INSERT INTO Move_Effect VALUES(‘Chance of lowering the target’s defence’, ‘Acid’);
INSERT INTO Move_Effect VALUES(‘Chance of paralyzing the target’, ‘Thunder Punch’);
INSERT INTO Move_Effect VALUES(‘Chance of causing target to flinch’, ‘Bone Club’);
INSERT INTO Move_Effect VALUES(‘Increases user’s Special by two stages’, ‘Amnesia’);
INSERT INTO Move_Effect VALUES(‘Chance of freezing the target’, ‘Ice Beam’);
INSERT INTO Move_Effect VALUES(‘Hits the target 2-5 times’, ‘Pin Missile’);
INSERT INTO Move_Effect VALUES(‘Always inflicts exactly 40 damage’, ‘Dragon Rage’);
INSERT INTO Move_Effect VALUES(‘Chance of paralyzing the target’, ‘Lick’);
INSERT INTO Move_Effect VALUES(‘Multi turn attack’, ‘Clamp’);
INSERT INTO Move_Effect VALUES(‘Traps the target’, ‘Clamp’);

CREATE TABLE Known_By
(move_name VARCHAR(20) NOT NULL,
pokemon_ID INT NOT NULL,
power_points INT NOT NULL,
PRIMARY KEY(move_name, pokemon_ID),
FOREIGN KEY(move_name) REFERENCES Move(name),
FOREIGN KEY(pokemon_ID) REFERENCES Pokemon(pokemon_ID));

INSERT INTO Known_By VALUES (‘Ember’, 4, 25);
INSERT INTO Known_By VALUES (‘Counter’, 4, 15);
INSERT INTO Known_By VALUES (‘Lick’, 4, 35);
INSERT INTO Known_By VALUES (‘Absorb’, 1, 35);
INSERT INTO Known_By VALUES (‘Bind’, 1, 20);
INSERT INTO Known_By VALUES (‘Acid’, 1, 35);
INSERT INTO Known_By VALUES (‘Bubble Beam’, 7, 20);
INSERT INTO Known_By VALUES (‘Ice Beam’, 7, 15);
INSERT INTO Known_By VALUES (‘Lick’, 7, 35);
INSERT INTO Known_By VALUES (‘Pin Missile’, 10, 20);
INSERT INTO Known_By VALUES (‘Bite’, 10, 20);
INSERT INTO Known_By VALUES (‘Drill Peck’, 16, 15);
INSERT INTO Known_By VALUES (‘Counter’, 16, 20);
INSERT INTO Known_By VALUES (‘Counter’, 19, 25);
INSERT INTO Known_By VALUES (‘Bite’, 19, 20);
INSERT INTO Known_By VALUES (‘Lick’, 19, 30);
INSERT INTO Known_By VALUES (‘Bind’, 23, 20);
INSERT INTO Known_By VALUES (‘Bite’, 23, 20);
INSERT INTO Known_By VALUES (‘Thunderpunch, 25, 15);
INSERT INTO Known_By VALUES (‘Bite’, 25, 20);
INSERT INTO Known_By VALUES (‘Counter’, 25, 15);
INSERT INTO Known_By VALUES (‘Bite’, 27, 20);
INSERT INTO Known_By VALUES (‘Ember’, 27, 25);
INSERT INTO Known_By VALUES (‘Bone Club’, 27, 15);
INSERT INTO Known_By VALUES (‘Bite’, 35, 20);
INSERT INTO Known_By VALUES (‘Amnesia’, 35, 15);
INSERT INTO Known_By VALUES (‘Ice Beam’, 35, 15);
INSERT INTO Known_By VALUES (‘Absorb’, 43, 25);
INSERT INTO Known_By VALUES (‘Bind’, 43, 15);
INSERT INTO Known_By VALUES (‘Counter’, 56, 20);
INSERT INTO Known_By VALUES (‘Thunder Punch’, 56, 15);
INSERT INTO Known_By VALUES (‘Amnesia’, 63, 20);
INSERT INTO Known_By VALUES (‘Lick’, 63, 35);
INSERT INTO Known_By VALUES (‘Counter’, 81, 20);
INSERT INTO Known_By VALUES (‘Thunder Punch’, 81, 15);
INSERT INTO Known_By VALUES (‘Lick’, 93, 35);
INSERT INTO Known_By VALUES (‘Amnesia’, 93, 20);
INSERT INTO Known_By VALUES (‘Rock Slide’, 95, 15);
INSERT INTO Known_By VALUES (‘Bite’, 95, 20);
INSERT INTO Known_By VALUES (‘Ice Beam’, 131, 20);
INSERT INTO Known_By VALUES (‘Bubble Beam’, 131, 15);
INSERT INTO Known_By VALUES (‘Dragon Rage’, 149, 15);
INSERT INTO Known_By VALUES (‘Counter’, 149, 20);

CREATE TABLE Item
(name VARCHAR(20) NOT NULL,
PRIMARY KEY(name));
There are ALOT of items so picked a few
INSERT INTO Item VALUES ('Antidote');    
INSERT INTO Item VALUES ('Elixir');    
INSERT INTO Item VALUES ('Full Heal');    
INSERT INTO Item VALUES ('Poke Ball');    
INSERT INTO Item VALUES ('Revive');    
INSERT INTO Item VALUES ('Potion');    
COMMIT;

CREATE TABLE Item_Effect
(effect VARCHAR2(100) NOT NULL,
item_name VARCHAR2(20) NOT NULL,
PRIMARY KEY(effect, item_name),
FOREIGN KEY(item_name) REFERENCES Item(name));
Think this is the way to add an effect to the items above
VALUES (item_name, effect)
INSERT INTO Item_Effect VALUES ('Antidote', ‘Cures Poison Status’);    
INSERT INTO Item_Effect VALUES ('Elixir', ‘Restores 10PP’);    
INSERT INTO Item_Effect VALUES ('Full Heal', ‘Fully restore Pokemon HP’);    
INSERT INTO Item_Effect VALUES ('Poke Ball', ‘Used to catch Pokemon’);    
INSERT INTO Item_Effect VALUES ('Revive', ‘Recover fainted Pokemon’);    
INSERT INTO Item_Effect VALUES ('Potion', ‘Restore portion of HP’);    
COMMIT;

CREATE TABLE Used_By
(item_name VARCHAR(20) NOT NULL,
trainer_id INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY(item_name, trainer_id),
FOREIGN KEY(item_name) REFERENCES Item(name),
FOREIGN KEY(trainer_id) REFERENCES Trainer(trainer_id));

INSERT INTO used_by VALUES(‘Antidote’, 003, 2);
INSERT INTO used_by VALUES(‘Poke Ball’, 003, 3);
INSERT INTO used_by VALUES(‘Revive, 003, 1);
INSERT INTO used_by VALUES(‘Antidote’, 001, 1);
INSERT INTO used_by VALUES(‘Potion’, 001, 4);
INSERT INTO used_by VALUES(‘Revive’, 001, 2);
INSERT INTO used_by VALUES(‘Elixir’, 002, 2);
INSERT INTO used_by VALUES(‘Antidote’, 004, 10);

CREATE TABLE TRAINER
( trainerID int PRIMARY KEY,
fname varchar2(255), 
lname varchar2(255)
money NUMBER);

INSERT INTO trainer VALUES (001, ‘Ash’, ‘Ketchum’, 2);
INSERT INTO trainer VALUES (002, ‘Gary’, ‘Oak’, 168);
INSERT INTO trainer VALUES (003, ‘Jesse’, ‘Rocket’, 50);
INSERT INTO trainer VALUES (004, ‘Giovanni’, NULL, 1000000);
INSERT INTO trainer VALUES (011, ‘Brock’, NULL, 150);
INSERT INTO trainer VALUES (012, ‘Misty’, NULL, 200);
INSERT INTO trainer VALUES (013, ‘Lieutenant’, ‘Surge’, 250);
INSERT INTO trainer VALUES (014, ‘Erika’, NULL, 300);
INSERT INTO trainer VALUES (015, ‘Koga’, NULL, 350);
INSERT INTO trainer VALUES (016, ‘Sabrina’, NULL, 400);
INSERT INTO trainer VALUES (017, ‘Blaine’, NULL, 450);

CREATE TABLE POKEMON
(name VARCHAR(12) NOT NULL,
pokemon_ID INT PRIMARY KEY,
Pokemon_no INT,
time_caught datetime,
Level INT,
Owner int REFERENCES TRAINER(Trainer_ID));

VALUES (pokemon_name, pokemon_ID, pokemon_no, time_caught, level, owner)
INSERT INTO Pokemon VALUES (‘Bulbasaur’, 001, 097176, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Charmander’, 004, 002226, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Squirtle’, 007, 000337, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Caterpie’, 010, 038227, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Pidgey’, 016, 066729, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Rattata’, 019, 087433, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Ekans’, 023, 028189, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Pikachu’, 025, 034440, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Sandshrew’, 027, 005559, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Clefairy’, 035, 028548, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Oddish’, 043, 058703, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Mankey’, 056, 098976, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Abra’, 063, 090279, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Magnemite’, 081, 075832, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Haunter’, 093, 009237, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Onix’, 095, 094582, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Lapras’, 131, 050809, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);
INSERT INTO Pokemon VALUES (‘Dragonite’, 149, 091346, ‘YYYYMMDD hh:mm:ss’, TRAINER_ID);


CREATE TABLE POKEMON_IS_TYPE
(Pokemon int REFERENCES POKEMON(Pokemon_ID),
Type VARCHAR2(12) REFERENCES TYPE(name));
VALUES (pokemon_ID, type_name)
INSERT INTO Pokemon_Is_Type VALUES (001, ‘Grass’);
INSERT INTO Pokemon_Is_Type VALUES (004, ‘Fire’);
INSERT INTO Pokemon_Is_Type VALUES (007, ‘Water’);
INSERT INTO Pokemon_Is_Type VALUES (010, ‘Bug’);
INSERT INTO Pokemon_Is_Type VALUES (016, ‘Flying’);
INSERT INTO Pokemon_Is_Type VALUES (019, ‘Normal’);
INSERT INTO Pokemon_Is_Type VALUES (023, ‘Poison’);
INSERT INTO Pokemon_Is_Type VALUES (025, ‘Electric’);
INSERT INTO Pokemon_Is_Type VALUES (027, ‘Ground’);
INSERT INTO Pokemon_Is_Type VALUES (035, ‘Fairy’);
INSERT INTO Pokemon_Is_Type VALUES (043, ‘Grass’);
INSERT INTO Pokemon_Is_Type VALUES (056, ‘Fighting’);
INSERT INTO Pokemon_Is_Type VALUES (063, ‘Psychic’);
INSERT INTO Pokemon_Is_Type VALUES (081, ‘Steel’);
INSERT INTO Pokemon_Is_Type VALUES (093, ‘Ghost’);
INSERT INTO Pokemon_Is_Type VALUES (095, ‘Rock’);
INSERT INTO Pokemon_Is_Type VALUES (131, ‘Ice’);
INSERT INTO Pokemon_Is_Type VALUES (149, ‘Dragon’);


CREATE TABLE IS_NOT_EFF
(Type VARCHAR2(12) REFERENCES TYPE(Name),
Against VARCHAR2(12) REFERENCES TYPE(Name));
VALUES (attk_type, def_type)
INSERT INTO Is_Not_Eff VALUES (‘Normal’,  ‘Ghost’);
INSERT INTO Is_Not_Eff VALUES ('Electric’, ‘Ground’);
INSERT INTO Is_Not_Eff VALUES (‘Fighting’, ‘Ghost’);
INSERT INTO Is_Not_Eff VALUES (‘Poison’, ‘Steel’);
INSERT INTO Is_Not_Eff VALUES (‘Ground’, ‘Flying’);
INSERT INTO Is_Not_Eff VALUES (‘Psychic’, ‘Dark’);
INSERT INTO Is_Not_Eff VALUES (‘Ghost’, ‘Normal’);
INSERT INTO Is_Not_Eff VALUES (‘Dragon’, ‘Fairy’);



CREATE TABLE IS_NOT_VRY_EFF
(Type VARCHAR2(12) REFERENCES TYPE(Name),
Against VARCHAR2(12) REFERENCES TYPE(Name));
VALUES (attk_type, def_type)
INSERT INTO Is_Not_Vry_Eff VALUES (‘Normal’, ‘Rock’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Normal’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fire’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fire’, ‘Water’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fire’, ‘Rock’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fire’, ‘Dragon’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Water’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Water’, ‘Grass’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Water’, ‘Dragon’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Electric’, ‘Electric’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Electric’, ‘Grass’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Electric’, ‘Dragon’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Grass’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Poison’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Fly’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Bug’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Dragon’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Grass’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ice’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ice’, ‘Water’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ice’, ‘Ice’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ice’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fighting’, ‘Poison’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fighting’, ‘Fly’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fighting’, ‘Psychic’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fighting’, ‘Bug’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fighting’, ‘Fairy’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Poison’, ‘Poison’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Poison’, ‘Ground’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Poison’, ‘Rock’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Poison’, ‘Ghost’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ground’, ‘Grass’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ground’, ‘Bug’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Flying’, ‘Electric’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Flying’, ‘Rock’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Flying’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Psychic’, ‘Psychic’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Psychic’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘FIghting’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘Poison’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘Flying’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘Ghost’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Bug’, ‘Fairy’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Rock’, ‘Fighting’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Rock’, ‘Ground’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Rock’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Ghost’, ‘Dark’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Dragon’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Steel’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Steel’, ‘Water’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Steel’, ‘Electric’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Steel’, ‘Steel’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fairy’, ‘Fire’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fairy’, ‘Fighting’);
INSERT INTO Is_Not_Vry_Eff VALUES (‘Fairy’, ‘Steel’);


CREATE TABLE IS_SPR_EFF
(Type VARCHAR2(12) REFERENCES TYPE(Name),
Against VARCHAR2(12) REFERENCES TYPE(Name));
VALUES (attk_type, def_type)
INSERT INTO Is_Spr_Eff VALUES (‘Fire’, ‘Grass’);
INSERT INTO Is_Spr_Eff VALUES (‘Fire’, ‘Ice’);
INSERT INTO Is_Spr_Eff VALUES (‘Fire’, ‘Bug’);
INSERT INTO Is_Spr_Eff VALUES (‘Fire’, ‘Steel’);
INSERT INTO Is_Spr_Eff VALUES (‘Water’, ‘Fire’);
INSERT INTO Is_Spr_Eff VALUES (‘Water’, ‘Ground’);
INSERT INTO Is_Spr_Eff VALUES (‘Water’, ‘Rock’);
INSERT INTO Is_Spr_Eff VALUES (‘Electric’, ‘Water’);
INSERT INTO Is_Spr_Eff VALUES (‘Electric’, ‘Fly’);
INSERT INTO Is_Spr_Eff VALUES (‘Grass’, ‘Water’);
INSERT INTO Is_Spr_Eff VALUES (‘Grass’, ‘Ground’);
INSERT INTO Is_Spr_Eff VALUES (‘Grass’, ‘Rock’);
INSERT INTO Is_Spr_Eff VALUES (‘Ice’, ‘Grass’);
INSERT INTO Is_Spr_Eff VALUES (‘Ice’, ‘Ground’);
INSERT INTO Is_Spr_Eff VALUES (‘Ice’, ‘Flying’);
INSERT INTO Is_Spr_Eff VALUES (‘Ice’, ‘Dragon’);
INSERT INTO Is_Spr_Eff VALUES (‘Fighting’, ‘Normal’);
INSERT INTO Is_Spr_Eff VALUES (‘Fighting’, ‘Ice’);
INSERT INTO Is_Spr_Eff VALUES (‘Fighting’, ‘Rock’);
INSERT INTO Is_Spr_Eff VALUES (‘Fighting’, ‘Dark’);
INSERT INTO Is_Spr_Eff VALUES (‘Fighting’, ‘Steel’);
INSERT INTO Is_Spr_Eff VALUES (‘Poison’, ‘Grass’);
INSERT INTO Is_Spr_Eff VALUES (‘Poison’, ‘Fairy’);
