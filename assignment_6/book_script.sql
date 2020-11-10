-- Excercise 6, translated from norwegian

-- Database structure

-- CONSULTANT(cons_id, first_name, last_name, email)
-- BOOK(book_id, title, yr_published, publisher_id*)
-- PUBLISHER(publisher_id, publisher_name, address, phone)
-- AUTHOR(author_id, first_name, last_name, yr_born, yr_died, nationality)
-- BOOK_AUTHOR(book_id*, author_id*)

-- Deleting table if exists

DROP TABLE IF EXISTS book_author;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS consultant;

-- Creating tables with primary key

CREATE TABLE publisher(
 publisher_id INTEGER NOT NULL AUTO_INCREMENT,
 publisher_name VARCHAR(30),
 address VARCHAR(30),
 phone CHAR(15),
CONSTRAINT publisher_pk PRIMARY KEY(publisher_id));

CREATE TABLE book(
 book_id INTEGER NOT NULL AUTO_INCREMENT,
 title VARCHAR(30),
 yr_published INTEGER,
 publisher_id INTEGER,
CONSTRAINT book_pk PRIMARY KEY(book_id));

CREATE TABLE author(
 author_id INTEGER NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(20),
 last_name VARCHAR (30),
 yr_born INTEGER,
 yr_died INTEGER,
 nationality VARCHAR(20),
CONSTRAINT author_pk PRIMARY KEY(author_id));

CREATE TABLE book_author(
 book_id INTEGER NOT NULL,
 author_id INTEGER NOT NULL,
CONSTRAINT book_author_pk PRIMARY KEY(book_id, author_id));

CREATE TABLE consultant(
  cons_id INTEGER NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(20),
  last_name VARCHAR (30),
  email VARCHAR(30),
CONSTRAINT consultant_pk PRIMARY KEY(cons_id));      

-- Adding foreign keys

ALTER TABLE book
 ADD CONSTRAINT book_fk FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id);

ALTER TABLE book_author
 ADD CONSTRAINT book_author_fk1 FOREIGN KEY(book_id) REFERENCES book(book_id);
 
ALTER TABLE book_author
 ADD CONSTRAINT book_author_fk2 FOREIGN KEY(author_id) REFERENCES author(author_id);
 
-- Adding data to tables

INSERT INTO publisher VALUES(DEFAULT,'Tapir','Trondheim', '73590000');
INSERT INTO publisher VALUES(DEFAULT,'Gyldendal','Oslo', '22220000');
INSERT INTO publisher VALUES(DEFAULT,'Cappelen','Oslo', '22200000');
INSERT INTO publisher VALUES(DEFAULT,'Universitetsforlaget','Oslo', '23230000');
INSERT INTO publisher VALUES(DEFAULT,'Achehaug','Oslo', '22000000');
INSERT INTO publisher VALUES(DEFAULT,'Oktober','Oslo', '22002200');
INSERT INTO publisher VALUES(DEFAULT,'Tiden','Oslo', '22232223');
INSERT INTO publisher VALUES(DEFAULT,'Harper Collins','USA',NULL);

INSERT INTO book VALUES(DEFAULT,'Tåpenes',1995,7);
INSERT INTO book VALUES(DEFAULT,'Rebecca',1981,3);
INSERT INTO book VALUES(DEFAULT,'Gutter er gutter',1995,5);
INSERT INTO book VALUES(DEFAULT,'Microserfs',1991,8);
INSERT INTO book VALUES(DEFAULT,'Generation X',1995,8);
INSERT INTO book VALUES(DEFAULT,'Klosterkrønike',1982,3);
INSERT INTO book VALUES(DEFAULT,'Universet',1988,3);
INSERT INTO book VALUES(DEFAULT,'Nålen',1978,3);
INSERT INTO book VALUES(DEFAULT,'Markens grøde',1917,2);
INSERT INTO book VALUES(DEFAULT,'Victoria',1898,2);
INSERT INTO book VALUES(DEFAULT,'Sult',1890,2);
INSERT INTO book VALUES(DEFAULT,'Benoni',1908,2);
INSERT INTO book VALUES(DEFAULT,'Rosa',1908,2);
INSERT INTO book VALUES(DEFAULT,'Et skritt',1997,2);
INSERT INTO book VALUES(DEFAULT,'Den femte',1996,2);
INSERT INTO book VALUES(DEFAULT,'Villspor',1995,2);
INSERT INTO book VALUES(DEFAULT,'Silkeridderen',1994,2);
INSERT INTO book VALUES(DEFAULT,'Den hvite hingsten',1992,2);
INSERT INTO book VALUES(DEFAULT,'Hunder',1992,2);
INSERT INTO book VALUES(DEFAULT,'Bridget Jones',1995,5);
INSERT INTO book VALUES(DEFAULT,'Se terapeuten',1998,3);
INSERT INTO book VALUES(DEFAULT,'Sa mor',1996,3);
INSERT INTO book VALUES(DEFAULT,'Jubel',1995,3);
INSERT INTO book VALUES(DEFAULT,'Tatt av kvinnen',1993,3);
INSERT INTO book VALUES(DEFAULT,'Supernaiv',1996,3);

