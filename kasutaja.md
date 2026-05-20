

<img width="945" height="672" alt="image" src="https://github.com/user-attachments/assets/049a1fe1-1c7b-4085-b25a-f5ca34300eb1" />

```SQL 
SELECT * FROM loomad;
--õiguste määramine
--GRANT -kasutaja õiguste lubamine- разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет

GRANT SELECT ON loomad TO DirektorNV;
GRANT INSERT ON loomad TO DirektorNV;
GRANT SELECT, INSERT ON loomad TO DirektorNV;
DENY DELETE ON loomad TO DirektorNV;
```
<img width="663" height="846" alt="{8A7229F3-B6D4-4473-A6D9-E2D3DFDD030F}" src="https://github.com/user-attachments/assets/cc3bf6b9-ab45-4bf3-a79c-1906e477dad0" />
