## Protseduurid
- store protcedure - salvestatud -хранимые процедуры
- sama nagu funktsioonid programmeerimises - mingid tegevused mis käivitakse automaatselt protseduuri kasutamisel.

  ```sql
  CREATE DATABASE protseduurVoronin;

Use	protseduurVoronin;

CREATE TABLE guest(
guestID int Primary Key identity(1,1),
first_name varchar(80),
last_name varchar(80) Not Null,
member_since DATE);

SELECT * FROM guest;

INSERT INTO guest (first_name, last_name, member_since)
VALUES 
('ivan', 'sereda', '2024-11-10'),
('ivan', 'guy', '2025-04-26'),
('ivan', 'drago', '2026-07-27');
CREATE PROCEDURE lisaGuest
@uusNimi varchar(80),
@uusPerenimi varchar(80),
@kuupaev DATE
AS
BEGIN
    INSERT INTO guest
    VALUES (@uusNimi, @uusPerenimi, @kuupaev);
    
    SELECT * FROM guest;
END;
  
  ```

<img width="307" height="429" alt="{60362247-69A8-44ED-AB36-7CA7B77844BE}" src="https://github.com/user-attachments/assets/44eef2aa-2313-4477-ac6d-a67b978ef3ea" />
<img width="440" height="276" alt="{16386151-05A8-4139-B055-8AADFDCC1184}" src="https://github.com/user-attachments/assets/63065972-cf4b-48a8-9bf6-c113a46fce3e" />
```
CREATE PROCEDURE kustutaGuest
@kustutaId int
AS
BEGIN
	SELECT * FROM guest;
	DELETE FROM guest WHERE guestID=@kustutaId;
	SELECT * FROM guest;
END

--kutse
EXEC kustutaGuest 1;
```

<img width="474" height="713" alt="{D07788D7-5DCC-4D88-B290-235EBC43AD11}" src="https://github.com/user-attachments/assets/d055c3bf-46dc-42ab-82c8-c6d610ff6809" />

<img width="836" height="440" alt="{9A6D54F9-CF47-44ED-9D6A-05383AFF34B7}" src="https://github.com/user-attachments/assets/e0b9b3d8-6b50-4eff-832c-f9ee332d8e3a" />

<img width="464" height="420" alt="{7AE138EC-C8BA-4441-BE1B-2746CCA49D11}" src="https://github.com/user-attachments/assets/ac7d085e-2af3-49dc-a3e3-c3e1d893a432" />

- Muudatused
```
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;
-- kutse
EXEC muudatus 'add','guest','testVeerg1',int
Select * from guest
EXEC muudatus 'drop','guest','testVeerg1'
```

<img width="461" height="270" alt="{F040D45C-F5EA-447F-AA42-259284A00020}" src="https://github.com/user-attachments/assets/96817015-ff81-42e3-967c-848a7d64f156" />

<img width="469" height="413" alt="{A61A7C97-4FF7-4A40-80A8-E65F705D7BC4}" src="https://github.com/user-attachments/assets/d2883845-0a91-4fc6-935f-9920e43b3347" />

<img width="431" height="282" alt="{5A73AA66-2703-4B5D-968F-12447A6B2930}" src="https://github.com/user-attachments/assets/c0631ae3-c99b-408f-bcc7-4e821f8c61da" />

<img width="586" height="562" alt="{E02C9832-AF3A-4BC1-A356-B646C7CECE8D}" src="https://github.com/user-attachments/assets/c0bd9467-fff3-4b9c-a99a-601c3879e398" />






## Protseduurid
- stored procedure - salvestatud protseduur (хранимые процедуры)
- sama nagu funktssioonid programmeerimises - mingid tegevused mis käivitakse automaatselt protseduuri kasutamisel.

### 1. Baasi ja tabeli loomine

```sql
CREATE DATABASE protseduurVoronin;

USE protseduurVoronin;

CREATE TABLE guest(
    guestID int Primary Key identity(1,1),
    first_name varchar(80),
    last_name varchar(80) Not Null,
    member_since DATE
);

SELECT * FROM guest;

INSERT INTO guest (first_name, last_name, member_since)
VALUES 
    ('ivan', 'sereda', '2024-11-10'),
    ('ivan', 'guy', '2025-04-26'),
    ('ivan', 'drago', '2026-07-27');

2. LisaGuest protseduur
sql

CREATE PROCEDURE lisaGuest
    @uusNimi varchar(80),
    @uusPerenimi varchar(80),
    @kuupaev DATE
AS
BEGIN
    INSERT INTO guest
    VALUES (@uusNimi, @uusPerenimi, @kuupaev);
    
    SELECT * FROM guest;
END;

Tulemus:
https://github.com/user-attachments/assets/44eef2aa-2313-4477-ac6d-a67b978ef3ea

https://github.com/user-attachments/assets/63065972-cf4b-48a8-9bf6-c113a46fce3e
3. KustutaGuest protseduur
sql

CREATE PROCEDURE kustutaGuest
    @kustutaId int
AS
BEGIN
    SELECT * FROM guest;
    DELETE FROM guest WHERE guestID = @kustutaId;
    SELECT * FROM guest;
END;

-- Kutse
EXEC kustutaGuest 1;

Tulemus:
https://github.com/user-attachments/assets/d055c3bf-46dc-42ab-82c8-c6d610ff6809

https://github.com/user-attachments/assets/e0b9b3d8-6b50-4eff-832c-f9ee332d8e3a

https://github.com/user-attachments/assets/ac7d085e-2af3-49dc-a3e3-c3e1d893a432
4. Muudatus protseduur (DDL tegevused)
sql

CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)
        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

-- Kutse add
EXEC muudatus 'add', 'guest', 'testVeerg1', 'int';

-- Kontroll
SELECT * FROM guest;

-- Kutse drop
EXEC muudatus 'drop', 'guest', 'testVeerg1';

Tulemus:
https://github.com/user-attachments/assets/96817015-ff81-42e3-967c-848a7d64f156

https://github.com/user-attachments/assets/d2883845-0a91-4fc6-935f-9920e43b3347

https://github.com/user-attachments/assets/c0631ae3-c99b-408f-bcc7-4e821f8c61da

https://github.com/user-attachments/assets/c0bd9467-fff3-4b9c-a99a-601c3879e398

