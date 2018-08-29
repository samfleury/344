DROP TABLE Route CASCADE CONSTRAINTS;
DROP TABLE Town CASCADE CONSTRAINTS;
DROP TABLE Trainer CASCADE CONSTRAINTS;
DROP TABLE GOES_TO CASCADE CONSTRAINTS;
DROP TABLE PType CASCADE CONSTRAINTS;
DROP TABLE Gym CASCADE CONSTRAINTS;
DROP TABLE Move CASCADE CONSTRAINTS;
DROP TABLE Move_Effect CASCADE CONSTRAINTS;
DROP TABLE Pokemon CASCADE CONSTRAINTS;
DROP TABLE Known_By CASCADE CONSTRAINTS;
DROP TABLE Item CASCADE CONSTRAINTS;
DROP TABLE Item_Effect CASCADE CONSTRAINTS;
DROP TABLE Used_By CASCADE CONSTRAINTS;
DROP TABLE IS_NOT_EFF CASCADE CONSTRAINTS;
DROP TABLE IS_NOT_VRY_EFF CASCADE CONSTRAINTS;
DROP TABLE IS_SPR_EFF CASCADE CONSTRAINTS;
DROP TABLE Pokemon_is_type CASCADE CONSTRAINTS;

CREATE TABLE Route(
    route_number INT NOT NULL,
    PRIMARY KEY(route_number));
INSERT INTO Route VALUES(1);
INSERT INTO Route VALUES(2);
INSERT INTO Route VALUES(3);
INSERT INTO Route VALUES(4);
INSERT INTO Route VALUES(5);
INSERT INTO Route VALUES(6);
INSERT INTO Route VALUES(7);
INSERT INTO Route VALUES(8);
INSERT INTO Route VALUES(9);
INSERT INTO Route VALUES(10);

CREATE TABLE Town (
    town_name VARCHAR2(20) NOT NULL,
    poke_marts INT NOT NULL,
    poke_centres INT NOT NULL,
    PRIMARY KEY(town_name));
INSERT INTO Town VALUES('Pallet Town', 0, 0);
INSERT INTO Town VALUES('Viridian City', 1, 1);
INSERT INTO Town VALUES('Pewter City', 1, 1);
INSERT INTO Town VALUES('Cerulean City', 1, 1);
INSERT INTO Town VALUES('Vermilion City', 1, 1);
INSERT INTO Town VALUES('Lavender Town', 1, 1);
INSERT INTO Town VALUES('Celadon City', 5, 1);
INSERT INTO Town VALUES('Fuschia City', 1, 1);
INSERT INTO Town VALUES('Cinnabar Island', 1, 1);
INSERT INTO Town VALUES('Saffron City', 1, 1);

CREATE TABLE GOES_TO(
    route INT CONSTRAINT goestoroute REFERENCES Route(route_number) DISABLE,
    Town VARCHAR2(20) CONSTRAINT goestotown REFERENCES TOWN(town_name) DISABLE);

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

CREATE TABLE TRAINER
    ( trainerID int PRIMARY KEY,
      fname varchar2(20) NOT NULL, 
      lname varchar2(20),
      money INT NOT NULL);

INSERT INTO trainer VALUES (001, 'Ash', 'Ketchum', 2);
INSERT INTO trainer VALUES (002, 'Gary', 'Oak', 168);
INSERT INTO trainer VALUES (003, 'Jesse', 'Rocket', 50);
INSERT INTO trainer VALUES (004, 'Giovanni', NULL, 1000000);
INSERT INTO trainer VALUES (011, 'Brock', NULL, 150);
INSERT INTO trainer VALUES (012, 'Misty', NULL, 200);
INSERT INTO trainer VALUES (013, 'Lieutenant', 'Surge', 250);
INSERT INTO trainer VALUES (014, 'Erika', NULL, 300);
INSERT INTO trainer VALUES (015, 'Koga', NULL, 350);
INSERT INTO trainer VALUES (016, 'Sabrina', NULL, 400);
INSERT INTO trainer VALUES (017, 'Blaine', NULL, 450);

CREATE TABLE Gym
(gym_name VARCHAR(20) NOT NULL,
town VARCHAR(20) NOT NULL CONSTRAINT gymtown_fk REFERENCES town(town_name) DISABLE,
leader int NOT NULL CONSTRAINT gymleader_fk REFERENCES trainer(trainerID) DISABLE,
PRIMARY KEY (gym_name, town));

