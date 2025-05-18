
--1
CREATE DATABASE mypc
USE mypc

CREATE TABLE Product(
	maker CHAR(1),
	model CHAR(4),
	type VARCHAR(7))

CREATE TABLE Printer(
    code INT,
	model CHAR(4),
	price DECIMAL(10,2))

INSERT INTO Product (maker, model, type) 
VALUES
('A', 'P123', 'Printer'),
('B', 'P456', 'Printer'),
('C', 'P789', 'Printer');

INSERT INTO Printer (code, model, price) VALUES
(1, 'P123', 199.99),
(2, 'P456', 149.50),
(3, 'P789', 89.90);

ALTER TABLE Printer 
ADD type VARCHAR(6) CHECK (type IN ('laser', 'matrix','jet'))

ALTER TABLE Printer
ADD color CHAR(1) CHECK (color IN ('y','n'))

ALTER TABLE Printer
DROP COLUMN price

DROP TABLE Printer
DROP TABLE Product

--2
CREATE DATABASE Facebook
USE Facebook

CREATE TABLE Users(
	id INT,
	email VARCHAR(15),
	password VARCHAR(20),
	regdate DATE)

CREATE TABLE Friends(
	user1 INT,
	user2 INT,
	CHECK(user1 <> user2))

CREATE TABLE Walls(
	userId INT,
	usermesId INT,
	text VARCHAR(1000),
	date DATE)

CREATE TABLE Groups(
	id INT,
	name VARCHAR(30),
	description VARCHAR(100) DEFAULT '')

CREATE TABLE GroupMembers(
	id INT,
	username VARCHAR(30))


INSERT INTO Users (id, email, password, regdate) VALUES
(12, 'ali@example.com', 'pass123', '2023-05-01'),
(21, 'bob@example.com', 'qwerty', '2023-05-02'),
(25, 'cie@example.com', 'letmein', '2023-05-03'),
(40, 'dna@example.com', 'abc123', '2023-05-04'),
(55, 'eve@example.com', 'evepass', '2023-05-05');

INSERT INTO Friends (user1, user2) VALUES
(12, 21),
(12, 25),
(12, 40),
(21, 25),
(25, 40);

INSERT INTO Walls (userid, usermesId, text, date) VALUES
(12, 21, 'Hey Alice! Long time no see!', '2024-01-10'),
(12, 25, 'Happy birthday, Alice!', '2024-05-01'),
(21, 12, 'Thanks for the gift!', '2024-05-02'),
(40, 25, 'Congrats on your promotion!', '2024-06-20'),
(25, 12, 'Wanna grab coffee tomorrow?', '2024-06-21');

INSERT INTO Groups (id, name, description) VALUES
(1, 'Gamers Unite', 'For fans of gaming'),
(2, 'Study Buddies', 'Math, coding and chill'),
(3, 'Travelers', ''); 

INSERT INTO GroupMembers (id, username) VALUES
(1, 12),
(1, 21),
(1, 25),
(2, 12),
(2, 40),
(3, 25),
(3, 55);
