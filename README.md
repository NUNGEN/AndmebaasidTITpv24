# AndmebaasidTITpv24
Andmebaasidega seotud SQL kood ja konspektid
## Põhimõisted
- andmebaas - struktureeritud andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *столбец
- rida = kirje - записи
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER managment Studio
- primaarne võti - PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identefikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY -FK- veerg, mis loob seos teise tabeli primaarvõtmega.
- päring -QUERY -запрос

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



