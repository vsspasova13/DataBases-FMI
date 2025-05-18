USE movies

--1
INSERT INTO MOVIESTAR(NAME, BIRTHDATE)
VALUES ('Nicole Kidman', '1967-06-20')

--2
DELETE FROM MOVIEEXEC 
WHERE NETWORTH < 30000000

--3
DELETE FROM MOVIESTAR
WHERE ADDRESS IS NULL

----
use pc

--4
INSERT INTO product
VALUES ('C', '1100', 'pc')

INSERT INTO PC
VALUES (12, '1100', 2400, 2048, 500, '52x', 299)

--5
DELETE FROM pc
WHERE model LIKE '1100'

--6
DELETE FROM laptop 
WHERE model IN
( SELECT p.model
  FROM product p
  where p.type NOT LIKE 'printer')

--7
UPDATE product
SET maker = 'A'
WHERE maker = 'B'

--8
UPDATE pc
SET price = price/2,
    hd = hd+20

--9
UPDATE laptop
SET screen = screen + 1
WHERE model IN
	(SELECT model
	 FROM product
	 WHERE maker LIKE 'B')

use ships
--10

INSERT INTO CLASSES
VALUES ('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000)

INSERT INTO SHIPS
VALUES ('Nelson', 'Nelson', 1927),
	   ('Rodney', 'Nelson', 1927)

--11
DELETE FROM SHIPS
WHERE NAME IN
(SELECT name
 FROM OUTCOMES
 WHERE RESULT='sunk')

 --12
 UPDATE CLASSES
 SET BORE=BORE*2.5,
	 DISPLACEMENT=DISPLACEMENT*1.1