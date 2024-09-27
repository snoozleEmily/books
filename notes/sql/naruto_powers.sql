CREATE TABLE chakra_natures (
  id NUMBER PRIMARY KEY,
  element VARCHAR2(100) NOT NULL,
  pronunciation VARCHAR2(100),
  kanji VARCHAR2(10)
);

CREATE TABLE chakra_relations (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  attacker_chakra_id NUMBER REFERENCES chakra_natures(id),
  defender_chakra_id NUMBER REFERENCES chakra_natures(id),
  relation_type VARCHAR2(10) -- 'weak', 'strong' or 'equal'
);

INSERT INTO chakra_natures (id, element, pronunciation, kanji) VALUES
(1, 'fire', 'katon', '火'), 
(2, 'water', 'suiton', '水'), 
(3, 'air', 'fūton', '風'), 
(4, 'earth', 'doton', '土'), 
(5, 'lightning', 'raiton', '雷'), 
(6, 'yin', 'in', '陰'), 
(7, 'yang', 'yō', '陽');

INSERT INTO chakra_relations (attacker_chakra_id, defender_chakra_id, relation_type) VALUES
(1, 2, 'weak'),   -- Fire < Water
(1, 3, 'strong'), -- Fire > Air
(2, 1, 'weak'),   -- Water < Fire
(2, 5, 'strong'), -- Water > Lightning
(4, 3, 'strong'), -- Earth > Air
(4, 5, 'weak'),   -- Earth < Lightning
(3, 1, 'weak'),   -- Air < Fire
(3, 4, 'strong'), -- Air > Earth
(5, 2, 'weak'),   -- Lightning < Water
(5, 4, 'strong'), -- Lightning > Earth
(6, 1, 'strong'), -- Yin > Fire
(6, 2, 'strong'), -- Yin > Water
(6, 3, 'strong'), -- Yin > Air
(6, 4, 'strong'), -- Yin > Earth
(6, 5, 'strong'), -- Yin > Lightning
(7, 1, 'strong'), -- Yang > Fire
(7, 2, 'strong'), -- Yang > Water
(7, 3, 'strong'), -- Yang > Air
(7, 4, 'strong'), -- Yang > Earth
(7, 5, 'strong'); -- Yang > Lightning

-- Declare variables for selecting relation type
DECLARE
  player_element_id NUMBER := 1;
  enemy_element_id NUMBER := 2; 
  relation_type VARCHAR2(10) := 'equal'; -- Set default value before querying
BEGIN
  -- Output the initial values
  DBMS_OUTPUT.PUT_LINE('Player Element ID: ' || player_element_id);
  DBMS_OUTPUT.PUT_LINE('Enemy Element ID: ' || enemy_element_id);

  -- Try to select the relation type
  BEGIN
    SELECT relation_type INTO relation_type
    FROM chakra_relations
    WHERE attacker_chakra_id = player_element_id
      AND defender_chakra_id = enemy_element_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No specific relation found, inserting default relation.');
      
      -- Insert default relation if it doesn't exist
      INSERT INTO chakra_relations (attacker_chakra_id, defender_chakra_id, relation_type)
      VALUES (player_element_id, enemy_element_id, 'equal');
  END;

  -- Output the final result
  DBMS_OUTPUT.PUT_LINE('Final Relation Type: ' || relation_type);
END;
/

CREATE TABLE jutsus (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  jutsu_name VARCHAR2(255) NOT NULL,
  pronunciation  VARCHAR2(255),
  kanji VARCHAR2(255),
  element_id NUMBER REFERENCES chakra_natures(id)
);

-- Fire Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Great Fireball Technique', 'Gōkakyū no Jutsu', 'ごうかきゅう の じゅつ', 1),
('Phoenix Flower Jutsu', 'Hōsenka no Jutsu', 'ほうせんか の じゅつ', 1),
('Fire Dragon Flame Bullet', 'Karyū Endan', 'かりゅう えんだん', 1),
('Great Flame Annihilation', 'Gōka Mekkyaku', 'ごうか めっきゃく', 1),
('Flame Bullet', 'Endan', 'えんだん', 1),
('Ash Pile Burning', 'Haisekishō', 'はいせきしょう', 1),
('Dragon Flame Release Song', 'Ryūen Hōka no Jutsu', 'りゅうえん ほうか の じゅつ', 1),
('Intelligent Hard Work', 'Zukokku', 'ずこっく', 1),
('Great Fire Destruction', 'Gōka Messhitsu', 'ごうか めっしつ', 1),
('Dragon Fire Technique', 'Ryūka no Jutsu', 'りゅうか の じゅつ', 1),
('Flame Meteor', 'Enkō no Jutsu', 'えんこう の じゅつ', 1),
('Blast Wave Wild Dance', 'Bakufu Ranbu', 'ばくふ らんぶ', 1),
('Toad Oil Flame Bullet', 'Gamayu Endan', 'がまゆ えんだん', 1),
('Fire Dragon Bomb', 'Karyūdan', 'かりゅうだん', 1),
('Majestic Destroyer Flame', 'Haijingakure', 'はいじんがくれ', 1);

