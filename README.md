## Andmetebaasid
andmetebaasidega seotud SQL kood ja konspektid
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
    ```
    CREATE TABLE opilane(
opilaneId int Primary Key identity(1,1),--automaatselt täidab numbritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) );
    ```
  -  Andmete sisestamine tabelisse
   ```
    ```
