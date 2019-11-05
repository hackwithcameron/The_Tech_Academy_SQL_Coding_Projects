USE [Library]

--Drill 1
SELECT a1.branch_name AS 'Branch:', a2.title AS 'Book title:', a3.number_of_copies AS 'Number of Copies:'
FROM tbl_book_copies a3
INNER JOIN tbl_library_branch a1 ON a3.branch_id=a1.branch_id
INNER JOIN tbl_books a2 ON a3.book_id=a2.book_id
WHERE a1.branch_name = 'Sharpstown'
AND a2.title = 'The Lost Tribe'

--Drill 2
SELECT a1.branch_name AS 'Branch:', a2.title AS 'Book title:', a3.number_of_copies AS 'Number of Copies:'
FROM tbl_book_copies a3
INNER JOIN tbl_library_branch a1 ON a3.branch_id=a1.branch_id
INNER JOIN tbl_books a2 ON a3.book_id=a2.book_id
WHERE  a2.title = 'The Lost Tribe'

--Drill 3 Nothing shows because everyone has something checked out
SELECT a1.name AS 'Name:', a1.address AS 'Address:', a1.phone AS 'Phone:'
FROM tbl_book_loans a2
RIGHT JOIN tbl_borrower a1 ON  a2.card_no=a1.card_no
WHERE a2.date_out = NULL

--Drill 4 Again Nothing Shows because the due dates are set a week from when they get put in automatically which is not todays date
SELECT a2.title AS 'Book Title:', a3.branch_name AS 'Branch', a1.date_due AS 'Date Due:'
FROM tbl_book_loans a1
INNER JOIN tbl_books a2 ON a1.book_id=a2.book_id
INNER JOIN tbl_library_branch a3 ON a1.branch_id=a3.branch_id
WHERE a3.branch_name = 'Sharpstown'
AND a1.date_due = GETDATE()


--Drill 5

--Branch 1
SELECT a2.branch_name AS 'Branch:', a3.title AS 'Book on Loan:'
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a1.branch_id=a2.branch_id
INNER JOIN tbl_books a3 ON a1.book_id=a3.book_id
WHERE a2.branch_name = 'Sharpstown'

SELECT COUNT(1) AS 'Total Books on Loan at Sharpstown:' 
FROM tbl_book_loans a1
WHERE a1.branch_id=1

--Branch 2
SELECT a2.branch_name AS 'Branch:', a3.title AS 'Book on Loan:'
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a1.branch_id=a2.branch_id
INNER JOIN tbl_books a3 ON a1.book_id=a3.book_id
WHERE a2.branch_name = 'Central'

SELECT COUNT(1) AS 'Total Books on Loan at Central:' 
FROM tbl_book_loans a1
WHERE a1.branch_id=2

-- Branch 3
SELECT a2.branch_name AS 'Branch:', a3.title AS 'Book on Loan:'
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a1.branch_id=a2.branch_id
INNER JOIN tbl_books a3 ON a1.book_id=a3.book_id
WHERE a2.branch_name = 'south branch'

SELECT COUNT(1) AS 'Total Books on Loan at South Branch:' 
FROM tbl_book_loans a1
WHERE a1.branch_id=3

-- Branch 4
SELECT a2.branch_name AS 'Branch:', a3.title AS 'Book on Loan:'
FROM tbl_book_loans a1
INNER JOIN tbl_library_branch a2 ON a1.branch_id=a2.branch_id
INNER JOIN tbl_books a3 ON a1.book_id=a3.book_id
WHERE a2.branch_name = 'west branch'

SELECT COUNT(1) AS 'Total Books on Loan at West Branch:' 
FROM tbl_book_loans a1
WHERE a1.branch_id=4

-- Drill 6


SELECT a2.name AS 'Phone:', a2.address AS 'Address', a2.phone AS 'Phone:', COUNT(a1.card_no) AS 'Books out:'
FROM tbl_book_loans a1
INNER JOIN tbl_borrower a2 ON a1.card_no=a2.card_no
WHERE a1.card_no=1 OR a1.card_no=2 OR a1.card_no=3 OR a1.card_no=4 OR a1.card_no=5 OR a1.card_no=6 OR a1.card_no=7 OR a1.card_no=8 OR a1.card_no=9 OR a1.card_no=10
GROUP BY a2.name, a2.phone, a2.address
HAVING COUNT(a1.card_no) > 4



SELECT * FROM tbl_book_loans

-- Drill 7
SELECT a3.branch_name AS 'Branch:', a4.title AS 'Book Title:', a2.author_name AS 'Author:', a1.number_of_copies
FROM tbl_book_copies a1
INNER JOIN tbl_library_branch a3 ON a1.branch_id=a3.branch_id
INNER JOIN tbl_book_auhors a2 ON a1.book_id=a2.book_id
INNER JOIN tbl_books a4 ON a1.book_id=a4.book_id
WHERE a3.branch_name = 'Central'
AND a2.author_name = 'Stephen King'


