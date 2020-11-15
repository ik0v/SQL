# 1.1 
# Write INSERT-sentences to add a book written by 2 new authors.
# Book to be added has title "Databases" written by Kjell Hansen and Tore Mallaug.
# Publisher is Gyldendal.
# Write INSERT-sentences for tables book, author and book_author.
# NB! Sequence is important here. 

SELECT publisher_id
FROM publisher
WHERE publisher_name='Gyldendal'; -- publisher id is 2

INSERT INTO book
(title, yr_published, publisher_id)
VALUES('Databases', 2008, 2);

INSERT INTO author
(first_name, last_name, nationality)
VALUES ('Tore','Mallaug','Norsk'),
('Kjell Toft','Hansen','Norsk');

INSERT INTO book_author
VALUES(26,13),(26,14);

# 1.2
# Try to correct some wrong data in our database:
# • Birth year to Hornby is wrong
# • Last name of author Hamsun was written as 'Hamsund'. Write SQL code to correct it.  
# • Update yr_born and yr_died (for authors passed away) columns.

UPDATE author
SET yr_born=1957
WHERE last_name='Hornby';

UPDATE author
SET last_name='Hamsun'
WHERE last_name='Hamsun'; -- last name was actually correct

UPDATE author
SET yr_born=1942, yr_died=2018
WHERE last_name='Hawking';

UPDATE author
SET yr_born=1922, yr_died=2010
WHERE last_name='Saramago';

UPDATE author
SET yr_born=1948, yr_died=2015
WHERE last_name='Mankell';

UPDATE author
SET yr_born=1958
WHERE last_name='Fielding';

UPDATE author
SET yr_born=1949
WHERE last_name='Sirowitz';

UPDATE author
SET yr_born=1953
WHERE last_name='Christensen';

UPDATE author
SET yr_born=1969
WHERE last_name='Loe';

UPDATE author
SET last_name='Toole'
WHERE last_name='Tool';

UPDATE author
SET yr_born=1949
WHERE last_name='Follet';