INSERT INTO Gym VALUES ('Pewter Gym', 'Pewter City', 11);
INSERT INTO Gym VALUES ('Cerulean Gym', 'Cerulean City', 12);
INSERT INTO Gym VALUES ('Vermilion Gym', 'Vermilion City', 13);
INSERT INTO Gym VALUES ('Celadon Gym', 'Celadon City', 14);
INSERT INTO Gym VALUES ('Fuschia Gym', 'Fuschia City', 15);
INSERT INTO Gym VALUES ('Saffron Gym', 'Saffron City', 16);
INSERT INTO Gym VALUES ('Cinnabar Gym', 'Cinnabar Island',17);
INSERT INTO Gym VALUES ('Viridian Gym', 'Viridian City', 004);


CREATE TABLE Move
    (name VARCHAR2(20) NOT NULL,
    category VARCHAR2(20) NOT NULL,
    power INT,
    accuracy INT,
    type VARCHAR(20) NOT NULL CONSTRAINT movetype_fk REFERENCES PType(name) DISABLE,
PRIMARY KEY(name),
    CONSTRAINT category_check CHECK (category IN ('physical', 'special', 'status')));

INSERT INTO Move VALUES ('Bind', 'physical', 15, 85, 'Normal');
INSERT INTO Move VALUES ('Ember', 'special', 40, 100, 'Fire');        
INSERT INTO Move VALUES ('Counter', 'physical', NULL, 100, 'Fighting');    
INSERT INTO Move VALUES ('Bubble Beam', 'special', 65, 100, 'Water');    
INSERT INTO Move VALUES ('Drill Peck', 'physical', 80, 100, 'Flying');    
INSERT INTO Move VALUES ('Absorb', 'special', 20, 100, 'Grass');    
INSERT INTO Move VALUES ('Acid', 'special', 40, 100, 'Poison');
INSERT INTO Move VALUES ('Thunder Punch', 'physical', 75, 100, 'Electric');    
INSERT INTO Move VALUES ('Bone Club', 'physical', 65, 85, 'Ground');    
INSERT INTO Move VALUES ('Amnesia', 'status', NULL, NULL, 'Psychic');    
INSERT INTO Move VALUES ('Rock Slide', 'physical', 75, 90, 'Rock');    
INSERT INTO Move VALUES ('Ice Beam', 'special', 90, 100, 'Ice');    
INSERT INTO Move VALUES ('Pin Missile', 'physical', 25, 95, 'Bug');    
INSERT INTO Move VALUES ('Dragon Rage', 'special', NULL, 100, 'Dragon');    
INSERT INTO Move VALUES ('Lick', 'physical', 30, 100, 'Ghost');    
INSERT INTO Move VALUES ('Bite', 'physical', 60, 100, 'Dark');    
INSERT INTO Move VALUES ('Clamp', 'physical', 35, 85, 'Water');

CREATE TABLE Move_Effect
    (effect VARCHAR2(100) NOT NULL,
    move_name VARCHAR(20) NOT NULL CONSTRAINT moveeffectmove_fk REFERENCES Move(name) DISABLE,
    PRIMARY KEY(effect, move_name));

INSERT INTO Move_Effect VALUES('Multi turn attack', 'Bind');
INSERT INTO Move_Effect VALUES('Chance of burning the target', 'Ember');
INSERT INTO Move_Effect VALUES('Decreased priority', 'Counter');
INSERT INTO Move_Effect VALUES('Doubled damage if user has been attacked', 'Counter');
INSERT INTO Move_Effect VALUES('Chance of lowering targets speed', 'Bubble Beam');
INSERT INTO Move_Effect VALUES('Damage done is restored to the user', 'Absorb');
INSERT INTO Move_Effect VALUES('Chance of lowering the targets defence', 'Acid');
INSERT INTO Move_Effect VALUES('Chance of paralyzing the target', 'Thunder Punch');
INSERT INTO Move_Effect VALUES('Chance of causing target to flinch', 'Bone Club');
INSERT INTO Move_Effect VALUES('Increases users Special by two stages', 'Amnesia');
INSERT INTO Move_Effect VALUES('Chance of freezing the target', 'Ice Beam');
INSERT INTO Move_Effect VALUES('Hits the target 2-5 times', 'Pin Missile');
INSERT INTO Move_Effect VALUES('Always inflicts exactly 40 damage', 'Dragon Rage');
INSERT INTO Move_Effect VALUES('Chance of paralyzing the target', 'Lick');
INSERT INTO Move_Effect VALUES('Multi turn attack', 'Clamp');
INSERT INTO Move_Effect VALUES('Traps the target', 'Clamp');