INSERT INTO author VALUES(DEFAULT,'John','Tool',1937, 1969, 'USA');
INSERT INTO author VALUES(DEFAULT,'Ken','Follet',NULL, NULL, 'Britisk');
INSERT INTO author VALUES(DEFAULT,'Stephen','Hawking',NULL, NULL, 'Britisk');
INSERT INTO author VALUES(DEFAULT,'Jose','Saramago',1942, NULL, 'Portugisisk');
INSERT INTO author VALUES(DEFAULT,'Douglas','Coupland',1961, NULL, 'Canadisk');
INSERT INTO author VALUES(DEFAULT,'Nick','Hornby',1857, NULL, 'Britisk');
INSERT INTO author VALUES(DEFAULT,'Knut','Hamsun',1859, 1952, 'Norsk');
INSERT INTO author VALUES(DEFAULT,'Henning','Mankell',1948, NULL, 'Svensk');
INSERT INTO author VALUES(DEFAULT,'Helen','Fielding',NULL, NULL, 'Britisk');
INSERT INTO author VALUES(DEFAULT,'Hal','Sirowitz',NULL, NULL, 'USA');
INSERT INTO author VALUES(DEFAULT,'Lars S.','Christensen',NULL, NULL, 'Norsk');
INSERT INTO author VALUES(DEFAULT,'Erlend','Loe',NULL, NULL, 'Norsk');

INSERT INTO book_author VALUES(1, 1);
INSERT INTO book_author VALUES(2, 2);
INSERT INTO book_author VALUES(3, 6);
INSERT INTO book_author VALUES(4, 5);
INSERT INTO book_author VALUES(5, 5);
INSERT INTO book_author VALUES(6, 4);
INSERT INTO book_author VALUES(7, 3);
INSERT INTO book_author VALUES(8, 2);
INSERT INTO book_author VALUES(9, 7);
INSERT INTO book_author VALUES(10, 7);
INSERT INTO book_author VALUES(11, 7);
INSERT INTO book_author VALUES(12, 1);
INSERT INTO book_author VALUES(13, 1);
INSERT INTO book_author VALUES(14, 8);
INSERT INTO book_author VALUES(15, 8);
INSERT INTO book_author VALUES(16, 8);
INSERT INTO book_author VALUES(17, 8);
INSERT INTO book_author VALUES(18, 8);
INSERT INTO book_author VALUES(19, 8);
INSERT INTO book_author VALUES(20, 9);
INSERT INTO book_author VALUES(21, 10);
INSERT INTO book_author VALUES(22, 10);
INSERT INTO book_author VALUES(23, 11);
INSERT INTO book_author VALUES(24, 12);
INSERT INTO book_author VALUES(25, 12);

INSERT INTO consultant VALUES(DEFAULT, 'Anne', 'Hansen', 'anne.hansen@xxx.com');
INSERT INTO consultant VALUES(DEFAULT, 'Bjørn', 'Jensen', 'bjornj@yyy.com');
INSERT INTO consultant VALUES(DEFAULT, 'Anne', 'Ås', 'anne.as@zzz.com');