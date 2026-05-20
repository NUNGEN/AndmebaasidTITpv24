

<img width="945" height="672" alt="image" src="https://github.com/user-attachments/assets/049a1fe1-1c7b-4085-b25a-f5ca34300eb1" />

```CREATE DATABASE kasutajaTITpv24;
USE kasutajaTITpv24;

CREATE TABLE loomad(
loomId int Primary Key identity (1,1),
loomNimi varchar(25) not null,
vanus int check(vanus>0),
chip bit)

INSERT INTO loomad(loomNimi, vanus, chip)
VALUES('rebane Miko', 4, 1);

SELECT * FROM loomad;
--õiguste määramine
--GRANT -kasutaja õiguste lubamine- разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет

GRANT SELECT ON loomad TO DirektorNV;
GRANT INSERT ON loomad TO DirektorNV;
GRANT SELECT, INSERT ON loomad TO DirektorNV;
GRANT UPDATE(vanus) ON loomad TO DirektorNV;
--saab uuendada ainult vanus!
DENY DELETE ON loomad TO DirektorNV;
```
<img width="559" height="578" alt="{FD32624D-051A-4425-9890-2FA973BDD64B}" src="https://github.com/user-attachments/assets/abccd5b2-c917-4a74-86a1-fe07ca431a26" />

operatsioon on keelatud sest direktoril pole piisavalt õigusi
<img width="717" height="579" alt="{DA9F5174-A821-48F8-8D52-749EA63328CD}" src="https://github.com/user-attachments/assets/1421b7c4-32c4-4b60-bd7d-6ed645613440" />

operatsioon on keelatud sest direktoril pole piisavalt õigusi 
<img width="491" height="584" alt="{4EACE41A-0627-47E2-A6A0-D2F5E99FA1DA}" src="https://github.com/user-attachments/assets/8799d22d-d790-47d8-be93-c8833fea4e81" />

<img width="533" height="654" alt="{A61D4A41-249E-4706-AA9D-862EE3334FF4}" src="https://github.com/user-attachments/assets/25b0347a-6736-45c8-b525-ec98949ced9b" />

```--oiguste kontroll
--direktorNV saab vaadata tabelisisu;
SELECT * FROM loomad

--direktorNV saab lisada andmeid tabelisse loomad
INSERT INTO loomad(loomNimi, vanus, chip)
VALUES('kala Pudelike', 1, 0);

--direktorIrina3 ei saa kustutada tabelist
DELETE FROM loomad Where loomId=1
-- ei saa tabeleid luua
CREATE TABLE test(id int);

--iga kasutaja ise saab kontrollida temale määratud õigused
SELECT * FROM fn_my_permissions('loomad','OBJECT')

--uuendame vanus kus on loomId=1
UPDATE loomad SET vanus=20 WHERE loomId=1;
```
