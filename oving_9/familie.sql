-- Øving 9, egen database.

-- Oppretter databse familie

# CREATE DATABASE familie;
# USE familie

-- Oppretter tabell ektefeller

CREATE TABLE ektefeller(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR (20),
    etternavn VARCHAR (20),
    barn1 INT, barn2 INT, barn3 INT
);

-- Oppretter tabell søsken

CREATE TABLE sosken(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR (20),
    etternavn VARCHAR (20),
    ektefelle INT, 
    barn1 INT, barn2 INT, barn3 INT
);

-- Oppretter tabell barn

CREATE TABLE barn(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornavn VARCHAR (20),
    etternavn VARCHAR (20),
    forelder_sn INT, forelder_ekt INT
);

-- Legger til fremmednøkler

ALTER TABLE sosken
ADD FOREIGN KEY(ektefelle) 
REFERENCES ektefeller(id); 

ALTER TABLE sosken
ADD FOREIGN KEY(barn1) 
REFERENCES barn(id);

ALTER TABLE sosken
ADD FOREIGN KEY(barn2) 
REFERENCES barn(id);

ALTER TABLE sosken
ADD FOREIGN KEY(barn3) 
REFERENCES barn(id);

ALTER TABLE ektefeller
ADD FOREIGN KEY(barn1) 
REFERENCES barn(id);

ALTER TABLE ektefeller
ADD FOREIGN KEY(barn2) 
REFERENCES barn(id);

ALTER TABLE ektefeller
ADD FOREIGN KEY(barn3) 
REFERENCES barn(id);

ALTER TABLE barn
ADD FOREIGN KEY(forelder_sn) 
REFERENCES sosken(id);

ALTER TABLE barn
ADD FOREIGN KEY(forelder_ekt) 
REFERENCES ektefeller(id);

-- Setter inn verdier i tabell ektefeller

INSERT INTO ektefeller
(fornavn,etternavn)
VALUES('Anders','Knudsen'),
('Anna','Kuvaas'),
('Aleksander','Badrez'),
('Vladimir','Astad');

-- Setter inn verdier i tabell søsken

INSERT INTO sosken
(fornavn,etternavn, ektefelle)
VALUES('Marta','Knudsen', 1),
('Jonas','Kuvaas',2),
('Anna','Badrez',3),
('Luise','Astad',4),
('Ivar','Kuvaas',NULL);

-- Setter inn verdier i tabell barn

INSERT INTO barn
(fornavn,etternavn,forelder_sn,forelder_ekt)
VALUES('Arnold','Astad',4,4),
('Jonas','Knudsen',1,1),
('Roman','Kuvaas',2,2),
('Marta','Kuvaas',2,2),
('Esther','Astad',4,4),
('Damian','Astad',4,4);

-- Oppdaterer verdier i tabeller

UPDATE sosken
SET barn1=1,barn2=5,barn3=6
WHERE fornavn='Luise';

UPDATE sosken
SET barn1=2
WHERE fornavn='Marta';

UPDATE sosken
SET barn1=3,barn2=4
WHERE fornavn='Jonas';

UPDATE ektefeller
SET barn1=1,barn2=5,barn3=6
WHERE fornavn='Vladimir';

UPDATE ektefeller
SET barn1=2
WHERE fornavn='Anders';

UPDATE ektefeller
SET barn1=3,barn2=4
WHERE fornavn='Anna';


