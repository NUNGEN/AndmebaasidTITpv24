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