CREATE TABLE Item
    (name VARCHAR(20) NOT NULL,
    PRIMARY KEY(name));

INSERT INTO Item VALUES ('Antidote');    
INSERT INTO Item VALUES ('Elixir');    
INSERT INTO Item VALUES ('Full Heal');    
INSERT INTO Item VALUES ('Poke Ball');    
INSERT INTO Item VALUES ('Revive');    
INSERT INTO Item VALUES ('Potion');

CREATE TABLE Item_Effect
    (item_name VARCHAR2(20) NOT NULL CONSTRAINT itemeffitem REFERENCES Item(name) DISABLE,
    effect VARCHAR2(100) NOT NULL,
    PRIMARY KEY(effect, item_name));

INSERT INTO Item_Effect VALUES ('Antidote', 'Cures Poison Status');    
INSERT INTO Item_Effect VALUES ('Elixir', 'Restores 10PP');    
INSERT INTO Item_Effect VALUES ('Full Heal', 'Fully restore Pokemon HP');    
INSERT INTO Item_Effect VALUES ('Poke Ball', 'Used to catch Pokemon');    
INSERT INTO Item_Effect VALUES ('Revive', 'Recover fainted Pokemon');    
INSERT INTO Item_Effect VALUES ('Potion', 'Restore portion of HP');    

CREATE TABLE Used_By
    (item_name VARCHAR(20) NOT NULL CONSTRAINT usedbyitem REFERENCES Item(name) DISABLE,
    trainer_id INT NOT NULL CONSTRAINT usedbytrainer REFERENCES Trainer(trainerid) DISABLE,
    quantity INT NOT NULL,
    PRIMARY KEY(item_name, trainer_id));

INSERT INTO used_by VALUES('Antidote', 003, 2);
INSERT INTO used_by VALUES('Poke Ball', 003, 3);
INSERT INTO used_by VALUES('Revive', 003, 1);
INSERT INTO used_by VALUES('Antidote', 001, 1);
INSERT INTO used_by VALUES('Potion', 001, 4);
INSERT INTO used_by VALUES('Revive', 001, 2);
INSERT INTO used_by VALUES('Elixir', 002, 2);
INSERT INTO used_by VALUES('Antidote', 004, 10);

CREATE TABLE Pokemon
    (name VARCHAR(12) NOT NULL,
    pokemon_ID INT PRIMARY KEY,
    Pokemon_no INT NOT NULL,
    time_caught date NOT NULL,
    plevel INT NOT NULL,
    Owner int NOT NULL CONSTRAINT pokemonowner REFERENCES TRAINER(trainerID) DISABLE);

