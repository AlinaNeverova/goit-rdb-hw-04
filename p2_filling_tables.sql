USE LibraryManagement;

INSERT INTO authors (author_name)
VALUES     
	('Olena'),
    ('Taras'),
    ('Lesya');

INSERT INTO genres (genre_name)
VALUES     
	('Fantasy'),
    ('Drama'),
    ('Mystery');

INSERT INTO users (username, email)
VALUES     
	('Jack', 'jack@gmail.com'),
    ('Nick', 'nick@gmail.com'),
    ('Jane', 'jane@gmail.com');
    
INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES
  ('Something fantastic', 2018, 1, 1), 
  ('Something dramatic', 2020, 2, 2),
  ('Something mysterios', 2016, 3, 3);

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
  (1, 3, '2026-02-10', '2026-02-20'),
  (2, 1, '2026-02-15', NULL),
  (3, 2, '2026-02-01', '2026-02-12');