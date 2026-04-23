## Andmetebaasid
andmetebaasidega seotud SQL kood ja konspektid

## Sisukord
- [Põhimõisted](#põhimõisted)
- [Andmetüübid](#andmetüübid)



## Põhimõisted 
- andmebaas - struktureeritud admete kogum
- tabel = olem  - сущность -enitity
- veerg = väli - поле *столбец
- rida = kirje - записи
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER management Studio.
- primaarne võti -PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne idenfikaator, mis eristab iga kirje.
- valisvõti - FOREIGN KEY -FK- veerg,mis loob seos teise tabeli primaarvõtmega.
- päring - QUERY - запрос
  <img width="476" height="514" alt="{663D7B25-FCE4-4F63-8344-04C3BC7776E4}" src="https://github.com/user-attachments/assets/c4395a9e-590d-4a09-9510-6507efb70fff" />


   ## Andmetüübid
  ```
  1. Numbrilised: INT, SmallINT, float, decimal(5,2)
  2. Tekst/süboolised: varchar(255), char(5), TEXT
  3. Loogiliselt: boolean, true/false, bit, bool
  4. Kuupäeva: date, time , datetime
  ```
  ## SQL - structure Query Language - struktureeritud päringu keel
  - Tabeli loomine

     ```sql
      CREATE TABLE opilane(
opilaneId int Primary Key identity(1,1),--automaatselt täidab numbritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) );--(2--kokku, 1- peale komat nt 4.5)

     SELECT * FROM opilane;
     ```
  -  Andmete sisestamine tabelisse
   ```
    INSERT INTO opilane
VALUES ('Alina','Syrbu', '2005-12-15',0,'+84945','Tallinn', 4.2)
INSERT INTO opilane(perenimi, eesnimi, keskmineHinne)
VALUES ('Ivanenko', 'Karina', 4.0),
('Melesenya', 'Ilja', 3.7),
('Laid', 'Emilia', 4.4);
    ```
## Seosed (Tabelivahelised seosed)
-üks -ühile (nt mees-naine)
- üks- mitmeline (nt ema-lapsed)<img width="575" height="242" alt="{EC5AD3C4-1939-43BB-98E6-9CE12AD70D1A}" src="https://github.com/user-attachments/assets/165dd3bd-b08d-4e78-8094-8c6ae5158a4c" />
- mitu - mitmele (nt õpilase - õpetajad)

## PIIRANGUD
constraint - ограничения (5)
1. PRIMARY KEY
2. FOREIGN KEY
3. CHECK
4. NOT NULL
5. UNIQUE

```sql
--FOREIGN KEY
CREATE TABLE opetamine(
opetamineID int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneId int,
FOREIGN KEY (opilaneId) REFERENCES opilane(opilaneId),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * fROM opilane;
--täitmine tabeli
INSERT INTO opetamine
VALUES ('2016-04-16', 'andmebaasid', 3,4)
```
<img width="302" height="304" alt="{A23FF357-D2F9-4AF2-AF2B-CA4B37D885F6}" src="https://github.com/user-attachments/assets/bfcf9f32-c388-45a0-a4ed-f66dbbb49e16" />









## ALTER TABLE
-tabeli struktuuri muutmine (struktuur: veerudenimed, andmetüübid, piirangud)
```sql
--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine 
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübi muutmine(11) --> char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);
--sisseehitatud protseduur, mis näitab tabeli struktuur
sp_help opilane;


```


```sql
--PK lisamine
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);
--UNIQUE lisamine
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontrollimiseks täidame tabeli ryhm
SELECT * FROM ryhm;
INSERT INTO ryhm (ryhmId, ryhmNimi)
VALUES (2, 'TITpe24');

--lisame Foreign Key -võõrbõti -valisvõti
ALTER TABLE opilane ADD ryhmId int;
SELECT * from opilane;
SELECT * FROM ryhm;
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm 
FOREIGN KEY (ryhmId) REFERENCES ryhm(ryhmId);

--kontrollimiseks - täidame tabeli opilane
 INSERT INTO opilane
VALUES ('Alina','Syrbu', '2005-12-15',0,'+84945','Tallinn', 4.2, '568448',2),
('Ivanenko', 'Karina','2002-10-7',0,'+8166186','Tartu', 4.0,'4248956',1);
```



