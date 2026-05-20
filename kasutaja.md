## SQL Server – Kasutajate autentimine ja õiguste haldamine
## Mis on autentimine SQL Serveris?
### Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

SQL Serveris kasutatakse kahte peamist autentimise tüüpi:

## 1. Windows Authentication
Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

Kasutajanimi ja parool on seotud Windowsiga
Turvalisem lahendus
Paroole haldab Windows
Kasutaja ei pea eraldi SQL Serveri parooli teadma
## 2. SQL Server Authentication
Selle puhul luuakse kasutaja otse SQL Serverisse.

Kasutaja ei ole seotud Windowsiga
Määratakse eraldi kasutajanimi ja parool
Sobib veebirakenduste jaoks


<img width="700" height="662" alt="{9B67D347-4290-4891-B45F-CAEDD363D0B5}" src="https://github.com/user-attachments/assets/2c4d5d71-9174-4d5d-81cc-48bb003fdc4f" />


<img width="710" height="654" alt="{04C8D59D-D7F0-4324-A66E-8A94AC9D7D1E}" src="https://github.com/user-attachments/assets/e7ef3b7f-064d-47ce-8912-2d0276f52b27" />


<img width="230" height="412" alt="{ADA7A0F0-2D50-4422-AAA2-3C826FECDD61}" src="https://github.com/user-attachments/assets/67d56b64-ceb7-4d65-8994-bdc10521b388" />

```sql

---õiguste määramine
--GRANT -kasutaja õiguste lubamine - разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет

GRANT SELECT ON loomad TO directorKarolina;
GRANT INSERt ON loomad TO directorKarolina;


DENY DELETE ON loomad TO directorKarolina;
```
