
USE [Library]


CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_book_auhors (
	book_id INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL,
);
DROP TABLE tbl_borrower
CREATE TABLE tbl_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(12) NOT NULL
);
DROP TABLE tbl_book_loans
CREATE TABLE tbl_book_loans (
	book_id INT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out date default GETDATE() NULL,
	date_due date default DATEADD(day, 7, GETDATE())NOT NULL
);


DELETE FROM tbl_library_branch
DBCC CHECKIDENT(tbl_library_branch,RESEED, 0)
	
INSERT INTO tbl_library_branch
		(branch_name, address)
		VALUES 
		('Sharpstown', '555 n main st'),
		('Central', '123 e main st'),
		('south branch', '543 s main st'),
		('west branch', '987 w main st')
	;
	SELECT * FROM tbl_library_branch;


INSERT INTO tbl_publisher
	(publisher_name, address, phone)
	VALUES 
	('Scribner', '646 nw elm st', '555-445-7539'),
	('Picador USA', '123 e main st', '555-789-4125'),
	('Simon & Schuster', '543 s main st', '555-369-4896'),
	('Macmillan Inc.', '987 w main st', '555-145-6654'),
	('Geoffrey Bles', '237 w sitka st', '555-758-4288'),
	('Faber and Faber', '8642 w spruce ln', '555-365-3669'),
	('Allen & Unwin', '348 w main st', '555-348-3555'),
	('J. B. Lippincott & Co.', '987 w 24th st', '555-554-3574'),
	('Ken Kesey', '1674 nw 2nd ave', '555-354-3568'),
	('Harcourt', '987 w 24th st', '555-145-9674'),
	('G.P. Putnams Sons', '65 w 1st ave', '555-194-3584'),
	('Anchor', '344 e 20th st', '555-364-4254'),
	('Bantam', '5424 e 4th Ve', '555-456-3514')
;
	SELECT * FROM tbl_publisher;


INSERT INTO tbl_books
	(title, publisher_name)
	VALUES 
	('IT','Scribner'),
	('The Shining','Scribner'),
	('Pet Sematary','Scribner'),
	('The Dark Tower: The Gunslinger','Scribner'),
	('The Dark Tower: The Drawing of the Three','Scribner'),
	('The Dark Tower: The Waste Lands','Scribner'),
	('The Dark Tower: Wizard and Glass','Scribner'),
	('The Dark Tower','Scribner'),
	('The Lost Tribe', 'Picador USA'),
	('Catch-22', 'Simon & Schuster'),
	('Gone With the Wind', 'Macmillan Inc.'),
	('The Great Gatsby', 'Simon & Schuster'),
	('The Lion, The Witch and the Wardrobe', 'Geoffrey Bles'),
	('Lord of the Flies', 'Faber and Faber'),
	('The Lord of the Rings', 'Allen & Unwin'),
	('To Kill a Mockingbird', 'J. B. Lippincott & Co.'),
	('One Flew Over the Cuckoo’s Nest', 'Ken Kesey'),
	('All the King’s Men', 'Harcourt'),
	('The Titanic Secret', 'G.P. Putnams Sons'),
	('Pirate', 'G.P. Putnams Sons'),
	('The Cutthroat', 'G.P. Putnams Sons'),
	('The Thief', 'G.P. Putnams Sons'),
	('The Race', 'G.P. Putnams Sons'),
	('The Wrecker', 'G.P. Putnams Sons'),
	('The Chase', 'G.P. Putnams Sons'),
	('The Silent Sea', 'G.P. Putnams Sons'),
	('The Jungle', 'G.P. Putnams Sons'),
	('Plague Ship', 'G.P. Putnams Sons'),
	('Piranha', 'G.P. Putnams Sons'),
	('Deep Storm', 'Anchor'),
	('Terminal Freeze', 'Anchor'),
	('Death Match', 'Anchor'),
	('The Third Gate', 'Anchor'),
	('Full Wolf Moon', 'Anchor'),
	('Utopia', 'Anchor'),
	('Lethal Velocity', 'Anchor'),
	('A GAME OF THRONES', 'Bantam'),
	('A CLASH OF KINGS', 'Bantam'),
	('A STORM OF SWORDS', 'Bantam'),
	('A FEAST FOR CROWS', 'Bantam'),
	('A DANCE WITH DRAGONS', 'Bantam')
;
	SELECT * FROM tbl_books;