-- Water Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Water Dragon Bullet Technique', 'Suiryūdan no Jutsu', 'すいりゅうだん の じゅつ', 2),
('Water Wall', 'Suijinheki', 'すいじんへき', 2),
('Water Prison Jutsu', 'Suirō no Jutsu', 'すいろう の じゅつ', 2),
('Water Clone Jutsu', 'Mizu Bunshin no Jutsu', 'みず ぶんしん の じゅつ', 2),
('Water Shark Bullet Technique', 'Suikōdan no Jutsu', 'すいこうだん の じゅつ', 2),
('Great Waterfall Technique', 'Daibakufu no Jutsu', 'だいばくふ の じゅつ', 2),
('Water Colliding Wave', 'Suishōha', 'すいしょうは', 2),
('Water Severing Wave', 'Mizukiri no Yaiba', 'みずきり の やいば', 2),
('Great Exploding Water Colliding Wave', 'Daikōdan no Jutsu', 'だいこうだん の じゅつ', 2),
('Water Dragon Blast Technique', 'Suiryūbaku', 'すいりゅうばく', 2),
('Water Bullet', 'Teppōdama', 'てっぽうだま', 2),
('Hidden Mist Jutsu', 'Kirigakure no Jutsu', 'きりがくれ の じゅつ', 2),
('Starch Syrup Capturing Field', 'Mizuame Nabara', 'みずあめ なばら', 2),
('Water Formation Wall', 'Suijinchū', 'すいじんちゅう', 2),
('Water Needle', 'Mizu Senbon', 'みず せんぼん', 2);

-- Wind Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Great Breakthrough', 'Daitoppa', 'だいとっぱ', 3),
('Vacuum Blade', 'Shinkūjin', 'しんくうじん', 3),
('Vacuum Sphere', 'Shinkūgyoku', 'しんくうぎょく', 3),
('Pressure Damage', 'Atsugai', 'あつがい', 3),
('Gale Palm', 'Reppūshō', 'れっぷうしょう', 3),
('Wind Cutter Technique', 'Kazekiri no Jutsu', 'かぜきり の じゅつ', 3),
('Whirlwind Fist', 'Senpūken', 'せんぷうけん', 3),
('Vacuum Great Sphere', 'Shinkū Taigyoku', 'しんくう たいぎょく', 3),
('Wind Cutter', 'Kaze no Yaiba', 'かぜ の やいば', 3),
('Divine Wind', 'Kamikaze', 'かみかぜ', 3),
('Vacuum Wave', 'Shinkūha', 'しんくうは', 3),
('Tornado Fist', 'Tatsumaki no Kōgeki', 'たつまき の こうげき', 3),
('Godly Wind from the Mountains', 'Kami Oroshi', 'かみ おろし', 3),
('Tornado Vacuum', 'Tatsumaki Shinkū', 'たつまき しんくう', 3),
('Spiraling Wind Ball', 'Rasen Fūbō', 'らせん ふうぼう', 3);

-- Earth Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Earth-Style Wall', 'Doryūheki', 'どりゅうへき', 4),
('Mud Wall', 'Doryūsō', 'どりゅうそう', 4),
('Mud Wave', 'Doryūha', 'どりゅうは', 4),
('Earth Dragon Bullet', 'Doryūdan', 'どりゅうだん', 4),
('Hiding Like a Mole Technique', 'Moguragakure no Jutsu', 'もぐらがくれ の じゅつ', 4),
('Earth Dome', 'Doryū Jōheki', 'どりゅう じょうへき', 4),
('Rock Fist', 'Iwa no Kōgeki', 'いわ の こうげき', 4),
('Mountain Jutsu', 'Iwaken Jutsu', 'いわけん じゅつ', 4),
('Weighted Boulder Jutsu', 'Keijūgan no Jutsu', 'けいじゅうがん の じゅつ', 4),
('Mud Binding', 'Dorō Dōmu', 'どろう どーむ', 4),
('Mud Dragon', 'Doryū Taiga', 'どりゅう たいが', 4),
('Swamp of the Underworld', 'Yomi Numa', 'よみ ぬま', 4),
('Open Earth Rising Excavation', 'Chidōkaku', 'ちどうかく', 4),
('Mud Slide', 'Sando no Jutsu', 'さんど の じゅつ', 4),
('Rock Avalanche', 'Iwayado Kuzushi', 'いわやど くずし', 4);

