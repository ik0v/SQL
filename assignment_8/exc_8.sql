# 1.1 Extend book database with a new table.
# We want to add a new table for genre. There shall be 2 possible types, 
# "fiction" and "nonfiction" literature.
# Write a CREATE TABLE code, use appropriate primary key.

CREATE TABLE genre(
    genre_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    genre_name VARCHAR(20)
);

DESC genre; -- to check tables structure
INSERT INTO genre
    (genre_name)
VALUES('Fiction'), 
    ('Nonfiction');

# 1.2 Add a new foreign key to table book.
# Use SQL command ALTER TABLE to make a new foreign key in table book,
# which refers to new table genre from exc. 1.1

ALTER TABLE book
ADD genre INT;

ALTER TABLE book
ADD CONSTRAINT book_fk2
FOREIGN KEY (genre)
REFERENCES genre(genre_id);

---

UPDATE book
SET genre=2
WHERE title='Databases'; -- adding genre for a book 'Databases'
