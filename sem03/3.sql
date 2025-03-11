USE movies
--1


--1
SELECT NAME
FROM MOVIESTAR S
WHERE S.NAME IN (SELECT NAME
				 FROM MOVIEEXEC
				 WHERE NETWORTH > 10000000)
--2
SELECT NAME
FROM MOVIESTAR M
WHERE M.NAME NOT IN (SELECT NAME
					FROM MOVIEEXEC)

--3
SELECT M.TITLE
FROM MOVIE M
WHERE M.LENGTH > (SELECT LENGTH
				  FROM MOVIE m
				  WHERE m.TITLE = 'Star Wars') 

--4
SELECT M.TITLE, E.NAME
FROM MOVIE M
JOIN MOVIEEXEC E ON M.PRODUCERC# = E.CERT#
WHERE E.NETWORTH > (SELECT NETWORTH
					FROM MOVIEEXEC 
					WHERE NAME = 'Merv Griffin')

--2
use pc

--1
SELECT  P.maker
FROM product P
WHERE p.model IN (SELECT C.model
				  FROM pc C
				  WHERE C.speed > 500)

--2
SELECT P.code, P.model, P.price
FROM printer P
WHERE P.price = (SELECT MAX(R.price)
				FROM printer R)

--3
SELECT *
FROM laptop L
WHERE L.speed < (SELECT MIN(P.speed)
				FROM pc P)

--4
SELECT a.price, a.model
FROM 
(
SELECT R.price, R.model FROM printer R
UNION ALL
SELECT L.price, L.model FROM laptop L
UNION ALL
SELECT P.price, P.model FROM pc P
) as a
WHERE a.price = (
    SELECT MAX(price) FROM (
        SELECT MAX(price) AS price FROM printer
        UNION ALL
        SELECT MAX(price) AS price FROM laptop
        UNION ALL
        SELECT MAX(price) AS price FROM pc
    ) AS max_prices
);


--5--??
SELECT P.maker
FROM product P
WHERE P.model IN (SELECT R.MODEL
				  FROM printer R
				  WHERE R.price = (SELECT MIN(PR.PRICE)
								   FROM printer PR
								   WHERE PR.color = 'y'))

--6
SELECT DISTINCT PR.maker
FROM product PR
WHERE PR.model IN (SELECT P.model
				   FROM pc P
				   WHERE P.speed = (SELECT MAX(D.speed)
								     FROM pc D
								     WHERE D.ram = (SELECT MIN(C.ram)
								                    from pc C)))

---
USE ships

--1
SELECT DISTINCT C.COUNTRY
FROM CLASSES C
WHERE C.NUMGUNS = (SELECT MAX(NUMGUNS)
				   FROM CLASSES)

--2
SELECT DISTINCT S.CLASS
FROM SHIPS S
WHERE S.NAME IN (SELECT O.SHIP
				 FROM OUTCOMES O
				 WHERE O.RESULT = 'sunk')

--3
SELECT S.NAME, S.CLASS
FROM SHIPS S
WHERE S.CLASS IN (SELECT C.CLASS
				  FROM CLASSES C
				  WHERE C.BORE =16)

--4
SELECT B.NAME
FROM BATTLES B
WHERE B.NAME IN (SELECT O.BATTLE
				 FROM OUTCOMES O
				 WHERE O.SHIP IN (SELECT S.NAME
								  FROM SHIPS S
								  WHERE S.CLASS = 'Kongo'))


--5--??
SELECT DISTINCT S.CLASS, S.NAME
FROM SHIPS S
WHERE S.CLASS IN (SELECT C.CLASS
				  FROM CLASSES C
				  JOIN CLASSES CL ON C.NUMGUNS >= CL.NUMGUNS AND C.BORE = CL.BORE)