INSERT INTO tbl_book_auhors 
	(author_name, book_id)
	VALUES 
	('Stephen King', 1),
	('Stephen King', 2),
	('Stephen King', 3),
	('Stephen King', 4),
	('Stephen King', 5),
	('Stephen King', 6),
	('Stephen King', 7),
	('Stephen King', 8),
	('Mark Lee', 9),
	('Joseph Heller', 10),
	('Margaret Mitchell', 11),
	('F. Scott Fitzgerald', 12),
	('C.S. Lewis', 13),
	('William Golding', 14),
	('J.R.R. Tolkien', 15),
	('Harper Lee', 16),
	('Ken Kesey', 17),
	('Robert Penn Warren', 18),
	('Clive Cussler', 19),
	('Clive Cussler', 20),
	('Clive Cussler', 21),
	('Clive Cussler', 22),
	('Clive Cussler', 23),
	('Clive Cussler', 24),
	('Clive Cussler', 25),
	('Clive Cussler', 26),
	('Clive Cussler', 27),
	('Clive Cussler', 28),
	('Clive Cussler', 29),
	('Lincoln Child', 30),
	('Lincoln Child', 31),
	('Lincoln Child', 32),
	('Lincoln Child', 33),
	('Lincoln Child', 34),
	('Lincoln Child', 35),
	('Lincoln Child', 36),
	('George R. R. Martin', 37),
	('George R. R. Martin', 38),
	('George R. R. Martin', 39),
	('George R. R. Martin', 40),
	('George R. R. Martin', 41)
;
SELECT * FROM tbl_book_auhors;


INSERT INTO tbl_book_copies
		(book_id, branch_id, number_of_copies)
		VALUES 
		(2, 1, 6),  --Sharpstown
		(9, 1, 3),
		(10, 1, 7),
		(14, 1, 2),
		(15, 1, 8),
		(20, 1, 5),
		(30, 1, 5),
		(31, 1, 4),
		(38, 1, 6),
		(39, 1, 3),
		(1, 2, 3),  --Central
		(2, 2, 5),
		(3, 2, 2),
		(12, 2, 3),
		(15, 2, 7),
		(19, 2, 6),
		(24, 2, 4),
		(25, 2, 2),
		(33, 2, 6),
		(37, 2, 8),
		(38, 2, 5),
		(3, 3, 3), --south branch
		(4, 3, 5),
		(5, 3, 4),
		(6, 3, 6),
		(7, 3, 2),
		(8, 3, 4),
		(9, 3, 4),
		(30, 3, 8),
		(31, 3, 6),
		(32, 3, 13),
		(33, 3, 4),
		(1, 4, 8), --west branch
		(2, 4, 6),
		(21, 4, 2),
		(22, 4, 10),
		(23, 4, 3),
		(33, 4, 5),
		(37, 4, 4),
		(38, 4, 9),
		(39, 4, 8),
		(40, 4, 5),
		(41, 4, 2)
	;
	SELECT * FROM tbl_book_copies;

	DELETE FROM tbl_borrower
	DBCC CHECKIDENT (tbl_borrower, RESEED, 0);
INSERT INTO tbl_borrower
		(name, address, phone)
		VALUES 
		('Aron Alexander', '427 ne lake st', '555-687-3574'),
		('Janiece Scotto', '123 e 14th st', '555-687-9635'),
		('Loris Iliff', '35 s main st', '555-687-3589'),
		('Lanny Warf', '86 sw lewis ave', '555-687-9963'),
		('Sherril Marcinek', '555 n ocean ave', '555-687-4452'),
		('Janita Knotts', '689 e 1st st', '555-687-4547'),
		('Pasty Schildgen', '543 s 58th ave', '555-687-8524'),
		('Buddy Villalta', '314 s 14 pl', '555-687-4963'),
		('Leila Moody', '14 s main st', '555-687-3589'),
		('Fransisca Ginther', '335 w clark st', '555-687-7578'),
		('This Guy', '545 w n 5th st', '555-687-4653')
	;
	SELECT * FROM tbl_borrower;
	SELECT * FROM tbl_book_loans;


	DELETE FROM tbl_book_loans
INSERT INTO tbl_book_loans
		(book_id, branch_id, card_no)
		VALUES 
		(1, 1, 1),  -- Person 1
		(5, 1, 1),
		(6, 1, 1),
		(8, 1, 1),
		(20, 1, 1),
		(21, 1, 1),
		(22, 1, 1),
		(23, 1, 1),
		(24, 1, 1),
		(25, 1, 1),
		(26, 1, 1),
		(27, 1, 1),
		(28, 1, 1),

		(20, 1, 2),  -- Person 2
		(30, 1, 2),
		(31, 1, 2),
		(33, 1, 2),
		(36, 1, 2),
		(37, 1, 2),
		(38, 1, 2),

		(8, 2, 3),  -- Person 3
		(14, 2, 3),
		(29, 2, 3),
		(35, 2, 3),
		(36, 2, 3),
		(37, 2, 3),

		(19, 2, 4),  -- Person 4
		(11, 2, 4),

		(9, 2, 5),  -- Person 5
		(6, 2, 5),
		(38, 2, 5),
		(39, 2, 5),
		(40, 2, 5),
		(41, 2, 5),
		(5, 2, 5),
		(1, 2, 5),

		(6, 3, 6),  -- Person 6
		(20, 3, 6),
		(3, 3, 6),

		(27, 3, 7),  -- Person 7
		(23, 3, 7),
		(25, 3, 7),
		(16, 3, 7),

		(2, 4, 8),  -- Person 8
		(1, 4, 8),

		(35, 4, 9),  -- Person 9
		(34, 4, 9),
		(33, 4, 9),
		(37, 4, 9),
		(38, 4, 9),

		(20, 4, 10)  -- Person 10

	;
	SELECT * FROM tbl_book_loans;