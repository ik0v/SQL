# 1.1-1.3 Opprett tabeller, legg til fremmednøkler og testdata
# Det er gjort i filen familie.sql

# 1.4 Hente ut data fra en tabell
# Lag en SELECT-setning som henter ut data fra en av tabellene du har opprettet.
# Spørringer for å vise barn fra en familie og deres mor:

SELECT fornavn AS mor,
barn1,barn2,barn3 
FROM sosken 
WHERE etternavn='Astad';

SELECT CONCAT(fornavn,' ',etternavn) AS 'barna til Luise'
FROM barn
WHERE etternavn='Astad';

# 1.5 Hente ut data fra alle tabellene
# Lag en SELECT-setning som henter ut noen data (velg selv hvilke attributter) fra alle tabellene du opprettet. 
# Relativt komplisert spørring for å vise hver familie, begge foreldre og alle deres barn.
# Null verdier er erstattet med ' ', altså mellomrom.

SELECT  
CONCAT(s.fornavn,' ',s.etternavn) AS forelder1,
CONCAT(e.fornavn,' ',e.etternavn) AS forelder2,
CONCAT(
	IFNULL(CONCAT(b1.fornavn,' ',b1.etternavn), ' ') ,
	IFNULL(CONCAT(', ',b2.fornavn,' ',b2.etternavn), ' ') ,
	IFNULL(CONCAT(', ',b3.fornavn,' ',b3.etternavn), ' ') 
) AS barna
FROM sosken s
JOIN ektefeller e
ON s.etternavn=e.etternavn
LEFT JOIN barn b1 
ON s.barn1=b1.id
LEFT JOIN barn b2 
ON s.barn2=b2.id
LEFT JOIN barn b3
ON s.barn3=b3.id
GROUP BY s.etternavn
ORDER BY s.barn3 DESC, s.barn2 DESC, s.barn1 DESC;

# 1.6 Lag en SELECT-setning som bruker en sub-spørring for å hente ut noen data,
# (velg selv hvilke attributter) fra tabellene dine.
# En spørring som viser antall søstre og brødre i familie

SELECT CONCAT('Det er ',
(SELECT COUNT(*) FROM sosken WHERE etternavn!='Kuvaas'),
' sostre i familie') AS ant_sis, 
CONCAT('Det er ',
(SELECT COUNT(*) FROM sosken WHERE etternavn='Kuvaas'),
' brodre i familie') AS ant_br; 