INSERT INTO Pokemon VALUES ('Bulbasaur', 001, 097176, TO_DATE('20180101 09:41:43', 'YYYYMMDD HH24:MI:SS'), 5, 001);
INSERT INTO Pokemon VALUES ('Charmander', 004, 002226, TO_DATE('20180102 16:41:43', 'YYYYMMDD HH24:MI:SS'), 10, 001);
INSERT INTO Pokemon VALUES ('Squirtle', 007, 000337, TO_DATE('20180105 18:35:00', 'YYYYMMDD HH24:MI:SS'), 23, 001);
INSERT INTO Pokemon VALUES ('Caterpie', 010, 038227, TO_DATE('20180107 01:00:43', 'YYYYMMDD HH24:MI:SS'), 75, 001);
INSERT INTO Pokemon VALUES ('Pidgey', 016, 066729, TO_DATE('20180204 10:41:59', 'YYYYMMDD HH24:MI:SS'), 100, 002);
INSERT INTO Pokemon VALUES ('Rattata', 019, 087433, TO_DATE('20180505 11:07:43', 'YYYYMMDD HH24:MI:SS'), 56, 003);
INSERT INTO Pokemon VALUES ('Ekans', 023, 028189, TO_DATE('20180901 12:01:40', 'YYYYMMDD HH24:MI:SS'), 78, 003);
INSERT INTO Pokemon VALUES ('Pikachu', 025, 034440, TO_DATE('20181101 19:19:19', 'YYYYMMDD HH24:MI:SS'), 79, 001);
INSERT INTO Pokemon VALUES ('Sandshrew', 027, 005559, TO_DATE('20181201 08:00:10', 'YYYYMMDD HH24:MI:SS'), 45, 011);
INSERT INTO Pokemon VALUES ('Clefairy', 035, 028548, TO_DATE('20180516 23:17:12', 'YYYYMMDD HH24:MI:SS'), 34, 016);
INSERT INTO Pokemon VALUES ('Oddish', 043, 058703, TO_DATE('20180704 13:34:43', 'YYYYMMDD HH24:MI:SS'), 23, 015);
INSERT INTO Pokemon VALUES ('Mankey', 056, 098976, TO_DATE('20180819 09:12:21', 'YYYYMMDD HH24:MI:SS'), 46, 013);
INSERT INTO Pokemon VALUES ('Abra', 063, 090279, TO_DATE('20181018 10:10:10', 'YYYYMMDD HH24:MI:SS'), 23, 014);
INSERT INTO Pokemon VALUES ('Magnemite', 081, 075832, TO_DATE('20180614 23:56:56', 'YYYYMMDD HH24:MI:SS'), 89, 013);
INSERT INTO Pokemon VALUES ('Haunter', 093, 009237, TO_DATE('20180813 18:41:43', 'YYYYMMDD HH24:MI:SS'), 21, 017);
INSERT INTO Pokemon VALUES ('Onix', 095, 094582, TO_DATE('20180426 18:41:50', 'YYYYMMDD HH24:MI:SS'), 54, 011);
INSERT INTO Pokemon VALUES ('Lapras', 131, 050809, TO_DATE('20180910 19:19:59', 'YYYYMMDD HH24:MI:SS'), 33, 012);
INSERT INTO Pokemon VALUES ('Dragonite', 149, 091346, TO_DATE('20180209 15:50:39', 'YYYYMMDD HH24:MI:SS'), 67, 017);


CREATE TABLE POKEMON_IS_TYPE
    (Pokemon int NOT NULL CONSTRAINT istypepokemon REFERENCES POKEMON(pokemon_ID) DISABLE ,
    Type VARCHAR2(12) NOT NULL CONSTRAINT istypetype REFERENCES PTYPE(name) DISABLE);

INSERT INTO Pokemon_Is_Type VALUES (001, 'Grass');
INSERT INTO Pokemon_Is_Type VALUES (004, 'Fire');
INSERT INTO Pokemon_Is_Type VALUES (007, 'Water');
INSERT INTO Pokemon_Is_Type VALUES (010, 'Bug');
INSERT INTO Pokemon_Is_Type VALUES (016, 'Flying');
INSERT INTO Pokemon_Is_Type VALUES (019, 'Normal');
INSERT INTO Pokemon_Is_Type VALUES (023, 'Poison');
INSERT INTO Pokemon_Is_Type VALUES (025, 'Electric');
INSERT INTO Pokemon_Is_Type VALUES (027, 'Ground');
INSERT INTO Pokemon_Is_Type VALUES (035, 'Fairy');
INSERT INTO Pokemon_Is_Type VALUES (043, 'Grass');
INSERT INTO Pokemon_Is_Type VALUES (056, 'Fighting');
INSERT INTO Pokemon_Is_Type VALUES (063, 'Psychic');
INSERT INTO Pokemon_Is_Type VALUES (081, 'Steel');
INSERT INTO Pokemon_Is_Type VALUES (093, 'Ghost');
INSERT INTO Pokemon_Is_Type VALUES (095, 'Rock');
INSERT INTO Pokemon_Is_Type VALUES (131, 'Ice');
INSERT INTO Pokemon_Is_Type VALUES (149, 'Dragon');

CREATE TABLE Known_By
    (move_name VARCHAR(20) NOT NULL CONSTRAINT knownbymovename REFERENCES Move(name) DISABLE,
    pokemon_ID INT NOT NULL CONSTRAINT knownbypokemonid REFERENCES Pokemon(pokemon_ID) DISABLE,
    power_points INT NOT NULL,
    PRIMARY KEY(move_name, pokemon_ID));
    
