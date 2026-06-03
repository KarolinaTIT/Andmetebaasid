## Andmetebaaside konspektid / Karolina


[[Põhimõisted](README.md)] [[Protsedur](protsedur.md)] [[protsedur/XAMPP](protseduurXAMPP.md)] [[Hotelliruum](Hotelliruum.md)] [[Hotelliruum/XAMPP](hotellstseblokina.sql)] [[Triger](triger.md)]


## Trigger  - triger -päästik
- andmebaasi object, mis automaatselt käivitud tabeli sündmused (INSERT, UPDATE, DELETE).

```sql
Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

 --tabel, mis täidab triger 
Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
kasutaja varchar(25),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT --triger automaarselt lisab mida sekretaar lisas/kustutas tabelisse linnad
)

select * from linnad;
select * from logi;

CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;

--kontollimiseks Insert into linnad
INSERT INTO linnad(linnanimi,rahvaarv)
VALUES ('Tallinn',4500000);

--trigeri muutmine
ALTER TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
CONCAT(' linn: ', inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
FROM inserted;
 ```


<img width="600" height="284" alt="{A72639DC-3B91-46BC-81B5-BBE3BF45E85C}" src="https://github.com/user-attachments/assets/dcdb1397-6c3a-4032-aa67-46220fcd9fca" />



```sql
CREATE TRIGGER linnaUuendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR UPDATE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud UPDATE käsk',  --toiming
CONCAT('VANAD: linn: ', deleted.linnanimi , ' rahvaarv: ', deleted.rahvaarv,
'UUED: linn: ', inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)
FROM deleted INNER JOIN inserted
ON deleted.linnID=inserted.linnID;

--kontrollimiseks tuleb uuendada tabeli linn
UPDATE linnad SET linnanimi='Tallinn-suur',rahvaarv=100000 WHERE linnID=2;
select * from linnad;
select * from logi;
```
<img width="663" height="277" alt="{CE40322A-77E9-43C4-872C-03E49B4BDAA5}" src="https://github.com/user-attachments/assets/b32161d1-74c3-4a5a-be2c-4470dc92f06c" />



<img width="670" height="280" alt="{B5DA57C0-2DD2-4766-A409-205FEDF6E98A}" src="https://github.com/user-attachments/assets/d3c6fc9e-4d45-41b9-af01-49f1ccb91a2e" />

```sql
CREATE TRIGGER linnaKustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud DELETE käsk',  --toiming
CONCAT(' linn: ', deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv)  --andmed
FROM deleted;


--kontroll--kustutada tabelist linnad
DELETE FROM linnad WHERE linnId=3;
select * from linnad;
select * from logi;
```



<img width="674" height="648" alt="{0B582AC0-6FDB-4E66-BD5E-19407E94E269}" src="https://github.com/user-attachments/assets/f4b64e12-4f31-436f-b409-d3c55e9b86cf" />

<img width="666" height="298" alt="{65791D06-C213-47D2-A09A-7E847EDA1918}" src="https://github.com/user-attachments/assets/84d45019-4dec-42a4-b2cc-ddfec56dd5f1" />


