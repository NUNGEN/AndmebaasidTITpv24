CREATE DATABASE Opetaja;

use Voronin_baas
--tabeli loomine
CREATE TABLE opetaja(
opetajaID int Primary Key (1),
nimi varchar(25),
epost TEXT,
ruum varchar(25) );

SELECT * FROM opetaja;
-- lisame nimi, epost ja ruum tabelisse
INSERT INTO opetaja,
VALUES ('1','Markus','markus@.com';

INSERT INTO opetaja(opetajaID, nimi, epost, ruum)
VALUES ('19374','MoriartiMorio','Morio@gmail.com'),
('09384','JohannesJaanes','Jaanes@gmail.com'),
('56012','KuldnarKuuli','Kuuli@gmail.com' );


UPDATE opetaja SET strip=1, aadress='Tallinn';

UPDATE opetaja SET strip=1, aadress='Tallinn' WHERE opetajaID=5;

SELECT * FROM opetaja;