INSERT INTO Known_By VALUES ('Ember', 004, 25);
INSERT INTO Known_By VALUES ('Counter', 004, 15);
INSERT INTO Known_By VALUES ('Lick', 004, 35);
INSERT INTO Known_By VALUES ('Absorb', 001, 35);
INSERT INTO Known_By VALUES ('Bind', 001, 20);
INSERT INTO Known_By VALUES ('Acid', 001, 35);
INSERT INTO Known_By VALUES ('Bubble Beam', 007, 20);
INSERT INTO Known_By VALUES ('Ice Beam', 007, 15);
INSERT INTO Known_By VALUES ('Lick', 007, 35);
INSERT INTO Known_By VALUES ('Pin Missile', 010, 20);
INSERT INTO Known_By VALUES ('Bite', 010, 20);
INSERT INTO Known_By VALUES ('Drill Peck', 016, 15);
INSERT INTO Known_By VALUES ('Counter', 016, 20);
INSERT INTO Known_By VALUES ('Counter', 019, 25);
INSERT INTO Known_By VALUES ('Bite', 019, 20);
INSERT INTO Known_By VALUES ('Lick', 019, 30);
INSERT INTO Known_By VALUES ('Bind', 023, 20);
INSERT INTO Known_By VALUES ('Bite', 023, 20);
INSERT INTO Known_By VALUES ('Thunder Punch', 025, 15);
INSERT INTO Known_By VALUES ('Bite', 025, 20);
INSERT INTO Known_By VALUES ('Counter', 025, 15);
INSERT INTO Known_By VALUES ('Bite', 027, 20);
INSERT INTO Known_By VALUES ('Ember', 027, 25);
INSERT INTO Known_By VALUES ('Bone Club', 027, 15);
INSERT INTO Known_By VALUES ('Bite', 035, 20);
INSERT INTO Known_By VALUES ('Amnesia', 035, 15);
INSERT INTO Known_By VALUES ('Ice Beam', 035, 15);
INSERT INTO Known_By VALUES ('Absorb', 043, 25);
INSERT INTO Known_By VALUES ('Bind', 043, 15);
INSERT INTO Known_By VALUES ('Counter', 056, 20);
INSERT INTO Known_By VALUES ('Thunder Punch', 056, 15);
INSERT INTO Known_By VALUES ('Amnesia', 063, 20);
INSERT INTO Known_By VALUES ('Lick', 063, 35);
INSERT INTO Known_By VALUES ('Counter', 081, 20);
INSERT INTO Known_By VALUES ('Thunder Punch', 081, 15);
INSERT INTO Known_By VALUES ('Lick', 093, 35);
INSERT INTO Known_By VALUES ('Amnesia', 093, 20);
INSERT INTO Known_By VALUES ('Rock Slide', 095, 15);
INSERT INTO Known_By VALUES ('Bite', 095, 20);
INSERT INTO Known_By VALUES ('Ice Beam', 131, 20);
INSERT INTO Known_By VALUES ('Bubble Beam', 131, 15);
INSERT INTO Known_By VALUES ('Dragon Rage', 149, 15);
INSERT INTO Known_By VALUES ('Counter', 149, 20);

CREATE TABLE IS_NOT_EFF
    (Type VARCHAR2(12) REFERENCES PTYPE(name) NOT NULL,
Against VARCHAR2(12) REFERENCES PTYPE(name) NOT NULL);

INSERT INTO Is_Not_Eff VALUES ('Normal',  'Ghost');
INSERT INTO Is_Not_Eff VALUES ('Electric', 'Ground');
INSERT INTO Is_Not_Eff VALUES ('Fighting', 'Ghost');
INSERT INTO Is_Not_Eff VALUES ('Poison', 'Steel');
INSERT INTO Is_Not_Eff VALUES ('Ground', 'Flying');
INSERT INTO Is_Not_Eff VALUES ('Psychic', 'Dark');
INSERT INTO Is_Not_Eff VALUES ('Ghost', 'Normal');
INSERT INTO Is_Not_Eff VALUES ('Dragon', 'Fairy');

CREATE TABLE IS_NOT_VRY_EFF
    (Type VARCHAR2(12) REFERENCES PTYPE(Name) NOT NULL,
Against VARCHAR2(12) REFERENCES PTYPE(Name) NOT NULL);

