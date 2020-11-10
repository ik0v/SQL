# 1.1 Get name and address of publisher who printed book 'Generation X'.

SELECT publisher_name, address
FROM publisher p
INNER JOIN book b
ON p.publisher_id = b.publisher_id
WHERE title = 'Generation X';

# 1.2 Get titles of all books written by Hamsun.

SELECT title
FROM book b 
INNER JOIN book_author ba 
ON b.book_id = ba.book_id 
INNER JOIN author a
ON ba.author_id = a.author_id
WHERE last_name = 'Hamsun'
ORDER BY title;

# 1.3 Get titles and publisher of each and every book.

SELECT title, publisher_name
FROM book b
INNER JOIN publisher p
ON b.publisher_id = p.publisher_id;

# extra excercise: same info, now including all publishers

SELECT title, publisher_name
FROM publisher p 
LEFT JOIN book b
ON b.publisher_id = p.publisher_id
ORDER BY title; 

# 1.4 Find authors who published at least 1 book at publisher 'Cappelen'.

SELECT 
CONCAT(first_name, ' ', last_name) AS name,
COUNT(*) AS books_qty,
p.publisher_name AS publisher
FROM author a
INNER JOIN book_author ba
ON a.author_id = ba.author_id
INNER JOIN book b
ON b.book_id = ba.book_id
INNER JOIN publisher p
ON p.publisher_id = b.publisher_id
WHERE publisher_name = 'Cappelen'
GROUP BY name, publisher;





