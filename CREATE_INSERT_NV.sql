CREATE DATABASE Opetaja;

USE Opetaja;

CREATE TABLE opetaja (
    opetajaID INT PRIMARY KEY,
    nimi VARCHAR(25),
    epost TEXT,
    ruum VARCHAR(25)
);

SELECT * FROM opetaja;

INSERT INTO opetaja (opetajaID, nimi, epost, ruum)
VALUES (1, 'Markus', 'markus@.com', '101');

INSERT INTO opetaja (opetajaID, nimi, epost, ruum)
VALUES 
(19374, 'MoriartiMorio', 'Morio@gmail.com', '33'),
(9384, 'JohannesJaanes', 'Jaanes@gmail.com', '33'),
(56012, 'KuldnarKuuli', 'Kuuli@gmail.com', '33');

ALTER TABLE opetaja
ADD strip INT,
ADD aadress VARCHAR(50);

UPDATE opetaja 
SET strip = 1, aadress = 'Tallinn';

UPDATE opetaja 
SET strip = 1, aadress = 'Tallinn' 
WHERE opetajaID = 5;

SELECT * FROM opetaja;