INSERT INTO Is_Not_Vry_Eff VALUES ('Normal', 'Rock');
INSERT INTO Is_Not_Vry_Eff VALUES ('Normal', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fire', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fire', 'Water');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fire', 'Rock');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fire', 'Dragon');
INSERT INTO Is_Not_Vry_Eff VALUES ('Water', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Water', 'Grass');
INSERT INTO Is_Not_Vry_Eff VALUES ('Water', 'Dragon');
INSERT INTO Is_Not_Vry_Eff VALUES ('Electric', 'Electric');
INSERT INTO Is_Not_Vry_Eff VALUES ('Electric', 'Grass');
INSERT INTO Is_Not_Vry_Eff VALUES ('Electric', 'Dragon');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Grass');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Poison');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Flying');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Bug');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Dragon');
INSERT INTO Is_Not_Vry_Eff VALUES ('Grass', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ice', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ice', 'Water');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ice', 'Ice');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ice', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fighting', 'Poison');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fighting', 'Flying');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fighting', 'Psychic');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fighting', 'Bug');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fighting', 'Fairy');
INSERT INTO Is_Not_Vry_Eff VALUES ('Poison', 'Poison');
INSERT INTO Is_Not_Vry_Eff VALUES ('Poison', 'Ground');
INSERT INTO Is_Not_Vry_Eff VALUES ('Poison', 'Rock');
INSERT INTO Is_Not_Vry_Eff VALUES ('Poison', 'Ghost');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ground', 'Grass');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ground', 'Bug');
INSERT INTO Is_Not_Vry_Eff VALUES ('Flying', 'Electric');
INSERT INTO Is_Not_Vry_Eff VALUES ('Flying', 'Rock');
INSERT INTO Is_Not_Vry_Eff VALUES ('Flying', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Psychic', 'Psychic');
INSERT INTO Is_Not_Vry_Eff VALUES ('Psychic', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Fighting');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Poison');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Flying');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Ghost');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Bug', 'Fairy');
INSERT INTO Is_Not_Vry_Eff VALUES ('Rock', 'Fighting');
INSERT INTO Is_Not_Vry_Eff VALUES ('Rock', 'Ground');
INSERT INTO Is_Not_Vry_Eff VALUES ('Rock', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Ghost', 'Dark');
INSERT INTO Is_Not_Vry_Eff VALUES ('Dragon', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Steel', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Steel', 'Water');
INSERT INTO Is_Not_Vry_Eff VALUES ('Steel', 'Electric');
INSERT INTO Is_Not_Vry_Eff VALUES ('Steel', 'Steel');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fairy', 'Fire');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fairy', 'Fighting');
INSERT INTO Is_Not_Vry_Eff VALUES ('Fairy', 'Steel');

CREATE TABLE IS_SPR_EFF
    (Type VARCHAR2(12) REFERENCES PTYPE(Name) NOT NULL,
Against VARCHAR2(12) REFERENCES PTYPE(Name) NOT NULL);

