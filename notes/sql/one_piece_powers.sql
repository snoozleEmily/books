-- Create table for Devil Fruits
CREATE TABLE devil_fruits (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    subpower VARCHAR2(50),
    description VARCHAR2(255)
);

-- Insert data into Devil Fruits table
INSERT INTO devil_fruits (power, subpower, description) VALUES 
('Devil Fruits', 'Paramecia', 'Grants unique abilities, not limited to physical transformations.'),
('Devil Fruits', 'Zoan', 'Allows the user to transform into an animal and gain its abilities.'),
('Devil Fruits', 'Logia', 'Enables the user to become a natural element and control it.');

-- Create table for Haki
CREATE TABLE haki (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    subpower VARCHAR2(50),
    description VARCHAR2(255)
);

-- Insert data into Haki table
INSERT INTO haki (power, subpower, description) VALUES 
('Haki', 'Kenbunshoku Haki', 'Allows the user to sense the presence and emotions of others.'),
('Haki', 'Busoshoku Haki', 'Enables the user to create invisible armor around themselves.'),
('Haki', 'Haoshoku Haki', 'Grants the user the ability to exert their will over others.');

-- Create table for Martial Arts
CREATE TABLE martial_arts (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    subpower VARCHAR2(50),
    description VARCHAR2(255)
);

-- Insert data into Martial Arts table
INSERT INTO martial_arts (power, subpower, description) VALUES 
('Martial Arts', 'Fish-Man Karate', 'Specialized fighting style of Fish-Men using water and fish movements.'),
('Martial Arts', 'Fish-Man Jujutsu', 'Focuses on grappling techniques and counterattacks.'),
('Martial Arts', 'Ryusoken', 'A martial art that utilizes pressure points and shockwaves.'),
('Martial Arts', 'Electro', 'Electricity-based attacks used by Minks.'),
('Martial Arts', 'Hasshoken', 'A shockwave-based martial art.');

-- Create table for Weather Control
CREATE TABLE weather_control (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    subpower VARCHAR2(50),
    description VARCHAR2(255)
);

-- Insert data into Weather Control table
INSERT INTO weather_control (power, subpower, description) VALUES 
('Weather Control', 'Clima-Tact', 'Nami''s weapon that manipulates weather.');

-- Create table for Rokushiki
CREATE TABLE rokushiki (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    subpower VARCHAR2(50),
    description VARCHAR2(255)
);

-- Insert data into Rokushiki table
INSERT INTO rokushiki (power, subpower, description) VALUES 
('Rokushiki', 'Soru', 'Super speed technique.'),
('Rokushiki', 'Geppo', 'Allows the user to walk on air.'),
('Rokushiki', 'Tekkai', 'Defensive technique that hardens the body.'),
('Rokushiki', 'Shigan', 'Finger gun attack technique.'),
('Rokushiki', 'Rankyaku', 'Air blade attack.'),
('Rokushiki', 'Kami-e', 'Dodging technique through flexibility.');

-- Create table for Cyborg Modifications
CREATE TABLE cyborg_modifications (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Cyborg Modifications table
INSERT INTO cyborg_modifications (power, description) VALUES 
('Cyborg Modifications', 'Enhancements used by Franky and Pacifistas for combat and defense.');

-- Create table for Giant Strength
CREATE TABLE giant_strength (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Giant Strength table
INSERT INTO giant_strength (power, description) VALUES 
('Giant Strength', 'Natural strength due to massive size.');

-- Create table for Vinsmoke Germa Technology
CREATE TABLE vinsmoke_germa (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Vinsmoke Germa Technology table
INSERT INTO vinsmoke_germa (power, description) VALUES 
('Vinsmoke Germa Technology', 'Raid Suits grant superhuman abilities.');

-- Create table for Minks' Sulong Form
CREATE TABLE minks_sulong (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Minks' Sulong Form table
INSERT INTO minks_sulong (power, description) VALUES 
('Minks'' Sulong Form', 'Powerful transformation during full moon.');

-- Create table for Seastone
CREATE TABLE seastone (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Seastone table
INSERT INTO seastone (power, description) VALUES 
('Seastone', 'Nullifies Devil Fruit powers, used in weapons and restraints.');

-- Create table for Weapons and Tools
CREATE TABLE weapons_tools (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    subpower VARCHAR2(50),
    description VARCHAR2(255)
);

-- Insert data into Weapons and Tools table
INSERT INTO weapons_tools (power, subpower, description) VALUES 
('Weapons and Tools', 'Meito', 'Legendary swords with extraordinary power.'),
('Weapons and Tools', 'Cursed Blades', 'Swords with curses but great power.'),
('Weapons and Tools', 'Santoryu', 'Three-Sword Style used by Zoro.'),
('Weapons and Tools', 'Ryou', 'Advanced Armament Haki.'),
('Weapons and Tools', 'Black Blade', 'Sword permanently coated in Haki.');

-- Create table for Race-Specific Powers
CREATE TABLE race_specific_powers (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Race-Specific Powers table
INSERT INTO race_specific_powers (power, description) VALUES 
('Fish-Men/Merfolk', 'Can breathe underwater and swim at high speeds.'),
('Minks', 'Can generate electricity using Electro.'),
('Lunarians', 'Generate fire and possess extreme durability.'),
('Oni', 'Known for great physical power.');

-- Create table for Ancient Weapons
CREATE TABLE ancient_weapons (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Ancient Weapons table
INSERT INTO ancient_weapons (power, description) VALUES 
('Pluton', 'Ancient warship with destructive capabilities.'),
('Poseidon', 'Control and communicate with Sea Kings.'),
('Uranus', 'Mysterious ancient weapon related to the sky.');

-- Create table for Voice of All Things
CREATE TABLE voice_of_all_things (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    power VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

-- Insert data into Voice of All Things table
INSERT INTO voice_of_all_things (power, description) VALUES 
('Voice of All Things', 'Ability to hear the voice of living creatures and objects.');


COMMIT;


-- See Tables
SELECT * FROM devil_fruits;
SELECT * FROM haki;
SELECT * FROM martial_arts;
SELECT * FROM weather_control;
SELECT * FROM rokushiki;
SELECT * FROM weapons_tools;
SELECT * FROM cyborg_modifications;
SELECT * FROM giant_strength;
SELECT * FROM vinsmoke_germa;
SELECT * FROM minks_sulong;
SELECT * FROM seastone;
SELECT * FROM ancient_weapons;
SELECT * FROM voice_of_all_things;

