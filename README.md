# AndmebaasidTITpv24
Andmebaasidega seotud SQL kood ja konspektid

## Sisukord
-[Põhimõisted](#põhimõisted)
-[Andmetüübid](#andmetüübid)
-[SQL - structure Query Language - struktureeritud päringu keel](#SQL-structureQueryLanguage-struktureeritudpäringukeel)
-[PIRANGUD](#pirangud)
-[ALTER TABLE](#ALTER TABLE)
## Põhimõisted
- andmebaas - struktureeritud andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *столбец
- rida = kirje - записи
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER managment Studio
- primaarne võti - PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identefikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY -FK- veerg, mis loob seos teise tabeli primaarvõtmega.
- päring -QUERY -запрос
-

## Andmetüübid
```
1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümboolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false, bit, bool
4. Kuupäevad: date, time, datetime
```
## SQL - structure Query Language - struktureeritud päringu keel
<img width="1916" height="1000" alt="{A631E4D7-7889-42F2-9B56-8A681837CD0B}" src="https://github.com/user-attachments/assets/c71aef4f-6f4a-426c-bd44-db09b00be04a" />
- Tabeli loomine

```
CREATE DATABASE Voronin_baas;

--ab kustutamine
DROP DATABASE EvgeniFunkt;

use Voronin_baas
--tabeli loomine
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1),--automaataelt täidab numbritega,
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) ); --(2--kokku, 1- peale komat)

SELECT * FROM opilane;
```
<img width="626" height="574" alt="{3808D543-0B8B-4CD6-9D66-E5B5D4302C23}" src="https://github.com/user-attachments/assets/446a02ff-c84b-4db6-bb5a-32ddd815a384" />

- Andmete sisestamine tabelisse
```
CREATE DATABASE Voronin_baas;

--ab kustutamine
DROP DATABASE EvgeniFunkt;

use Voronin_baas
--tabeli loomine
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1),--automaataelt täidab numbritega,
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) ); --(2--kokku, 1- peale komat)

SELECT * FROM opilane;

--tabeli täitmine
INSERT INTO opilane
VALUES ('Nikita','Voronin','2000-11-2',1,'+325689','Tallinn', 4.5);

INSERT INTO opilane(perenimi, eesnimi, keskmineHinne),
VALUES ('N','V1', 4.2),
('N','V2', 4.2),
('N','V3', 5.0);
```

Seosed (tabelivahelised seosed)
- üks-ühele (nt mees-naine)

- mitu-mitmele (nt õpilased - õpetajad
- 
## PIRANGUD
constraint- ограничения(5)
1. PRIMARY KEY
2. FOREIGN KEY
3. CHECK
4. NOT NULL
5. UNIQUE

``` SQL
--FOREIGN KEY
CREATE TABLE oprtamine(
opetamineID int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneID int,
FOREIGN KEY (opilaneID) REFERENCES opilane(opilaneID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilane;
--täidame tabeli
INSERT INTO opetamine
VALUES( '2026-04-16','andmebaasid', 4, 5)
```
## ALTER TABLE
-tabeli strukturi muutminr (struktuur: veerudenimed, andmetüübid, piirangud)
1. uue veeru lisamine

2. 
```sql
DROP Database NVbaas;
CREATE DATABASE NVtitpv24;

USE NVtitpv24
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1),
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) );

SELECT * FROM opilane;

--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübi muutmine varchar(11)-->char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);
--sisseehitatud protseduur, mis näitab tabeli info
sp_help opilane;
```
```
DROP Database NVbaas;
CREATE DATABASE NVtitpv24;

USE NVtitpv24
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1),
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) );

SELECT * FROM opilane;

--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübi muutmine varchar(11)-->char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);
--sisseehitatud protseduur, mis näitab tabeli info
sp_help opilane;

--piirangute lisamine
CREATE TABLE ryhm(
ryhmId int not null,
ryhmNimi char(10));
drop table ryhm;

sp_help ryhm;

--PK lisamine
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);
--UNIQUE lisamine
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontrollimiseks täidame tabelit ryhm
SELECT * FROM ryhm;
INSERT INTO ryhm (ryhmId, ryhmNimi)
VALUES(1,'TITpv24');

--lisame Foreign Key - võõrvõti-välisvõti
ALTER TABLE opilane ADD ryhmId int;
SELECT * FROM opilane;
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmId) REFERENCES ryhm(ryhmId);

--kontrollimiseks- täidame tabeli opilane
INSERT INTO opilane
VALUES ('Egor','Artjomov','2002-12-10', 'laanemere','ei_õpi','5667777',21);
```
<img width="1107" height="782" alt="{5132355A-D393-4E2E-B767-08F124FF1090}" src="https://github.com/user-attachments/assets/24e85f29-4874-4049-980f-e22b6c186ce9" />


<img width="1562" height="635" alt="{2D7DFCDA-9A79-43A0-9C65-D18AA53167DD}" src="https://github.com/user-attachments/assets/3812afee-ac9c-423d-9341-c941d9507999" />



