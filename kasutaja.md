

<img width="945" height="672" alt="image" src="https://github.com/user-attachments/assets/049a1fe1-1c7b-4085-b25a-f5ca34300eb1" />

```SQL 
SELECT * FROM loomad;
--õiguste määramine
--GRANT -kasutaja õiguste lubamine- разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет

GRANT SELECT ON loomad TO DirektorNV;
GRANT INSERT ON loomad TO DirektorNV;
GRANT SELECT, INSERT ON loomad TO DirektorNV;
```DENY DELETE ON loomad TO DirektorNV;