INSERT INTO Is_Spr_Eff VALUES ('Fire', 'Grass');
INSERT INTO Is_Spr_Eff VALUES ('Fire', 'Ice');
INSERT INTO Is_Spr_Eff VALUES ('Fire', 'Bug');
INSERT INTO Is_Spr_Eff VALUES ('Fire', 'Steel');
INSERT INTO Is_Spr_Eff VALUES ('Water', 'Fire');
INSERT INTO Is_Spr_Eff VALUES ('Water', 'Ground');
INSERT INTO Is_Spr_Eff VALUES ('Water', 'Rock');
INSERT INTO Is_Spr_Eff VALUES ('Electric', 'Water');
INSERT INTO Is_Spr_Eff VALUES ('Electric', 'Flying');
INSERT INTO Is_Spr_Eff VALUES ('Grass', 'Water');
INSERT INTO Is_Spr_Eff VALUES ('Grass', 'Ground');
INSERT INTO Is_Spr_Eff VALUES ('Grass', 'Rock');
INSERT INTO Is_Spr_Eff VALUES ('Ice', 'Grass');
INSERT INTO Is_Spr_Eff VALUES ('Ice', 'Ground');
INSERT INTO Is_Spr_Eff VALUES ('Ice', 'Flying');
INSERT INTO Is_Spr_Eff VALUES ('Ice', 'Dragon');
INSERT INTO Is_Spr_Eff VALUES ('Fighting', 'Normal');
INSERT INTO Is_Spr_Eff VALUES ('Fighting', 'Ice');
INSERT INTO Is_Spr_Eff VALUES ('Fighting', 'Rock');
INSERT INTO Is_Spr_Eff VALUES ('Fighting', 'Dark');
INSERT INTO Is_Spr_Eff VALUES ('Fighting', 'Steel');
INSERT INTO Is_Spr_Eff VALUES ('Poison', 'Grass');
INSERT INTO Is_Spr_Eff VALUES ('Poison', 'Fairy');
INSERT INTO Is_Spr_Eff VALUES ('Ground', 'Fire');
INSERT INTO Is_Spr_Eff VALUES ('Ground', 'Electric');
INSERT INTO Is_Spr_Eff VALUES ('Ground', 'Poison');
INSERT INTO Is_Spr_Eff VALUES ('Ground', 'Rock');
INSERT INTO Is_Spr_Eff VALUES ('Ground', 'Steel');
INSERT INTO Is_Spr_Eff VALUES ('Flying', 'Grass');
INSERT INTO Is_Spr_Eff VALUES ('Flying', 'Fighting');
INSERT INTO Is_Spr_Eff VALUES ('Flying', 'Bug');
INSERT INTO Is_Spr_Eff VALUES ('Psychic', 'Fighting');
INSERT INTO Is_Spr_Eff VALUES ('Psychic', 'Poison');
INSERT INTO Is_Spr_Eff VALUES ('Bug', 'Grass');
INSERT INTO Is_Spr_Eff VALUES ('Bug', 'Psychic');
INSERT INTO Is_Spr_Eff VALUES ('Bug', 'Dark');
INSERT INTO Is_Spr_Eff VALUES ('Rock', 'Fire');
INSERT INTO Is_Spr_Eff VALUES ('Rock', 'Ice');
INSERT INTO Is_Spr_Eff VALUES ('Rock', 'Flying');
INSERT INTO Is_Spr_Eff VALUES ('Rock', 'Bug');
INSERT INTO Is_Spr_Eff VALUES ('Ghost', 'Psychic');
INSERT INTO Is_Spr_Eff VALUES ('Ghost', 'Ghost');
INSERT INTO Is_Spr_Eff VALUES ('Dragon', 'Dragon');
INSERT INTO Is_Spr_Eff VALUES ('Dark', 'Psychic');
INSERT INTO Is_Spr_Eff VALUES ('Dark', 'Ghost');
INSERT INTO Is_Spr_Eff VALUES ('Steel', 'Ice');
INSERT INTO Is_Spr_Eff VALUES ('Steel', 'Rock');
INSERT INTO Is_Spr_Eff VALUES ('Steel', 'Fairy');
INSERT INTO Is_Spr_Eff VALUES ('Fairy', 'Fighting');
INSERT INTO Is_Spr_Eff VALUES ('Fairy', 'Dragon');
INSERT INTO Is_Spr_Eff VALUES ('Fairy', 'Dark');

ALTER TABLE Gym ENABLE CONSTRAINT gymtown_fk;
ALTER TABLE Gym ENABLE CONSTRAINT gymleader_fk;
ALTER TABLE Move ENABLE CONSTRAINT movetype_fk;
ALTER TABLE Known_By ENABLE CONSTRAINT knownbymovename;
ALTER TABLE Known_By ENABLE CONSTRAINT knownbypokemonid;
ALTER TABLE Move_Effect ENABLE CONSTRAINT moveeffectmove_fk;
ALTER TABLE Item_Effect ENABLE CONSTRAINT itemeffitem;
ALTER TABLE Used_By ENABLE CONSTRAINT usedbyitem;
ALTER TABLE Used_By ENABLE CONSTRAINT usedbytrainer;
ALTER TABLE Pokemon ENABLE CONSTRAINT pokemonowner;
ALTER TABLE Goes_To ENABLE CONSTRAINT goestoroute;
ALTER TABLE Goes_To ENABLE CONSTRAINT goestotown;
ALTER TABLE Pokemon_Is_Type ENABLE CONSTRAINT istypepokemon;
ALTER TABLE Pokemon_Is_Type ENABLE CONSTRAINT istypetype;