-- Lightning Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Chidori', 'Chidori', '千鳥', 5),
('Lightning Blade', 'Raikiri', 'らいきり', 5),
('Lightning Transmission', 'Raiden', 'らいでん', 5),
('Lightning Ball', 'Raikyū', 'らいきゅう', 5),
('Lightning Net', 'Kaminari no Shibari', 'かみなり の しばり', 5),
('Chidori Stream', 'Chidori Nagashi', 'ちどり ながし', 5),
('Purple Electricity', 'Shiden', 'しでん', 5),
('Lightning Beast Tracking Fang', 'Raijū Tsuiga', 'らいじゅう ついが', 5),
('Lightning Strike Armor', 'Raiton no Yoroi', 'らいとん の よろい', 5),
('Thunderbolt', 'Ikazuchi no Kiba', 'いかづち の きば', 5),
('Black Panther', 'Kuro Pansa', 'くろ ぱんさ', 5),
('False Darkness', 'Gian', 'ぎあん', 5),
('Flash Pillar', 'Kaminari no Kōshō', 'かみなり の こうしょう', 5),
('Thunderclap Arrow', 'Sandāsaikō', 'さんだあさいこう', 5),
('Electric Armor', 'Denki no Yoroi', 'でんき の よろい', 5);

-- Yin Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Shadow Clone Technique', 'Kage Bunshin no Jutsu', 'かげ ぶんしん の じゅつ', 6),
('Shadows of the Moon', 'Tsuki no Kage', 'つき の かげ', 6),
('Cursed Technique', 'Jinjutsu', 'じんじゅつ', 6),
('Nightmare Technique', 'Yume no Jutsu', 'ゆめ の じゅつ', 6),
('Mind Transfer Technique', 'Shintenshin no Jutsu', 'しんてんしん の じゅつ', 6),
('Darkness Technique', 'Yamiyo no Jutsu', 'やみよ の じゅつ', 6),
('Mind Manipulation', 'Shinnen no Ninjutsu', 'しんねん の にんじゅつ', 6),
('Illusionary World', 'Maboroshi no Sekai', 'まぼろし の せかい', 6),
('Shadow Possession Technique', 'Kage Mane no Jutsu', 'かげ まね の じゅつ', 6),
('Dream Manipulation', 'Yume no Sōzō', 'ゆめ の そうぞう', 6);

-- Yang Jutsus
INSERT INTO jutsus (jutsu_name, pronunciation, kanji, element_id) VALUES
('Healing Technique', 'Yōjutsu', 'ようじゅつ', 7),
('Light Clone Technique', 'Hikari Bunshin no Jutsu', 'ひかり ぶんしん の じゅつ', 7),
('Physical Enhancement', 'Shintai Kyōka', 'しんたい きょうか', 7),
('Energy Transfer', 'Enerugi no Ien', 'えねるぎ の いえん', 7),
('Life Force Technique', 'Inochi no Jutsu', 'いのち の じゅつ', 7),
('Rising Phoenix', 'Fénix no Tachi', 'ふぇにっくす の たち', 7),
('Yang Release', 'Yō no Jutsu', 'よう の じゅつ', 7),
('Solar Flare', 'Taiyō no Kagayaki', 'たいよう の かがやき', 7),
('Energy Shield', 'Enerugi no Tate', 'えねるぎ の たて', 7),
('Light Burst', 'Hikari no Bakuhatsu', 'ひかり の ばくはつ', 7);



CREATE TABLE player (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  first_element_id NUMBER REFERENCES chakra_natures(id),
  second_element_id NUMBER REFERENCES chakra_natures(id),
  yin_jutsu_id NUMBER REFERENCES jutsus(id),
  yang_jutsu_id NUMBER REFERENCES jutsus(id),
  CONSTRAINT ying_or_yang CHECK (
    (yin_jutsu_id IS NOT NULL AND yang_jutsu_id IS NULL) OR
    (yin_jutsu_id IS NULL AND yang_jutsu_id IS NOT NULL)
  )
);

CREATE TABLE player_jutsus (
  player_id NUMBER REFERENCES player(id),
  jutsu_id NUMBER REFERENCES jutsus(id),
  
  -- Ensures the player can't have the same jutsu listed multiple times
  PRIMARY KEY (player_id, jutsu_id) 
);

-- Testing Player (hard coded)
INSERT INTO player (name, first_element_id, second_element_id, yin_jutsu_id) 
VALUES ('Naruto', 1, 3, 1); -- Example with Yin Jutsu


-- Generate array of all jutsus of the  player
CREATE OR REPLACE TRIGGER jutsu_listing
AFTER INSERT ON player
FOR EACH ROW
BEGIN
  INSERT INTO player_jutsus (player_id, jutsu_id)
  SELECT :new.id, id
  FROM jutsus
  WHERE element_id IN (:NEW.first_element_id, :NEW.second_element_id)
  UNION ALL
  
  SELECT :NEW.id, :NEW.yin_jutsu_id
  WHERE :NEW.yin_jutsu_id IS NOT NULL
  UNION ALL
  SELECT :NEW.id, :NEW.yang_jutsu_id
  WHERE :NEW.yang_jutsu_id IS NOT NULL;
END;













