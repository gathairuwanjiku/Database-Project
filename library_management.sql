-- Create the database
CREATE DATABASE library_db;

USE library_db;

-- Create Author table
CREATE TABLE Author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Create Book table
CREATE TABLE Book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    published_year INT
);

-- Create Book_Author table (Many-to-Many)
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Create Member table
CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Loan table
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

-- Insert sample authors
INSERT INTO Author (name) VALUES 
('J.K. Rowling'), 
('George Orwell');

-- Insert sample books
INSERT INTO Book (title, isbn, published_year) VALUES 
('Harry Potter and the Philosopher''s Stone', '9780747532699', 1997),
('1984', '9780451524935', 1949);

-- Link books and authors
INSERT INTO Book_Author (book_id, author_id) VALUES 
(1, 1),  -- Harry Potter by J.K. Rowling
(2, 2);  -- 1984 by George Orwell

-- Insert members
INSERT INTO Member (name, email) VALUES 
('Gathairu Fidelis', 'gathairuwanjiku@gmail.com'),
('Kelvin Rua', 'kelvinrua@gmail.com');

-- Insert sample loans
INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES 
(1, 1, '2025-05-01', NULL);

