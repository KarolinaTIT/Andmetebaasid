## Andmetebaaside konspektid / Karolina


[Põhimõisted](README.md). [Protsedur](protsedur.md). [protsedur/XAMPP](protseduur/XAMPP.md). [Hotelliruum](Hotelliruum.md). [Hotelliruum/XAMPP](hotellstseblokina.sql) [Triger](triger.md)





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



<img width="706" height="801" alt="{6975E766-371D-4925-AAF2-4BEE8BB0588A}" src="https://github.com/user-attachments/assets/af930aed-312a-4e50-9b1b-677137bc7a88" />



<img width="470" height="511" alt="{5A97F919-EEC6-45CE-B3B0-8C721BEF6362}" src="https://github.com/user-attachments/assets/899d3548-a760-41c4-ba90-3a18946060e7" />


<img width="520" height="302" alt="{D05D5E6B-32F1-4C59-9C15-F2E73F6BE966}" src="https://github.com/user-attachments/assets/a03887af-1fc9-4c3a-a0f7-84545adb1212" />


<img width="581" height="614" alt="{B282E8E4-340A-4329-8D8C-5F86A4B7E2BA}" src="https://github.com/user-attachments/assets/a2889a04-9064-4252-be74-c850ab96568f" />


--direktorKarolina saab lisada andmeid  tabelisse loomad
INSERT INTO loomad(loomNimi,vanus,chip)
values ('papagoi Lort',15,3);

--direktorKarolina ei saa kustutada tabelistdelete from loomad where loomId=1
DELETE FROM loomad Where loomId=2
--ei saa tabeleid luua
CREATE TABLE test(id int);

--iga kasutaja ise saab kontrollida temale määratud õigused
SELECT * FROM fn_my_permissions('loomad', 'OBJECT')

--uuendame vanus kus loomId=1
UPDATE loomad SET chip=0 where loomId=1;

DROP TABLE movies;

Create database MovieBase1; 
use MovieBase1;

CREATE TABLE movies (
    moviesId INT PRIMARY KEY IDENTITY(1,1),
    moviesNimi VARCHAR(50),
    moviesYear VARCHAR(25) NOT NULL,
    movieDir VARCHAR(25) NOT NULL,
    movieCost MONEY
);

INSERT INTO movies (moviesNimi, moviesYear, movieDir, movieCost)
VALUES ('pirates of the caribbean', '2017', 'Gore Verbinski ', 1400000000);

SELECT * FROM movies;

CREATE TABLE guest (
    id INT PRIMARY KEY IDENTITY(1,1),
    guestname VARCHAR(50) NOT NULL,
);

INSERT INTO guest(guestname)
VALUES ('Karina');

SELECT * FROM guest;


---õiguste määramine
--GRANT -kasutaja õiguste lubamine - разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет

GRANT SELECT ON movies TO Produtsent1;
GRANT INSERt ON movies TO directorKarolina;
-- saab uuendada ainult vanus!
grant update(vanus) ON loomad to directorKarolina;

DENY DELETE ON loomad TO directorKarolina;

-- Право смотреть таблицу movies
GRANT SELECT ON movies TO Produtsent1;

-- Право обновлять только movieDir и movieCost
GRANT UPDATE (movieDir, movieCost)
ON movies
TO Produtsent1;

-- Дополнительная привилегия
GRANT INSERT ON movies TO Produtsent1;

GRANT SELECT, INSERT
ON guest
TO Produtsent1;

DENY DELETE ON movies TO Produtsent1;
DENY DELETE ON guest TO Produtsent1;

SELECT * FROM fn_my_permissions('movies', 'OBJECT')


CREATE DAtABASE kasutajaTITpv24;

USE kasutajaTITpv24;

create table loomad(
loomId int Primary key identity(1,1),
loomNimi varchar(25) not null,
vanus int check(vanus>0),
chip bit)

INSERT INTO loomad(loomNimi, vanus, chip)
values ('lõvi Kor', 3,0 );

select * from loomad;

---õiguste määramine
--GRANT -kasutaja õiguste lubamine - разрешение прав пользователя
--DENY -kasutaja õiguste keelamine - запрет

GRANT SELECT ON loomad TO directorKarolina;
GRANT INSERt ON loomad TO directorKarolina;
-- saab uuendada ainult vanus!
grant update(vanus) ON loomad to directorKarolina;

DENY DELETE ON loomad TO directorKarolina;



CREATE TABLE movies (
    moviesId INT PRIMARY KEY IDENTITY(1,1),
    moviesNimi VARCHAR(50),
    moviesYear VARCHAR(25) NOT NULL,
    movieDir VARCHAR(25) NOT NULL,
    movieCost MONEY
);

INSERT INTO movies (moviesNimi, moviesYear, movieDir, movieCost)
VALUES ('Avatar', '2009', 'James Cameron', 237000000);

SELECT * FROM movies;
