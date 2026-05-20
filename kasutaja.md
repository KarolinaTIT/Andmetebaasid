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
